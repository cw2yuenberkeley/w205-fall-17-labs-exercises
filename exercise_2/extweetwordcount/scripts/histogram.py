import sys
from tcount_db import TCountDB

def show_usage_and_exit():
	print "Usage:"
	print "python histogram.py {min_count},{max_count}"
	print ""
	print "where {min_count} and {max_count} are integers"
	exit()

if __name__ == '__main__':
	if len(sys.argv) != 2:
		show_usage_and_exit()

	s = sys.argv[1].split(',')

	if len(s) != 2:
		show_usage_and_exit()

	try:	
		min_count = int(s[0])
		max_count = int(s[1])
	except:
		show_usage_and_exit()

	c = TCountDB().get_connection()
	cur = c.cursor()
	cur.execute("SELECT word, count FROM tweetwordcount WHERE count >= %d AND count <= %d" % (min_count, max_count))
	results = cur.fetchall()
	for r in results:
		print "%s: %d" % (r[0], r[1])
	c.commit()
	c.close()


