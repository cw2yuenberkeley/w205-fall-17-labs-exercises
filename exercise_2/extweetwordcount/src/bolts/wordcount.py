from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt
import psycopg2

import sys

class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()
	self.conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")

    def process(self, tup):
        word = tup.values[0]

	cur = self.conn.cursor()
        cur.execute("INSERT INTO tweetwordcount (word, count)(SELECT '%s', 0 WHERE NOT EXISTS \
		(SELECT word FROM tweetwordcount WHERE word = '%s'))" % (word, word))
	cur.execute("UPDATE tweetwordcount SET count = count + 1 WHERE word = '%s'" % word)
	self.conn.commit()

        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))
