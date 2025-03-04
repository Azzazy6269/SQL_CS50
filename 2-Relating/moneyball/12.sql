WITH per_hit AS (
  SELECT (salaries.salary / NULLIF(performances.H, 0)) AS players_per_hit, salaries.player_id AS player_id FROM salaries
  INNER JOIN performances ON salaries.player_id = performances.player_id AND salaries.year = performances.year 
  WHERE performances.year = 2001 
  )
  ,per_RBI AS (
  SELECT (salaries.salary / NULLIF(performances.RBI, 0)) AS players_per_RBI, salaries.player_id AS player_id FROM salaries 
  INNER JOIN performances ON salaries.player_id = performances.player_id AND salaries.year = performances.year 
  WHERE performances.year = 2001 
  )
  SELECT players.first_name, players.last_name FROM players 
  INNER JOIN per_hit ON players.id = per_hit.player_id 
  INNER JOIN per_RBI ON players.id = per_RBI.player_id 
  WHERE per_hit.players_per_hit IS NOT NULL AND per_hit.players_per_hit != 0 AND per_RBI.players_per_RBI IS NOT NULL AND per_RBI.players_per_RBI != 0 
  ORDER BY players.id ASC LIMIT 10;
