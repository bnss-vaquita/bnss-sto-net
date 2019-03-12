from hashlib import sha256
from base64 import b64encode, b64decode
import sys

SALT_SIZE = 12

def hashPassword(password, salt):
	ctx = sha256(password)
	ctx.update(salt)

	hash = b"{SSHA256}" + b64encode(ctx.digest() + salt)
	
	hash_clean = b64encode(ctx.digest() + salt)

	print("\nattribute: SSHA2-256-Password")
	print("NB: save in the DB without {..}\n")

	print("sha256 + salt = " + str(ctx.hexdigest() + str(salt)))
	print("hashed_password = " + str(hash_clean))

	return hash_clean

def checkPassword(challenge_password, password):
	print("\n\nChecking password with RADIUS Database password.. ")

	decoded_hash = b64decode(challenge_password)
	salt = decoded_hash[32:]
	digest = decoded_hash[:-SALT_SIZE]	

	hashed_password = sha256(password + salt)

	print("Password is correct? " + str(hashed_password.digest() == digest))
	return hashed_password.digest() == digest


password = sys.argv[1]
db_password = sys.argv[2]

if checkPassword(db_password, password):
	exit(0)
else:
	exit(1)