from pydantic import BaseModel
from typing import Optional


class Rol(BaseModel):
    id_rol: int
    nombre_rol: Optional[str] = None

class UpdateRol(BaseModel):
    nombre_rol: Optional[str] = None
    