DROP DATABASE tcount;

CREATE DATABASE tcount;

\c tcount;

CREATE TABLE tweetwordcount(
  word TEXT NOT NULL,
  count INT NOT NULL);


