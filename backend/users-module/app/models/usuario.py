from pydantic import BaseModel, Field, constr
from typing import Optional, Union
from datetime import date
from models.rol import Rol, UpdateRol
from models.credencial import Credencial, UpdateCredencial

class Usuario(BaseModel):

    nombre_usuario: constr(
        strict=True, min_length=3, max_length=20) = Field(..., example='Dinense')
    apellido_usuario: constr(
        strict=True, min_length=3, max_length=20) = Field(..., example='Pardo')
    fecha_registro: Union[date|str] = date.today()
    rol_usuario: Rol
    credenciales: Credencial

    class Config:
        allow_population_by_field_name = True
        arbitrary_types_allowed = True
        schema_extra = {
            "example": {
                "nombre_usuario": "Segundo",
                "apellido_usuario": "Pardo",
                "rol_usuario": {
                    "id_rol": 101,
                    "nombre_rol": "Administrador"
                },
                "credenciales": {
                    "usuario": "segundopa",
                    "contrasena": "secret123",
                    "estado": True
                }
            }
        }

class UpdateUsuario(BaseModel):
    nombre_usuario: Optional[str]
    apellido_usuario: Optional[str]
    fecha_registro: Optional[date]
    rol_usuario: Optional[UpdateRol]
    credenciales: Optional[UpdateCredencial]

    class Config:
        allow_population_by_field_name = True
        arbitrary_types_allowed = True
        schema_extra = {
            "example": {
                "nombre_usuario": "Tercero",
                "apellido_usuario": "Fontecha",
                "rol_usuario": {
                    "id_rol": 102,
                    "nombre_rol": "Vendedor"
                },
                "credenciales": {
                    "usuario": "terceropa",
                    "contrasena": "secret122",
                    "estado": True
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