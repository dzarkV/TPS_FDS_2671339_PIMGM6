from typing import Annotated

from fastapi import Depends, FastAPI, HTTPException, status
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from models.usuario import Usuario
from routes.usuario import usuario as UsuarioRouter
# from models.rol import Rol


app = FastAPI(title='Users module', 
    description='API REST de servicio de usuarios del sistema MGM', 
    version='0.0.1')

app.include_router(UsuarioRouter, tags=["Usuario"])

@app.get('/', tags=['Root'])
def root_page():
    return {'message': 'Qué hace'}

oauth_scheme = OAuth2PasswordBearer(tokenUrl='/token')

#DB
fake_users_db = {
    "dinensep": {
        "username": "dinensep",
        "full_name": "Dinense Pardo",
        "email": "segundop@sistemamgm.com",
        "password": "12345",
        "disabled": False,
    },
    "segundop": {
        "username": "segundop",
        "full_name": "Segundo Fontecha",
        "email": "alice@sistemamgm.com",
        "password": "12345",
        "disabled": True,
    }
}

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

async def get_current_user(token: Annotated[str, Depends(oauth_scheme)]):
    user = get_user(fake_users_db, token)
    if not user:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Credenciales de autenticación inválidas",
            headers={"WWW-Authenticate": "Bearer"},
        )
    return user

async def get_current_active_user(
    current_user: Annotated[Usuario, Depends(get_current_user)]
):
    if current_user["disabled"]:
        raise HTTPException(status_code=400, detail="usuario inactivo")
    return current_user

@app.post("/token")
async def login(form_data: Annotated[OAuth2PasswordRequestForm, Depends()]):
    user = fake_users_db.get(form_data.username)
    flat_password = form_data.password
    print(user)
    if not user:
        raise HTTPException(status_code=400, detail="Nombre de usuario o contaseña incorrectos")
    # user = UserInDB(**user_dict)
    # hashed_password = fake_hash_password(form_data.password)
    if not flat_password == user["password"]:
        raise HTTPException(status_code=400, detail="Nombre de usuario o contaseña incorrectos")

    return {"access_token": user["username"], "token_type": "bearer"}

@app.get("/users/me")
async def read_users_me(
    current_user: Annotated[Usuario, Depends(get_current_active_user)]
):
    return current_user