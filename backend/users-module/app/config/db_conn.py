from os import getenv
import pymongo
from dotenv import load_dotenv

load_dotenv()
client = pymongo.MongoClient(getenv("MONGO_DETAILS"))
db = client[getenv("DB_NAME")]
user_collection = db.get_collection(name=getenv(key="COLLECTION_NAME"))
# try:
#     client.admin.command('ping')
#     print("Pinged your deployment. You successfully connected to MongoDB!")
# except Exception as e:
#     print(e)
#     print("Unable to connect to MongoDB. Check your connection details.")
