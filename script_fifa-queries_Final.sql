USE fifawc;

SELECT Attendance
FROM matches;

SELECT * FROM wc;
SELECT * FROM matches;
SELECT * FROM players;

/*
*************************************************************
**                                                         **
**           Brasil es el seleccionado que más             **
**            partidos disputó en mundiales                **
**                                                         **
*************************************************************
*/

-- Select the team name and count the number of appearances for each team
SELECT `Team Name`, COUNT(*) AS appearances
-- Create a derived table `all_teams` which unions both home and away team names
FROM (
    -- Select all home team names from the matches table
    SELECT `Home Team Name` AS `Team Name`
    FROM matches
    UNION ALL
    -- Combine with all away team names from the matches table
    SELECT `Away Team Name` AS `Team Name`
    FROM matches
) AS all_teams
-- Group the results by team name to count the total appearances for each team
GROUP BY `Team Name`
-- Order the results in descending order based on appearances, showing the most frequent teams first
ORDER BY appearances DESC;

-- Create a view
CREATE VIEW team_appearances AS
SELECT `Team Name`, COUNT(*) AS appearances
FROM (
    SELECT `Home Team Name` AS `Team Name`
    FROM matches
    UNION ALL
    SELECT `Away Team Name` AS `Team Name`
    FROM matches
) AS all_teams
GROUP BY `Team Name`
ORDER BY appearances DESC;

-- Los goles promedio por partido han ido disminuyendo mundial a mundial

/*
*************************************************************
**                                                         **
**           Los goles promedio por partido han ido        **
**            disminuyendo mundial a mundial               **
**                                                         **
*************************************************************
*/


-- Select the year and the average goals scored per match for each year
SELECT 
    year_id, 
    -- Calculate the average goals scored per match by dividing total goals by matches played
    GoalsScored / MatchesPlayed AS avg_goals_per_match
FROM wc
-- Order the results by year in ascending order
ORDER BY year_id;

-- Create a view
CREATE VIEW avg_goals_per_match_view AS
SELECT 
    year_id, 
    GoalsScored / MatchesPlayed AS avg_goals_per_match
FROM wc;

/*
*************************************************************
**                                                         **
**         Los partidos de la final suelen tener menor	   **
**     diferencia de goles en comparación con otras fases  **
**                                                         **
*************************************************************
*/

-- Select the stage of the tournament and the average goal difference
SELECT 
    Stage,
    -- Calculate the average absolute goal difference and round it to 2 decimal places
    ROUND(AVG(ABS(`Home Team Goals` - `Away Team Goals`)), 2) AS avg_goal_difference
FROM matches
-- Group the results by the stage of the tournament
GROUP BY Stage
-- Order the results by average goal difference in ascending order
ORDER BY avg_goal_difference;

-- Create a view
CREATE VIEW average_goal_differences_by_stage AS
SELECT 
    Stage,
    ROUND(AVG(ABS(`Home Team Goals` - `Away Team Goals`)), 2) AS avg_goal_difference
FROM matches
GROUP BY Stage
ORDER BY avg_goal_difference;

/*
*************************************************************
**                                                         **
**         				Other findings					   **
**                                                         **
**                                                         **
*************************************************************
*/


-- Número de partidos por jugador

SELECT `Player Name`, COUNT(DISTINCT `MatchID`) AS num_partidos
FROM players
GROUP BY `Player Name`
ORDER BY num_partidos DESC
LIMIT 10;
