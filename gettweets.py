from datetime import datetime,timedelta
import tweepy
import json
import csv
import requests
import time

#twitter keys
consumer_key = 'OmIemP8z6G9wmvAv4a3N9yR6k'
consumer_secret = 'lmUa6me3TQa3N5YSp0Y7m3lJ0XFOOFrC0kk3KZaCu1KQPfJYNB'
access_token = '385988316-ow3vIPPx5pRiHTGYk5SbuVpyk803XFYSBb2Sxqpm'
access_token_secret = 'rwEih4j9lEo9Uy6k65LTqJmO6NvqPXLCJ03oRAkmKXrGA'


# Auth
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth, wait_on_rate_limit=True)

search_terms = 'saqueos'
tweet_list = []

# Open/create a file to append data to
csvFile = open('result2.csv', 'a')

#Use csv writer
csvWriter = csv.writer(csvFile)

tweets = tweepy.Cursor(api.search,
    q = 'saqueo' or 'saqueos',
    lang = "es",
    since= "2020-02-01",
    count= 1000,
    geocode="-34.6159,-58.4406,800km",
    tweet_mode='extended',
    ).items()

for tweet in tweets:
    if tweet.full_text not in tweet_list:
        tweet_list.append(tweet.full_text)
        # csvWriter.writerow([tweet.created_at, tweet.full_text.encode('utf-8')])
        csvWriter.writerow([tweet.created_at, tweet.full_text])


print(tweet_list)
csvFile.close()
