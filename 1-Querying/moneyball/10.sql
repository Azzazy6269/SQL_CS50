SELECT players.first_name, players.last_name, salaries.salary, performances.HR AS home_runs, salaries.year FROM players 
  INNER JOIN salaries ON players.id = salaries.player_id 
  INNER JOIN performances ON players.id = performances.player_id AND salaries.year = performances.year 
  ORDER BY players.id ASC, salaries.year DESC, performances.HR DESC, salaries.salary DESC;
