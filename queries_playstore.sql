-- Comments in SQL Start with dash-dash --

-- Find the app with an ID of 1880. --
playstore=# SELECT * FROM analytics WHERE id = 1980;
-[ RECORD 1 ]---+-------------------------------
id              | 1980
app_name        | Meditation Music - Relax, Yoga
category        | PHOTOGRAPHY
rating          | 3.9
reviews         | 129268
size            | 11M
min_installs    | 10000000
price           | 0
content_rating  | Everyone
genres          | {Photography}
last_updated    | 2018-07-30
current_version | 1.32
android_version | 4.1 and up

-- Find the ID and app name for all apps that were last updated on August 01, 2018. --
playstore=# SELECT id, app_name FROM analytics WHERE last_updated = '2018-08-01';
  id  |                                     app_name                                      
------+-----------------------------------------------------------------------------------
   10 | Clash Royale
   11 | Candy Crush Saga
   12 | UC Browser - Fast Download Private & Secure
   74 | Score! Hero
  101 | Tiny Flashlight + LED
  102 | Crossy Road
  103 | SimCity BuildIt
  111 | FIFA Soccer
  112 | Angry Birds 2
  125 | Need for Speed™ No Limits
  126 | YouCam Makeup - Magic Selfie Makeovers
  152 | Fallout Shelter
  159 | DU Recorder – Screen Recorder, Video Editor, Live
  160 | Bike Race Free - Top Motorcycle Racing Games
  161 | KakaoTalk: Free Calls & Text
  162 | Dolphin Browser - Fast, Private & Adblock🐬
  163 | Opera Browser: Fast and Secure
  164 | MARVEL Contest of Champions
  184 | Video Editor Music,Cut,No Crop
  226 | Frozen Free Fall
  260 | Chess Free
  276 | ► MultiCraft ― Free Miner! 👍
  277 | Vlogger Go Viral - Tuber Game
  300 | Bad Piggies
  301 | Skater Boy
  356 | S Photo Editor - Collage Maker , Photo Collage
  357 | Magisto Video Editor & Maker
:

-- Count the number of apps in each category, e.g. “Family | 1972”. --
playstore=# SELECT category, COUNT(*) FROM analytics GROUP BY category;
      category       | count 
---------------------+-------
 BOOKS_AND_REFERENCE |   191
 COMMUNICATION       |   342
 BEAUTY              |    46
 EVENTS              |    52
 PARENTING           |    59
 PHOTOGRAPHY         |   313
 GAME                |  1110
 BUSINESS            |   313
 SOCIAL              |   269
 MEDICAL             |   350
 TOOLS               |   753
 TRAVEL_AND_LOCAL    |   234
 ART_AND_DESIGN      |    63
 LIFESTYLE           |   319
 WEATHER             |    79
 COMICS              |    59
 PRODUCTIVITY        |   360
 PERSONALIZATION     |   329
 FINANCE             |   331
 SPORTS              |   338
 ENTERTAINMENT       |   149
 NEWS_AND_MAGAZINES  |   249
 HOUSE_AND_HOME      |    82
 SHOPPING            |   241
 DATING              |   204
 HEALTH_AND_FITNESS  |   298
 EDUCATION           |   156
:

-- Find the top 5 most-reviewed apps and the number of reviews for each. --
playstore=# SELECT * FROM analytics ORDER BY reviews DESC LIMIT 5;
-[ RECORD 1 ]---+-----------------------------------------
id              | 1
app_name        | Facebook
category        | SOCIAL
rating          | 4.1
reviews         | 78158306
size            | Varies with device
min_installs    | 1000000000
price           | 0
content_rating  | Teen
genres          | {Social}
last_updated    | 2018-08-03
current_version | Varies with device
android_version | Varies with device
-[ RECORD 2 ]---+-----------------------------------------
id              | 2
app_name        | WhatsApp Messenger
category        | SOCIAL
rating          | 4.1
reviews         | 78128208
size            | Varies with device
min_installs    | 1000000000
price           | 0
content_rating  | Teen
genres          | {Social}
last_updated    | 2018-08-03
current_version | Varies with device
android_version | Varies with device
-[ RECORD 3 ]---+-----------------------------------------
:

