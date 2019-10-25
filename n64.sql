         List of relations
 Schema | Name  | Type  |  Owner
--------+-------+-------+----------
 public | games | table | postgres
(1 row)


sql64=# SELECT * FROM games;
 id |                  title                   | year |  developers  |         genre
----+------------------------------------------+------+--------------+------------------------
  1 | The Legend of Zelda: The Ocarina of Time | 1998 | Nintendo EAD | Action-Adventure
  2 | The Legend of Zelda: The Ocarina of Time | 1998 | Nintendo EAD | Action-Adventure
  3 | Super Mario 64                           | 1996 | Nintendo EAD | Platforming
  4 | Golden Eye 007                           | 1997 | Rare         | First-Person Shooter
  5 | Mario Kart 64                            | 1996 | Nintendo EAD | Racing
  6 | Star Fox 64                              | 1997 | Nintendo EAD | Rail/Scrolling Shooter
  7 | Perfect Dark                             | 2000 | Rare         | First-Person Shooter
  8 | Star Wars: Shadow of the Empire          | 1996 | Lucas Arts   | Action
  9 | Banjo-Kazooie                            | 1998 | Rare         | Platforming
 10 | Mario Party                              | 1998 | Hudson Soft  | Party Game
 11 | Tony Hawk's Pro Skater                   | 1996 | Neversoft    | Extreme Sports
(11 rows)


sql64=# SELECT * FROM games WHERE TITLE;
ERROR:  argument of WHERE must be type boolean, not type character varying
LINE 1: SELECT * FROM games WHERE TITLE;
                                  ^
sql64=# SELECT * FROM title;
ERROR:  relation "title" does not exist
LINE 1: SELECT * FROM title;
                      ^
sql64=# SELECT games FROM title;
ERROR:  relation "title" does not exist
LINE 1: SELECT games FROM title;
                          ^
sql64=# SELECT games FROM Title;
ERROR:  relation "title" does not exist
LINE 1: SELECT games FROM Title;
                          ^
sql64=# SELECT * FROM games;
 id |                  title                   | year |  developers  |         genre
----+------------------------------------------+------+--------------+------------------------
  1 | The Legend of Zelda: The Ocarina of Time | 1998 | Nintendo EAD | Action-Adventure
  2 | The Legend of Zelda: The Ocarina of Time | 1998 | Nintendo EAD | Action-Adventure
  3 | Super Mario 64                           | 1996 | Nintendo EAD | Platforming
  4 | Golden Eye 007                           | 1997 | Rare         | First-Person Shooter
  5 | Mario Kart 64                            | 1996 | Nintendo EAD | Racing
  6 | Star Fox 64                              | 1997 | Nintendo EAD | Rail/Scrolling Shooter
  7 | Perfect Dark                             | 2000 | Rare         | First-Person Shooter
  8 | Star Wars: Shadow of the Empire          | 1996 | Lucas Arts   | Action
  9 | Banjo-Kazooie                            | 1998 | Rare         | Platforming
 10 | Mario Party                              | 1998 | Hudson Soft  | Party Game
 11 | Tony Hawk's Pro Skater                   | 1996 | Neversoft    | Extreme Sports
(11 rows)


sql64=# SELECT * FROM title;
ERROR:  relation "title" does not exist
LINE 1: SELECT * FROM title;
                      ^
sql64=# SELECT title FROM Games;
                  title
------------------------------------------
 The Legend of Zelda: The Ocarina of Time
 The Legend of Zelda: The Ocarina of Time
 Super Mario 64
 Golden Eye 007
 Mario Kart 64
 Star Fox 64
 Perfect Dark
 Star Wars: Shadow of the Empire
 Banjo-Kazooie
 Mario Party
 Tony Hawk's Pro Skater
(11 rows)


sql64=# SELECT year FROM games;
 year
------
 1998
 1998
 1996
 1997
 1996
 1997
 2000
 1996
 1998
 1998
 1996
