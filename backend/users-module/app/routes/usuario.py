from fastapi import APIRouter, Body
from fastapi.encoders import jsonable_encoder

from controllers.usuario import (
    add_user,
    delete_user,
    retrieve_user,
    retrieve_users,
    update_user,
)

from models.usuario import (
    ErrorResponseModel,
    ResponseModel,
    Usuario,
    UpdateUsuario,
)

usuario = APIRouter()

@usuario.post("/usuario", response_description="Usuario agregado a la base de datos")
def add_usuario_data(usuario: Usuario = Body(...)):
    usuario = jsonable_encoder(usuario)
    print("--------------> ", usuario)
    new_usuario = add_user(usuario)
    return ResponseModel(new_usuario, "Usuario agregado exitosamente.")

