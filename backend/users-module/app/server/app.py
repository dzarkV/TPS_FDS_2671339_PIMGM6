from fastapi import FastAPI
from routes.usuario import usuario as UsuarioRouter 
from routes.login import login as LoginRouter


app = FastAPI(title='Users module', 
    description='API REST de servicio de usuarios del sistema MGM', 
    version='0.0.1')

app.include_router(UsuarioRouter, tags=["Usuarios"])
app.include_router(LoginRouter, tags=["Login"])

@app.get('/', tags=['Root'])
def root_page():
    return {'message': 'Qué hace'}

