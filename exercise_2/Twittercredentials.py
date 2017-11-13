import tweepy

consumer_key = "47XwlvS12FtcQtYtuPTiZOybV";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "xpIIYM9DJVZWmDPfz2MI5JcUcrHSRn2uu563IZ29wSRDU5FFRx";
#eg: consumer_secret = "xpIIYM9DJVZWmDPfz2MI5JcUcrHSRn2uu563IZ29wSRDU5FFRx";

access_token = "57539958-qm7sZ8juWkJm45qLx2z5yHCcpdPDN13w9TXjFH8YL";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "e6Q6YF4qLFyoE7ANPUd2E4ddSFV8Tz3FA7L4OvjdIdrT4";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



