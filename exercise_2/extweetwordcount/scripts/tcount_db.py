import psycopg2

class TCountDB:
	def __init__(self):
		self.db_name = "tcount"
		self.user = "postgres"
		self.password = "pass"
		self.host = "localhost"
		self.port = "5432"

	def get_connection(self):
		return psycopg2.connect(database=self.db_name, user=self.user, password=self.password, host=self.host, port=self.port)