-- Find the app that has the most reviews with a rating greater than equal to 4.8. --
playstore=# SELECT * FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1;
-[ RECORD 1 ]---+---------------------
id              | 260
app_name        | Chess Free
category        | HEALTH_AND_FITNESS
rating          | 4.8
reviews         | 4559407
size            | Varies with device
min_installs    | 100000000
price           | 0
content_rating  | Everyone
genres          | {"Health & Fitness"}
last_updated    | 2018-08-01
current_version | Varies with device
android_version | Varies with device

-- Find the average rating for each category ordered by the highest rated to lowest rated. --
playstore=# SELECT category, AVG(rating) FROM analytics GROUP BY category ORDER BY avg DESC;
      category       |        avg         
---------------------+--------------------
 EVENTS              |  4.395238104320708
 EDUCATION           |   4.38903223006956
 ART_AND_DESIGN      |  4.347540949211746
 BOOKS_AND_REFERENCE | 4.3423728633061645
 PERSONALIZATION     |    4.3283387457509
 BEAUTY              |  4.299999970656175
 GAME                |  4.287167731498383
 PARENTING           |  4.285714266251545
 HEALTH_AND_FITNESS  | 4.2743944663902464
 SHOPPING            |  4.253648051376507
 SOCIAL              |  4.245669291244717
 WEATHER             |   4.24399998664856
 SPORTS              |  4.233333332576449
 PRODUCTIVITY        |  4.212173904543338
 AUTO_AND_VEHICLES   |  4.200000017881393
 HOUSE_AND_HOME      |  4.197368430463891
 PHOTOGRAPHY         |  4.196116511489967
 MEDICAL             | 4.1926829182520144
 FAMILY              | 4.1904873752761995
 LIBRARIES_AND_DEMO  | 4.1784615259904125
 FOOD_AND_DRINK      |  4.155660354866172
 COMICS              |  4.155172401461108
 COMMUNICATION       |  4.151234589241169
 FINANCE             |  4.146835436549368
 NEWS_AND_MAGAZINES  |  4.130131007281974
 ENTERTAINMENT       |   4.12617449632427
 BUSINESS            |  4.116666667004849
:

-- Find the name, price, and rating of the most expensive app with a rating that’s less than 3. --
playstore=# SELECT app_name, price, rating FROM analytics
playstore-# WHERE rating < 3
playstore-# ORDER BY price DESC
playstore-# LIMIT 1;
      app_name      | price  | rating 
--------------------+--------+--------
 Naruto & Boruto FR | 379.99 |    2.9
(1 row)

-- Find all apps with a min install not exceeding 50, that have a rating. Order your results by highest rated first. --
playstore=# SELECT * FROM analytics WHERE min_installs <= 50
playstore-# AND rating IS NOT NULL
playstore-# ORDER BY rating DESC;
-[ RECORD 1 ]---+-----------------------------------------------
id              | 9468
app_name        | DT
category        | FAMILY
rating          | 5
reviews         | 4
size            | 52M
min_installs    | 50
price           | 0
content_rating  | Everyone
genres          | {Education}
last_updated    | 2018-04-03
current_version | 1.1
android_version | 4.1 and up
-[ RECORD 2 ]---+-----------------------------------------------
id              | 9464
app_name        | DQ Akses
category        | PERSONALIZATION
rating          | 5
reviews         | 4
size            | 31M
min_installs    | 50
price           | 0.99
content_rating  | Everyone
genres          | {Personalization}
last_updated    | 2018-04-27
current_version | 1.1
android_version | 4.1 and up
-[ RECORD 3 ]---+-----------------------------------------------
:

-- Find the names of all apps that are rated less than 3 with at least 10000 reviews. --
playstore=# SELECT app_name FROM analytics
playstore-# WHERE rating < 3 AND reviews >= 10000;
                    app_name                     
-------------------------------------------------
 The Wall Street Journal: Business & Market News
 Vikings: an Archer’s Journey
 Shoot Em Down Free
(3 rows)

