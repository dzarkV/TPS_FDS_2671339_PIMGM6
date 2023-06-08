from fastapi import APIRouter, Body
from fastapi.encoders import jsonable_encoder

from controllers.usuario import (
    add_user,
    delete_user,
    retrieve_user,
    retrieve_all_users,
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
    new_usuario = add_user(usuario)
    return ResponseModel(new_usuario, "Usuario agregado exitosamente.")

@usuario.get("/usuarios", response_description="Usuarios obtenidos de la base de datos")
def get_usuarios():
    usuarios = retrieve_all_users()
    if usuarios:
        return ResponseModel(usuarios, "Usuarios obtenidos exitosamente.")
    return ErrorResponseModel(
        "No se encontraron usuarios.", 404, "No se encontraron usuarios.")

@usuario.get("/usuario/{id}", response_description="Usuario obtenido de la base de datos")
def get_usuario_data(id):
    usuario = retrieve_user(id)
    if usuario:
        return ResponseModel(usuario, "Usuario obtenido exitosamente.")
    return ErrorResponseModel(
        "No se encontró el usuario.", 404, "No se encontró el usuario.")
