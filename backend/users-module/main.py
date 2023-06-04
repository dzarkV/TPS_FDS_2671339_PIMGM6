from fastapi import Depends, FastAPI
# parte de token con OAuth2
from typing import Annotated
from fastapi.security import OAuth2PasswordBearer
from models.usuario import Usuario
from models.rol import Rol



app = FastAPI(title='Users module', 
    description='API REST de servicio de usuarios del sistema MGM', 
    version='0.0.1')


@app.get('/')
def root_page():
    return {'message': 'Qué hace, socio'}

oauth_scheme = OAuth2PasswordBearer(tokenUrl='/login')

@app.get('/login')
def login(token: Annotated[str, Depends(oauth_scheme)]):
    return {'message': 'Login: ' + token}
