from typing import Annotated
from fastapi import APIRouter, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from models.usuario import Usuario
from controllers.usuario import retrieve_user_by_username
from werkzeug.security import check_password_hash

login = APIRouter()

oauth2_scheme = OAuth2PasswordBearer(tokenUrl='/token')


# def fake_hash_password(password: str):
#     return "fakehashed" + password

def decode_pass(pass_hashed: str, form_pass: str):
    return True if check_password_hash(pwhash=pass_hashed, password=form_pass) else False
    
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

@login.post("/token")
async def do_login_with_token(
                        form_data: Annotated[OAuth2PasswordRequestForm, Depends()]):
    user = retrieve_user_by_username(form_data.username)
    if not user:
        raise HTTPException(status_code=401, 
                            detail="Nombre de usuario o contraseña incorrectos")
    # user = UserInDB(**user_dict)
    # hashed_password = fake_hash_password(form_data.password)
    passwd = decode_pass(user["credenciales"]["contrasena"], form_data.password)
    if not passwd:
        raise HTTPException(status_code=401, 
                            detail="Nombre de usuario o contaseña incorrectos")

    return {"access_token": user["credenciales"]["usuario"], "token_type": "bearer"}

@login.get("/api/me")
async def read_users_me(
    current_user: Annotated[Usuario, Depends(oauth2_scheme)]
):
    return current_user