-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

DROP TABLE IF EXISTS players CASCADE;
DROP TABLE IF EXISTS matches CASCADE;

CREATE TABLE players (
  id SERIAL PRIMARY KEY,
  name VARCHAR(20) NOT NULL
);

CREATE TABLE matches (
  id SERIAL PRIMARY KEY,
  winner INT REFERENCES players(id),
  loser INT REFERENCES players(id)
);

CREATE VIEW count AS
  SELECT players.id, count(matches.winner) AS n FROM players
  LEFT JOIN matches ON players.id = matches.winner
  OR players.id = matches.loser
  GROUP BY players.id;

CREATE VIEW wins AS
  SELECT players.id, count(matches.winner) AS n FROM players
  LEFT JOIN matches ON players.id =  matches.winner
  GROUP BY players.id;

CREATE VIEW standings AS
  SELECT players.id, players.name, wins.n AS wins, count.n AS matches_played
      FROM players, wins, count
      WHERE players.id = wins.id and players.id = count.id
      ORDER BY wins DESC;
