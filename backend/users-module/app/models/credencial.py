from pydantic import BaseModel, Field, constr
from typing import Optional
import uuid

class Credencial(BaseModel):
    id_credencial: Optional[str] = Field(default_factory=uuid.uuid1, alias="_id") 
    usuario: constr(
        strict=True, min_length=3, max_length=20) = Field(..., example='alexandergo')
    contrasena: constr(
        strict=True, min_length=8, max_length=20) = Field(..., example='secret123')
    estado: bool = Field(default=True, example=True)

    # class Config:
    #     allow_population_by_field_name = True
    #     schema_extra = {
    #         "example": {
    #             "usuario": "segundopa",
    #             "contrasena": "secret123",
    #         }
    #     }

class UpdateCredencial(BaseModel):
    usuario: Optional[str]
    contrasena: Optional[str]
    estado: Optional[bool]

    # class Config:
    #     allow_population_by_field_name = True
    #     arbitrary_types_allowed = True
    #     schema_extra = {
    #         "example": {
    #             "usuario": "segundopa",
    #             "contrasena": "secret321"
    #         }
    #     }

