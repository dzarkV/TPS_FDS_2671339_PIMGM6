from fastapi import APIRouter, Depends, HTTPException
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from models.usuario import Usuario
from controllers.login import authenticate_user, create_token
from datetime import timedelta

login = APIRouter()

oauth2_scheme = OAuth2PasswordBearer(tokenUrl='/api/token')

@login.post("/api/token")
def login_with_token(form_data: OAuth2PasswordRequestForm = Depends()):
    user = authenticate_user(form_data.username, form_data.password)
    if not user:
        raise HTTPException(status_code=401, 
                            detail="Nombre de usuario o contraseña incorrectos",
                            headers={"WWW-Authenticate": "Bearer"})
                            
    if user['credenciales']['estado'] is False:
        raise HTTPException(status_code=401, 
                            detail="Usuario inactivo",
                            headers={"WWW-Authenticate": "Bearer"})
    # Token
    access_token_expires = timedelta(days=7)
    access_token_jwt = create_token({"sub": user["credenciales"]["usuario"]},
                                     access_token_expires)

    return {"access_token": access_token_jwt, "token_type": "bearer"}

@login.get("/api/me")
def read_users_me(
    current_user: str | Usuario = Depends(oauth2_scheme)
):
    print(current_user, type(current_user))
    return current_user