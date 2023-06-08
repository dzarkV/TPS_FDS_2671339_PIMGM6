from pydantic import BaseModel, Field, constr
from typing import Union, Optional
from datetime import date
from models.rol import Rol
import uuid

# class User(BaseModel):
#     username: str
#     full_name: str
#     email: str | None = None
#     password: str | None = None
#     disabled: bool | None = None
class Usuario(BaseModel):
    id_usuario: str= Field(default_factory=uuid.uuid4, alias="_id") 
    nombre_usuario: constr(strict=True, min_length=3, max_length=20) = Field(..., example='Dinense')
    apellido_usuario: constr(strict=True, min_length=3, max_length=20) = Field(..., example='Pardo')
    fecha_registro: date = date.today()
    rol_usuario: Optional[Rol | int] = None 

    class Config:
        allow_population_by_field_name = True
        arbitrary_types_allowed = True
        schema_extra = {
            "example": {
                "_id": "066de609-b04a-4b30-b46c-32537c7f1f6e",
                "nombre_usuario": "Dinense",
                "apellido_usuario": "Pardo",
                "fecha_registro": "2021-09-01",
                "rol_usuario": {
                    "id_rol": 1,
                    "nombre_rol": "Administrador"
                }
            }
        }

class UpdateUsuario(BaseModel):
    nombre_usuario: Optional[str]
    apellido_usuario: Optional[str]
    fecha_registro: Optional[date]
    rol_usuario: Optional[Union[Rol | int]]

    class Config:
        allow_population_by_field_name = True
        arbitrary_types_allowed = True
        schema_extra = {
            "example": {
                "nombre_usuario": "Dinense",
                "apellido_usuario": "Pardo",
                "fecha_registro": "2021-09-01",
                "rol_usuario": {
                    "id_rol": 2,
                    "nombre_rol": "Vendedor"
                }
            }
        }

def ResponseModel(data, message):
    return {
        "data": [data],
        "code": 200,
        "message": message,
    }


def ErrorResponseModel(error, code, message):
    return {"error": error, "code": code, "message": message}