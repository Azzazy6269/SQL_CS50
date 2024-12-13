SELECT salary FROM salaries INNER JOIN performances ON salaries.player_id = performances.player_id WHERE performances.HR = (SELECT MAX(HR)FROM performances ) AND salaries.year =2001 ;
