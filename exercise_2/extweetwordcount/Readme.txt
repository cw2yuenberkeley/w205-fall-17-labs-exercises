Setup Instructions:
1. Setup and start postgres by running the following commands:
	- wget https://s3.amazonaws.com/ucbdatasciencew205/setup_ucb_complete_plus_postgres.sh
	- chmod +x ./setup_ucb_complete_plus_postgres.sh
	- ./setup_ucb_complete_plus_postgres.sh {device_path}
		Where {device_path} is where you want to set up the data for postgres and other setup
2. Switch to w205 user
	- Execute "su - w205"
3. Setup tcount database and tweetwordcount table
	- Navigate to the /exercise_2/extweetwordcount/db_setup/ folder
	- Execute "psql -U postgres -f setup.sql"
		Note that running this command drops the previous tcount database and tweetwordcount table

Starting the Twitter application
1. Navigate to the /exercise_2/extweetwordcount/ folder
2. Execute "sparse run"
3. The application will run indefinitely until you kill it with CTRL+C

Running finalresults.py
1. Navigate to the /exercise_2/extweetwordcount/scripts/ folder
2. Execute one of the following commands
	- python finalresults.py {word}
		Where {word} is the word to get the occurrence count for
		When passed a single word as an argument, finalresults.py returns the total number of word occurrences in the stream.
	- python finalresults.py
		Running finalresults.py without an argument returns all the words in the stream, and their total count of occurrences, worted alphabetically, one word per line.

Running histogram.py
1. Navigate to the /exercise_2/extweetwordcount/scripts/ folder
2. Execute the following command
	- python histogram.py {min_count},{max_count}
		Where {min_count} and {max_count} are integers
		Note that there is no space between {min_count} and {max_count}
		The script returns all the words with a total number of occurrences greater than or equal to {min_count}, and less than or equal to {max_count}.	