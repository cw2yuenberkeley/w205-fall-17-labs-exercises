import sys
import psycopg2
from tcount_db import TCountDB

if __name__ == "__main__":
	if len(sys.argv) > 2:
		print "Please input only one or zero argument."	
		exit()

	# Get DB connection
	c = TCountDB().get_connection()
	cur = c.cursor()

	# Check if there is exactly one argument 
	if len(sys.argv) == 2:	
		word = sys.argv[1]
		cur.execute("SELECT count FROM tweetwordcount WHERE word = '%s'" % word)
		results = cur.fetchall()
		c.commit()
		
		count = 0 if len(results) == 0 else results[0][0]
		print 'Total number of occurrences of "%s": %d' % (word, count)

	# Check if there is no argument
	elif len(sys.argv) == 1:
		cur.execute("SELECT word, count FROM tweetwordcount ORDER BY word")
		results = cur.fetchall()
		for r in results:
			print "(%s, %d)" % (r[0], r[1])
		
		c.commit()	

	c.close()	
