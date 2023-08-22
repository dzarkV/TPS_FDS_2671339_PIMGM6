from pydantic import BaseModel
from typing import Optional


class Rol(BaseModel):
    id_rol: int
    nombre_rol: str

class UpdateRol(BaseModel):
    nombre_rol: Optional[str]

    