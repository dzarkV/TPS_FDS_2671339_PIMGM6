from fastapi import APIRouter, Body, Query
from typing import Annotated
from fastapi.encoders import jsonable_encoder
from models.usuario_finded_by import Usuario_Finded_by

from controllers.usuario import (
    add_user,
    delete_user,
    retrieve_user_by_id,
    retrieve_user_by_name,
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

@usuario.post(
    "/usuario", response_description="Usuario agregado a la base de datos")
def add_usuario_data(usuario: Usuario = Body(...)):
    # print("------------------------------------", usuario.id_usuario.__str__())
    usuario = jsonable_encoder(usuario)
    new_usuario = add_user(usuario)
    return ResponseModel(new_usuario, "Usuario agregado exitosamente.")

@usuario.get(
    "/usuarios", response_description="Usuarios obtenidos de la base de datos")
def get_all_usuarios():
    usuarios = retrieve_all_users()
    if usuarios:
        return ResponseModel(usuarios, "Usuarios obtenidos exitosamente.")
    return ErrorResponseModel(
        "No se encontraron usuarios.", 404, "No se encontraron usuarios.")

@usuario.get(
    "/usuario/{find_by}", response_description="Usuario obtenido de la base de datos")
def get_usuario(
    find_by: Usuario_Finded_by, value: Annotated[str, Query(max_length=25)]):
    usuario = {}
    if find_by == Usuario_Finded_by.id:
        usuario = retrieve_user_by_id(value)
    elif find_by == Usuario_Finded_by.name:
        usuario = retrieve_user_by_name(value)

    if usuario:
        return ResponseModel(usuario, "Usuario obtenido exitosamente.")
    return ErrorResponseModel(
        "No se encontró el usuario.", 404, "No se encontró el usuario.")

@usuario.put("/usuario/update/{id}")
def update_usuario_data(id: str, data: UpdateUsuario = Body(...)):
    user_dict = {k: v for k, v in data.dict().items() if v is not None}
    updated_usuario = update_user(id, user_dict)
    if updated_usuario:
        return ResponseModel(
            "Usuario con ID: {} actualizado exitosamente.".format(id),
            "Usuario actualizado exitosamente.",
        )
    return ErrorResponseModel(
        "Error al actualizar el usuario.", 404, "No se encontró el usuario."
    )
