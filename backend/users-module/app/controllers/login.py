
from controllers.usuario import retrieve_user_by_username
from werkzeug.security import check_password_hash
from typing import Union
from datetime import datetime, timedelta
from jose import jwt, JWTError
from os import getenv
from dotenv import load_dotenv

load_dotenv()
def verify_pass(pass_hashed: str, form_pass: str) -> bool:
    return check_password_hash(pwhash=pass_hashed, password=form_pass)
    
# def fake_decode_token(token):
#     # This doesn't provide any security at all
#     # Check the next version
#     user = get_user(fake_users_db, token)
#     return user

def authenticate_user(username: str, password: str) -> bool | dict:
    user = retrieve_user_by_username(username)
    if not user:
        return False
    passwd = verify_pass(user["credenciales"]["contrasena"], password)
    if not passwd:
        return False
    return user

def create_token(data: dict, time_expire: Union[timedelta, None] = None):
    data_copy = data.copy()
    if time_expire is None:
        expire = datetime.utcnow() + timedelta(days=3)
    else:
        expire = datetime.utcnow() + time_expire
    data_copy.update({"exp": expire})
    token_jwt = jwt.encode(data_copy, key=getenv("SECRET_KEY"), 
                            algorithm=getenv("ALGORITHM"))
    return token_jwt