(11 rows)


sql64=# SELECT *FROM games WHERE games.developers = 'Rare';
 id |     title      | year | developers |        genre
----+----------------+------+------------+----------------------
  4 | Golden Eye 007 | 1997 | Rare       | First-Person Shooter
  7 | Perfect Dark   | 2000 | Rare       | First-Person Shooter
  9 | Banjo-Kazooie  | 1998 | Rare       | Platforming
(3 rows)


sql64=# SELECT * FROM games WHERE year < 1988
sql64-# SELECT * FROM games WHERE year < 1998;
ERROR:  syntax error at or near "SELECT"
LINE 2: SELECT * FROM games WHERE year < 1998;
        ^
sql64=# SELECT * FROM games WHERE year < 1998
sql64-# ;
 id |              title              | year |  developers  |         genre
----+---------------------------------+------+--------------+------------------------
  3 | Super Mario 64                  | 1996 | Nintendo EAD | Platforming
  4 | Golden Eye 007                  | 1997 | Rare         | First-Person Shooter
  5 | Mario Kart 64                   | 1996 | Nintendo EAD | Racing
  6 | Star Fox 64                     | 1997 | Nintendo EAD | Rail/Scrolling Shooter
  8 | Star Wars: Shadow of the Empire | 1996 | Lucas Arts   | Action
 11 | Tony Hawk's Pro Skater          | 1996 | Neversoft    | Extreme Sports
(6 rows)


sql64=# SELECT AVG(YEAR) FROM games WHERE developers = 'Nintendo EAD';
          avg
-----------------------
 1997.0000000000000000
(1 row)


sql64=# SELECT developers FROM games ORDER BY developers ASC;
  developers
--------------
 Hudson Soft
 Lucas Arts
 Neversoft
 Nintendo EAD
 Nintendo EAD
 Nintendo EAD
 Nintendo EAD
 Nintendo EAD
 Rare
 Rare
 Rare
(11 rows)


sql64=# SELECT * FROM games WHERE year < 1998 ORDER BY year ASC;
 id |              title              | year |  developers  |         genre
----+---------------------------------+------+--------------+------------------------
  3 | Super Mario 64                  | 1996 | Nintendo EAD | Platforming
  5 | Mario Kart 64                   | 1996 | Nintendo EAD | Racing
  8 | Star Wars: Shadow of the Empire | 1996 | Lucas Arts   | Action
 11 | Tony Hawk's Pro Skater          | 1996 | Neversoft    | Extreme Sports
  4 | Golden Eye 007                  | 1997 | Rare         | First-Person Shooter
  6 | Star Fox 64                     | 1997 | Nintendo EAD | Rail/Scrolling Shooter
(6 rows)


sql64=# ls
sql64-# cd ../
sql64-# ls
sql64-# \dt
         List of relations
 Schema | Name  | Type  |  Owner
--------+-------+-------+----------
 public | games | table | postgres
(1 row)


sql64-# \l
                                                 List of databases
   Name    |  Owner   | Encoding |          Collate           |           Ctype            |   Access privileges
-----------+----------+----------+----------------------------+----------------------------+-----------------------
 movies    | postgres | UTF8     | English_United States.1252 | English_United States.1252 |
 n64       | postgres | UTF8     | English_United States.1252 | English_United States.1252 |
 postgres  | postgres | UTF8     | English_United States.1252 | English_United States.1252 |
 sql64     | postgres | UTF8     | English_United States.1252 | English_United States.1252 |
 template0 | postgres | UTF8     | English_United States.1252 | English_United States.1252 | =c/postgres          +
           |          |          |                            |                            | postgres=CTc/postgres
 template1 | postgres | UTF8     | English_United States.1252 | English_United States.1252 | =c/postgres          +
           |          |          |                            |                            | postgres=CTc/postgres
(6 rows)
