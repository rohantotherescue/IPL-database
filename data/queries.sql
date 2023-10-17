-- first imported the csv file

--------------------------------------

LOAD DATA INFILE "players.csv" INTO TABLE player COLUMNS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' ESCAPED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

--------------------------------------

INSERT INTO coach VALUES (1, 'Mahela', 'Jayawardene', 10, '1978-09-13', 'Head Coach', 6);