-- Find the top 10 most-reviewed apps that cost between 10 cents and a dollar. --
playstore=# SELECT * FROM analytics
playstore-# WHERE price BETWEEN 0.1 AND 1
playstore-# ORDER BY reviews DESC
playstore-# LIMIT 10;
-[ RECORD 1 ]---+--------------------------------------------
id              | 1144
app_name        | Free Slideshow Maker & Video Editor
category        | GAME
rating          | 4.6
reviews         | 408292
size            | 29M
min_installs    | 10000000
price           | 0.99
content_rating  | Mature 17+
genres          | {Action}
last_updated    | 2018-07-12
current_version | 1.7.110758
android_version | 4.1 and up
-[ RECORD 2 ]---+--------------------------------------------
id              | 2298
app_name        | Couple - Relationship App
category        | GAME
rating          | 4.3
reviews         | 85468
size            | 36M
min_installs    | 1000000
price           | 0.99
content_rating  | Everyone
genres          | {Arcade}
last_updated    | 2018-06-08
current_version | 2.4.1.485300
android_version | 4.0.3 and up
-[ RECORD 3 ]---+--------------------------------------------
:

-- Find the most out of date app. Hint: You don’t need to do it this way, but it’s possible to do with a subquery: http://www.postgresqltutorial.com/postgresql-max-function/ --
playstore=# SELECT * FROM analytics
playstore-# ORDER BY last_updated LIMIT 1;
-[ RECORD 1 ]---+----------------
id              | 5701
app_name        | CP Clicker
category        | FAMILY
rating          | 4.2
reviews         | 1415
size            | 209k
min_installs    | 100000
price           | 0
content_rating  | Everyone
genres          | {Entertainment}
last_updated    | 2010-05-21
current_version | 3.1
android_version | 1.5 and up

playstore=# SELECT * FROM analytics
playstore-# WHERE last_updated = (SELECT MIN(last_updated) FROM analytics);
-[ RECORD 1 ]---+----------------
id              | 5701
app_name        | CP Clicker
category        | FAMILY
rating          | 4.2
reviews         | 1415
size            | 209k
min_installs    | 100000
price           | 0
content_rating  | Everyone
genres          | {Entertainment}
last_updated    | 2010-05-21
current_version | 3.1
android_version | 1.5 and up

-- Find the most expensive app (the query is very similar to #11). --
playstore=# SELECT * FROM analytics ORDER BY price DESC LIMIT 1; -- My solution --
-[ RECORD 1 ]---+-------------------
id              | 6766
app_name        | Cardi B Piano Game
category        | LIFESTYLE
rating          | 3.6
reviews         | 275
size            | 7.3M
min_installs    | 10000
price           | 400
content_rating  | Everyone
genres          | {Lifestyle}
last_updated    | 2018-05-03
current_version | 1.0.1
android_version | 4.1 and up

playstore=# SELECT * FROM analytics 
playstore-#   WHERE price = (SELECT MAX(price) FROM analytics);
-[ RECORD 1 ]---+-------------------
id              | 6766
app_name        | Cardi B Piano Game
category        | LIFESTYLE
rating          | 3.6
reviews         | 275
size            | 7.3M
min_installs    | 10000
price           | 400
content_rating  | Everyone
genres          | {Lifestyle}
last_updated    | 2018-05-03
current_version | 1.0.1
android_version | 4.1 and up

-- Count all the reviews in the Google Play Store. --
playstore=# SELECT SUM(reviews) AS "Total Reviews" FROM analytics;
 Total Reviews 
---------------
    4814575866
(1 row)

-- Find all the categories that have more than 300 apps in them. --
playstore=# SELECT category FROM analytics 
playstore-# GROUP BY category 
playstore-# HAVING COUNT(*) > 300;
    category     
-----------------
 COMMUNICATION
 PHOTOGRAPHY
 GAME
 BUSINESS
 MEDICAL
 TOOLS
 LIFESTYLE
 PRODUCTIVITY
 PERSONALIZATION
 FINANCE
 SPORTS
 FAMILY
(12 rows)

-- Find the app that has the highest proportion of min_installs to reviews, among apps that have been installed at least 100,000 times. Display the name of the app along with the number of reviews, the min_installs, and the proportion. --
playstore=# SELECT app_name, reviews, min_installs,  min_installs / reviews AS proportion
playstore-# FROM analytics
playstore-# WHERE min_installs >= 100000
playstore-# ORDER BY proportion DESC
playstore-# LIMIT 1;
     app_name     | reviews | min_installs | proportion 
------------------+---------+--------------+------------
 Kim Bu Youtuber? |      66 |     10000000 |     151515
