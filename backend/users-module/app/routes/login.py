from typing import Annotated

from fastapi import APIRouter, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from models.usuario import Usuario

oauth_scheme = OAuth2PasswordBearer(tokenUrl='/token')

login = APIRouter()

# def fake_hash_password(password: str):
#     return "fakehashed" + password

def get_user(db, username: str):
    if username in db:
        return db[username]

# def fake_decode_token(token):
#     # This doesn't provide any security at all
#     # Check the next version
#     user = get_user(fake_users_db, token)
#     return user

# async def get_current_user(token: Annotated[str, Depends(oauth_scheme)]):
#     user = get_user(fake_users_db, token)
#     if not user:
#         raise HTTPException(
#             status_code=status.HTTP_401_UNAUTHORIZED,
#             detail="Credenciales de autenticación inválidas",
#             headers={"WWW-Authenticate": "Bearer"},
#         )
#     return user

# async def get_current_active_user(
#     current_user: Annotated[Usuario, Depends(get_current_user)]
# ):
#     if current_user["disabled"]:
#         raise HTTPException(status_code=400, detail="usuario inactivo")
#     return current_user

# @login.post("/token")
# async def login(form_data: Annotated[OAuth2PasswordRequestForm, Depends()]):
#     user = fake_users_db.get(form_data.username)
#     flat_password = form_data.password
#     print(user)
#     if not user:
#         raise HTTPException(status_code=400, 
#                             detail="Nombre de usuario o contaseña incorrectos")
#     # user = UserInDB(**user_dict)
#     # hashed_password = fake_hash_password(form_data.password)
#     if not flat_password == user["password"]:
#         raise HTTPException(status_code=400, 
#                             detail="Nombre de usuario o contaseña incorrectos")

#     return {"access_token": user["username"], "token_type": "bearer"}

# @login.get("/users/me")
# async def read_users_me(
#     current_user: Annotated[Usuario, Depends(get_current_active_user)]
# ):
#     return current_user