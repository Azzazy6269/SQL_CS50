SELECT "salary" , "year" FROM salaries INNER JOIN players ON salaries.player_id = players.id WHERE players.first_name = 'Cal' AND players.last_name = 'Ripken' ORDER BY "year" DESC ;
