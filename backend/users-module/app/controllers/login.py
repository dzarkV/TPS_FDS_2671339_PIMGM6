
from fastapi import Depends, HTTPException
from controllers.usuario import retrieve_user_by_username
from werkzeug.security import check_password_hash
from fastapi.security import OAuth2PasswordBearer
from typing import Union
from datetime import datetime, timedelta
from jose import jwt, JWTError
from os import getenv
from dotenv import load_dotenv

load_dotenv()

oauth2_scheme = OAuth2PasswordBearer(tokenUrl='/api/token')

def verify_pass(pass_hashed: str, form_pass: str) -> bool:
    '''Verify password'''
    return check_password_hash(pwhash=pass_hashed, password=form_pass)
    
def decode_token(token: str = Depends(oauth2_scheme)) -> dict:
    '''Decode token'''
    credential_exception = HTTPException(status_code=401, 
                                detail="Usuario no encontrado",
                                headers={"WWW-Authenticate": "Bearer"})
    try:
        token_decode = jwt.decode(token=token, 
                                    key=getenv("SECRET_KEY"), 
                                    algorithms=[getenv("ALGORITHM")])
        username = token_decode.get("sub")
        if username is None:
            raise credential_exception
    except JWTError:
        raise credential_exception

    user = retrieve_user_by_username(username)
    if user is None:
        raise credential_exception
    del user["credenciales"]["contrasena"]
    return user

def authenticate_user(username: str, password: str) -> bool | dict:
    '''Authenticate user'''
    user = retrieve_user_by_username(username)
    if not user:
        return False
    passwd = verify_pass(user["credenciales"]["contrasena"], password)
    if not passwd:
        return False
    return user

def create_token(data: dict, time_expire: Union[timedelta, None] = None) -> str:
    '''Create token'''
    data_copy = data.copy()
    if time_expire is None:
        expire = datetime.utcnow() + timedelta(days=5)
    else:
        expire = datetime.utcnow() + time_expire
    data_copy.update({"exp": expire})
    token_jwt = jwt.encode(data_copy, key=getenv("SECRET_KEY"), 
                            algorithm=getenv("ALGORITHM"))
    
    return token_jwt
