from pydantic import BaseModel
# from typing import Optional
from datetime import date

# class Usuario(BaseModel):
#     id_usuario: int
#     nombre_usuario: str
#     apellido_usuario: str
#     fecha_registro: date = date.today()
#     rol_usuario: int | None = None
class User(BaseModel):
    username: str
    full_name: str
    email: str | None = None
    password: str | None = None
    disabled: bool | None = None
