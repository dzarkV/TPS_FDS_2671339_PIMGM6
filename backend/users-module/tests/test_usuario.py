import pytest 
from app.controllers.usuario import (
    retrieve_all_users,
    retrieve_user_by_id,
    user_helper,
    add_user
)


class TestControllerUsuario:
    """
    Pruebas unitarias para controlador usuario
    """ 

    USUARIO_VALIDO = {
            "_id": "60a7b3b6e4b9f9b5f0e1b1a2",
            "nombre_usuario": "nombre_user",
            "apellido_usuario": "apellido_user",
            "fecha_registro": "2021-05-01",
            "rol_usuario": {
                "id_rol": "101",
                "nombre_rol": "test_rol"
            },
            "credenciales": {
                "usuario": "test_user",
                "contrasena": "test_password",
                "estado": "activo"
            }
        }

    def test_user_helper(self):
        assert user_helper(self.USUARIO_VALIDO) == {
            "id_usuario": "60a7b3b6e4b9f9b5f0e1b1a2",
            "nombre_usuario": "nombre_user",
            "apellido_usuario": "apellido_user",
            "fecha_registro": "2021-05-01",
            "rol_usuario": {
                "id_rol": "101",
                "nombre_rol": "test_rol"
            },
            "credenciales": {
                "usuario": "test_user",
                "contrasena": "test_password",
                "estado": "activo"
            }
        }

    def test_retrieve_all_users(self):
        assert retrieve_all_users() != []


    def test_add_user_valido(self):
        usuario_sin_id = self.USUARIO_VALIDO.copy()
        del usuario_sin_id["_id"]
        usuario_added = add_user(usuario_sin_id)
        del usuario_added["_id"]
        del usuario_added["id_usuario"]
        assert usuario_added == usuario_sin_id


    @pytest.mark.parametrize("ObjectId,expected", [
        ("60a7b3b6e4b9f9b5f0e1b1a2", False),
        (12345678, False),
        ("5678", False),
        ([], False),
        ({"60a7b3b6e4b9f9b5f0e1b1a6"}, False)
    ])
    def test_retrieve_user_by_id_invalid(self, ObjectId, expected):
        assert retrieve_user_by_id(ObjectId) is expected
