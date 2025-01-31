USE fifa;

SELECT DATABASE();

DESCRIBE wc_to_sql;

ALTER TABLE wc_to_sql
ADD PRIMARY KEY (year_id);

DESCRIBE wc_to_sql;

SHOW CREATE TABLE wc_to_sql;

ALTER TABLE matches_to_sql
ADD PRIMARY KEY (MatchID);

ALTER TABLE matches_to_sql
ADD CONSTRAINT fk_year_id
FOREIGN KEY (year_id) REFERENCES wc_to_sql(year_id);

ALTER TABLE players_to_sql
ADD PRIMARY KEY (player_id);

ALTER TABLE players_to_sql
ADD CONSTRAINT fk_match_id
FOREIGN KEY (MatchID) REFERENCES matches_to_sql(MatchID);

SHOW CREATE TABLE players_to_sql;