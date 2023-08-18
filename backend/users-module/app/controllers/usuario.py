from config.db import user_collection
from bson.objectid import ObjectId

# helpers which convert data from db to python dict 
def user_helper(user) -> dict:
    return {
        "id_usuario": str(user["_id"]),
        "nombre_usuario": user["nombre_usuario"],
        "apellido_usuario": user["apellido_usuario"],
        "fecha_registro": user["fecha_registro"],
        "rol_usuario": user["rol_usuario"],
        "credenciales": user["credenciales"]
    }

# Retrieve all users present in the database
def retrieve_all_users():
    users = []
    for user in user_collection.find():
        users.append(user_helper(user))
    return users


# Add a new user into to the database
def add_user(user_data: dict) -> dict:
    user_id_inserted = user_collection.insert_one(user_data).inserted_id
    new_user = user_collection.find_one({"_id": user_id_inserted})
    return user_helper(new_user)


# Retrieve a user with a matching ID
def retrieve_user_by_id(id: str) -> dict:
    if not ObjectId.is_valid(id):
        return False
    user = user_collection.find_one({"_id": ObjectId(id)})
    if user:
        return user_helper(user)

def retrieve_user_by_name(name: str) -> dict:
    user = user_collection.find_one({"nombre_usuario": name}) 
    if user:
        return user_helper(user)

def retrieve_user_by_username(username: str) -> dict:
    user = user_collection.find_one({"credenciales.usuario": username})
    if user:
        return user_helper(user)

# Update a user with a matching ID
def update_user(id: str, data: dict):
    # Return false if an empty request body is sent.
    if len(data) < 1:
        return False
    # Find the user in db    
    user = user_collection.find_one({"_id": ObjectId(id)})
    if user:
        user_modified = update_dict_recursive(user, data)
        del user_modified["_id"]
        updated_user = user_collection.update_one(
            {"_id": ObjectId(id)}, {"$set": user_modified}
        )
        if updated_user:    
            return True
        return False

# Update user's items in dictionary in a recursive way (because of embedded json)
def update_dict_recursive(original_user, items_modified):
    for key in items_modified.keys():
        if isinstance(original_user[key], dict):
            update_dict_recursive(original_user[key], items_modified[key])
        else:
            original_user[key] = items_modified[key]
    return original_user

# Delete a user from the database
def delete_user(id: str):
    if not ObjectId.is_valid(id):
        return False
    user = user_collection.find_one({"_id": ObjectId(id)})
    if user:
        user_collection.delete_one({"_id": ObjectId(id)})
        return True

