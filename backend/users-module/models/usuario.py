from pydantic import BaseModel
# from typing import Optional
from datetime import date

class Usuario(BaseModel):
    id_usuario: int
    nombre_usuario: str
    apellido_usuario: str
    fecha_registro: date = date.today()
    rol_usuario: int