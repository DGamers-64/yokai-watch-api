default_settings = '''PORT=3000
MODEL="mysql"
MYSQL_DB_HOST="localhost"
MYSQL_DB_USER="root"
MYSQL_DB_PORT=3306
MYSQL_DB_PASSWORD=""
MYSQL_DB_NAME="yokaidb"'''

env = open(".env", "w")
env.write(default_settings)
env.close()