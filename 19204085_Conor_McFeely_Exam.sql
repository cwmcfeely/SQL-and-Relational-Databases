DROP DATABASE poker_19204085;
CREATE DATABASE poker_19204085;
USE poker_19204085;

CREATE TABLE Card_Deck (
    Card_Name VARCHAR(3),
    Face CHAR(3),
    Type CHAR(2),
    Suit CHAR(1),
    Face_Value INT,
    PRIMARY KEY (Card_Name) );

INSERT INTO Card_Deck VALUES ('1H', 'no', 'A', 'H', 1), ('2H', 'no', '2', 'H', 2), ('3H', 'no', '3', 'H', 3), ('4H', 'no', '4', 'H', 4),
                             ('5H', 'no', '5', 'H', 5), ('6H', 'no', '6', 'H', 6), ('7H', 'no', '7', 'H', 7), ('8H', 'no', '8', 'H', 8),
                             ('9H', 'no', '9', 'H', 9), ('10H', 'no', '10', 'H', 10), ('JH', 'yes', 'J', 'H', 11), ('QH', 'yes', 'Q', 'H', 12),
                             ('KH', 'yes', 'K', 'H', 13);
INSERT INTO Card_Deck VALUES ('1S', 'no', 'A', 'S', 1), ('2S', 'no', '2', 'S', 2), ('3S', 'no', '3', 'S', 3), ('4S', 'no', '4', 'S', 4),
                             ('5S', 'no', '5', 'S', 5), ('6S', 'no', '6', 'S', 6), ('7S', 'no', '7', 'S', 7), ('8S', 'no', '8', 'S', 8),
                             ('9S', 'no', '9', 'S', 9), ('10S', 'no', '10', 'S', 10), ('JS', 'yes', 'J', 'S', 11), ('QS', 'yes', 'Q', 'S', 12),
                             ('KS', 'yes', 'K', 'S', 13);
INSERT INTO Card_Deck VALUES ('1C', 'no', 'A', 'C', 1), ('2C', 'no', '2', 'C', 2), ('3C', 'no', '3', 'C', 3), ('4C', 'no', '4', 'C', 4),
                             ('5C', 'no', '5', 'C', 5), ('6C', 'no', '6', 'C', 6), ('7C', 'no', '7', 'C', 7), ('8C', 'no', '8', 'C', 8),
                             ('9C', 'no', '9', 'C', 9), ('10C', 'no', '10', 'C', 10), ('JC', 'yes', 'J', 'C', 11), ('QC', 'yes', 'Q', 'C', 12),
                             ('KC', 'yes', 'K', 'C', 13);
INSERT INTO Card_Deck VALUES ('1D', 'no', 'A', 'D', 1), ('2D', 'no', '2', 'D', 2), ('3D', 'no', '3', 'D', 3), ('4D', 'no', '4', 'D', 4),
                             ('5D', 'no', '5', 'D', 5), ('6D', 'no', '6', 'D', 6), ('7D', 'no', '7', 'D', 7), ('8D', 'no', '8', 'D', 8),
                             ('9D', 'no', '9', 'D', 9), ('10D', 'no', '10', 'D', 10), ('JD', 'yes', 'J', 'D', 11), ('QD', 'yes', 'Q', 'D', 12),
                             ('KD', 'yes', 'K', 'D', 13);

CREATE TABLE poker_hands (
    player_ID INT,
    game_ID CHAR(5),
    R1 CHAR(3), R2 CHAR(3), R3 CHAR(3), R4 CHAR(3), R5 CHAR(3),
    PRIMARY KEY (player_ID, game_ID) );

/* Adding the Hand_Type column */
ALTER TABLE poker_hands
    ADD Hand_Type CHAR(100) after R5;

/* Inserting values into poker_hands */
INSERT INTO poker_hands VALUES (12789, '17MET', 'QH', '3D', 'QS', '3C', '3H', 'null'), (95483, '89BOO', 'QC', 'JH', '10C', '9H', '8D', 'null'),
                               (12789, '23WSA', '7H', '7C', '7S', '7D', '1H', 'null'), (27439, '94JIN', '4H', '6H', '5H', '7H', '8H', 'null'),
                               (33456, '35GHY','10H', '6H', '5H', '4H', '8H','null'), (87349, '35JFN', '4S', '5C', '5H', '1S', '10D', 'null'),
                               (83746, '35KLN', 'KS', 'JS', 'QS', '1S', '10S','null'), (23126, '30KVI', '8S', '8D', '9C', '9H', '10S', 'null'),
                               (56347, '65YOB', 'JH', 'QH', '8C', '8S', '8D', 'null'), (83482, '69SEC', 'JH', '9C', '9D', '9S', 'JH', 'null');

UPDATE poker_hands t1
INNER JOIN Card_Deck a ON a.Card_Name = t1.R1
INNER JOIN Card_Deck b ON b.Card_Name = t1.R2
INNER JOIN Card_Deck c ON c.Card_Name = t1.R3
INNER JOIN Card_Deck d ON d.Card_Name = t1.R4
INNER JOIN Card_Deck e ON e.Card_Name = t1.R5
SET t1.R1=@tmp:=t1.R1, t1.R1=t1.R2, t1.R2=@tmp
WHERE a.Face_Value < b.Face_Value;

UPDATE poker_hands t1
INNER JOIN Card_Deck a ON a.Card_Name = t1.R1
INNER JOIN Card_Deck b ON b.Card_Name = t1.R2
INNER JOIN Card_Deck c ON c.Card_Name = t1.R3
INNER JOIN Card_Deck d ON d.Card_Name = t1.R4
INNER JOIN Card_Deck e ON e.Card_Name = t1.R5
SET t1.R2=@tmp:=t1.R2, t1.R2=t1.R3, t1.R3=@tmp
WHERE b.Face_Value < c.Face_Value;

UPDATE poker_hands t1
INNER JOIN Card_Deck a ON a.Card_Name = t1.R1
INNER JOIN Card_Deck b ON b.Card_Name = t1.R2
INNER JOIN Card_Deck c ON c.Card_Name = t1.R3
INNER JOIN Card_Deck d ON d.Card_Name = t1.R4
INNER JOIN Card_Deck e ON e.Card_Name = t1.R5
SET t1.R1=@tmp:=t1.R1, t1.R1=t1.R2, t1.R2=@tmp
WHERE a.Face_Value < b.Face_Value;

UPDATE poker_hands t1
INNER JOIN Card_Deck a ON a.Card_Name = t1.R1
INNER JOIN Card_Deck b ON b.Card_Name = t1.R2
INNER JOIN Card_Deck c ON c.Card_Name = t1.R3
INNER JOIN Card_Deck d ON d.Card_Name = t1.R4
INNER JOIN Card_Deck e ON e.Card_Name = t1.R5
SET t1.R3=@tmp:=t1.R3, t1.R3=t1.R4, t1.R4=@tmp
WHERE c.Face_Value < d.Face_Value;

UPDATE poker_hands t1
INNER JOIN Card_Deck a ON a.Card_Name = t1.R1
INNER JOIN Card_Deck b ON b.Card_Name = t1.R2
INNER JOIN Card_Deck c ON c.Card_Name = t1.R3
INNER JOIN Card_Deck d ON d.Card_Name = t1.R4
INNER JOIN Card_Deck e ON e.Card_Name = t1.R5
SET t1.R2=@tmp:=t1.R2, t1.R2=t1.R3, t1.R3=@tmp
WHERE b.Face_Value < c.Face_Value;

UPDATE poker_hands t1
INNER JOIN Card_Deck a ON a.Card_Name = t1.R1
INNER JOIN Card_Deck b ON b.Card_Name = t1.R2
INNER JOIN Card_Deck c ON c.Card_Name = t1.R3
INNER JOIN Card_Deck d ON d.Card_Name = t1.R4
INNER JOIN Card_Deck e ON e.Card_Name = t1.R5
SET t1.R1=@tmp:=t1.R1, t1.R1=t1.R2, t1.R2=@tmp
WHERE a.Face_Value < b.Face_Value;

UPDATE poker_hands t1
INNER JOIN Card_Deck a ON a.Card_Name = t1.R1
INNER JOIN Card_Deck b ON b.Card_Name = t1.R2
INNER JOIN Card_Deck c ON c.Card_Name = t1.R3
INNER JOIN Card_Deck d ON d.Card_Name = t1.R4
INNER JOIN Card_Deck e ON e.Card_Name = t1.R5
SET t1.R4=@tmp:=t1.R4, t1.R4=t1.R5, t1.R5=@tmp
WHERE d.Face_Value < e.Face_Value;

UPDATE poker_hands t1
INNER JOIN Card_Deck a ON a.Card_Name = t1.R1
INNER JOIN Card_Deck b ON b.Card_Name = t1.R2
INNER JOIN Card_Deck c ON c.Card_Name = t1.R3
INNER JOIN Card_Deck d ON d.Card_Name = t1.R4
INNER JOIN Card_Deck e ON e.Card_Name = t1.R5
SET t1.R3=@tmp:=t1.R3, t1.R3=t1.R4, t1.R4=@tmp
WHERE c.Face_Value < d.Face_Value;

UPDATE poker_hands t1
INNER JOIN Card_Deck a ON a.Card_Name = t1.R1
INNER JOIN Card_Deck b ON b.Card_Name = t1.R2
INNER JOIN Card_Deck c ON c.Card_Name = t1.R3
INNER JOIN Card_Deck d ON d.Card_Name = t1.R4
INNER JOIN Card_Deck e ON e.Card_Name = t1.R5
SET t1.R2=@tmp:=t1.R2, t1.R2=t1.R3, t1.R3=@tmp
WHERE b.Face_Value < c.Face_Value;

UPDATE poker_hands t1
INNER JOIN Card_Deck a ON a.Card_Name = t1.R1
INNER JOIN Card_Deck b ON b.Card_Name = t1.R2
INNER JOIN Card_Deck c ON c.Card_Name = t1.R3
INNER JOIN Card_Deck d ON d.Card_Name = t1.R4
INNER JOIN Card_Deck e ON e.Card_Name = t1.R5
SET t1.R1=@tmp:=t1.R1, t1.R1=t1.R2, t1.R2=@tmp
WHERE a.Face_Value < b.Face_Value;

/* Update Hand_Type column with Full House, if it matches conditions */
UPDATE poker_hands t1
INNER JOIN Card_Deck a ON a.Card_Name = t1.R1
INNER JOIN Card_Deck b ON b.Card_Name = t1.R2
INNER JOIN Card_Deck c ON c.Card_Name = t1.R3
INNER JOIN Card_Deck d ON d.Card_Name = t1.R4
INNER JOIN Card_Deck e ON e.Card_Name = t1.R5
SET t1.Hand_Type = 'Full House'
WHERE (a.Face_Value = b.Face_Value AND c.Face_Value = d.Face_Value AND d.Face_Value = e.Face_Value)
OR (a.Face_Value = b.Face_Value AND b.Face_Value = c.Face_Value AND d.Face_Value = e.Face_Value);

/* Update Hand_Type column with all straights*/
UPDATE poker_hands t1
INNER JOIN Card_Deck a ON a.Card_Name = t1.R1
INNER JOIN Card_Deck b ON b.Card_Name = t1.R2
INNER JOIN Card_Deck c ON c.Card_Name = t1.R3
INNER JOIN Card_Deck d ON d.Card_Name = t1.R4
INNER JOIN Card_Deck e ON e.Card_Name = t1.R5
SET t1.Hand_Type = 'Straight'
WHERE (a.Suit <> b.Suit OR b.Suit <> c.Suit OR c.Suit <> d.Suit OR d.Suit <> e.Suit)
AND ((a.Face_Value - b.Face_Value = 1 AND b.Face_Value - c.Face_Value = 1 AND c.Face_Value - d.Face_Value = 1 AND d.Face_Value - e.Face_Value >= 0)
OR (a.Face_Value = b.face_value +1 AND b.Face_Value = c.face_value +1 AND c.Face_Value = d.Face_Value +1 AND e.Face_Value = 1));

/* Update Hand_Type column with all flushes */
UPDATE poker_hands t1
INNER JOIN Card_Deck a ON a.Card_Name = t1.R1
INNER JOIN Card_Deck b ON b.Card_Name = t1.R2
INNER JOIN Card_Deck c ON c.Card_Name = t1.R3
INNER JOIN Card_Deck d ON d.Card_Name = t1.R4
INNER JOIN Card_Deck e ON e.Card_Name = t1.R5
SET t1.Hand_Type = 'Flushes'
WHERE (a.Suit = b.Suit AND b.Suit = c.Suit AND c.Suit = d.Suit AND d.Suit = e.Suit);

/* Update Hand_Type column for Straight Flushes*/
UPDATE poker_hands t1
INNER JOIN Card_Deck a ON a.Card_Name = t1.R1
INNER JOIN Card_Deck b ON b.Card_Name = t1.R2
INNER JOIN Card_Deck c ON c.Card_Name = t1.R3
INNER JOIN Card_Deck d ON d.Card_Name = t1.R4
INNER JOIN Card_Deck e ON e.Card_Name = t1.R5
SET t1.Hand_Type = 'Straight Flush'
WHERE (a.Suit = b.Suit AND b.Suit = c.Suit AND c.Suit = d.Suit AND d.Suit = e.Suit)
AND (a.Face_Value - b.Face_Value = 1 AND b.Face_Value - c.Face_Value = 1 AND c.Face_Value - d.Face_Value = 1 AND d.Face_Value - e.Face_Value = 1)
OR (a.Face_Value - b.Face_Value = 1 AND b.Face_Value - c.Face_Value = 1 AND c.Face_Value - d.Face_Value = 1 AND d.Face_Value - e.Face_Value = 9);

/* Update Hand_Type column for Four of a Kind*/
UPDATE poker_hands t1
INNER JOIN Card_Deck a ON a.Card_Name = t1.R1
INNER JOIN Card_Deck b ON b.Card_Name = t1.R2
INNER JOIN Card_Deck c ON c.Card_Name = t1.R3
INNER JOIN Card_Deck d ON d.Card_Name = t1.R4
INNER JOIN Card_Deck e ON e.Card_Name = t1.R5
SET t1.Hand_Type = 'Four of a Kind'
WHERE  (a.Face_Value = b.Face_Value AND b.Face_Value = c.Face_Value AND c.Face_Value = d.Face_Value)
OR (a.Face_Value = c.Face_Value AND a.Face_Value = d.Face_Value AND a.Face_Value = e.Face_Value)
OR (a.Face_Value = d.Face_Value AND a.Face_Value = e.Face_Value AND a.Face_Value = b.Face_Value)
OR (a.face_value = e.Face_Value AND a.Face_Value = c.Face_Value AND a.Face_Value = d.Face_Value)
OR (b.face_value = c.face_value AND b.face_value = d.face_value AND b.Face_Value = e.Face_Value)
OR (b.face_value = d.face_value AND b.face_value = e.face_value AND b.Face_Value = a.Face_Value)
OR (b.face_value = e.face_value AND b.face_value = a.face_value AND b.Face_Value = c.Face_Value)
OR (b.face_value = a.face_value AND b.face_value = c.face_value AND b.Face_Value = d.Face_Value)
OR (c.face_value = d.face_value AND c.face_value = e.face_value AND c.Face_Value = a.Face_Value)
OR (c.face_value = e.face_value AND c.face_value = a.face_value AND c.Face_Value = b.Face_Value)
OR (c.face_value = a.face_value AND c.face_value = b.face_value AND c.Face_Value = d.Face_Value)
OR (c.face_value = b.face_value AND c.face_value = d.face_value AND c.Face_Value = e.Face_Value)
OR (d.face_value = e.face_value AND d.face_value = a.face_value AND d.face_value = b.Face_Value)
OR (d.face_value = a.face_value AND d.face_value = b.face_value AND d.face_value = c.Face_Value)
OR (d.face_value = b.face_value AND d.face_value = c.face_value AND d.face_value = e.Face_Value)
OR (d.face_value = c.face_value AND d.face_value = e.face_value AND d.face_value = a.Face_Value)
OR (e.Face_Value = a.face_value AND e.Face_Value = b.face_value AND e.Face_Value = c.Face_Value)
OR (e.Face_Value = b.face_value AND e.Face_Value = c.face_value AND e.Face_Value = d.Face_Value)
OR (e.Face_Value = c.face_value AND e.Face_Value = d.face_value AND e.Face_Value = a.Face_Value)
OR (e.Face_Value = d.face_value AND e.Face_Value = a.face_value AND e.Face_Value = b.Face_Value);

/* Update Hand_Type column for Three of a Kind*/
UPDATE poker_hands t1
 INNER JOIN Card_Deck a ON a.Card_Name = t1.R1
 INNER JOIN Card_Deck b ON b.Card_Name = t1.R2
 INNER JOIN Card_Deck c ON c.Card_Name = t1.R3
 INNER JOIN Card_Deck d ON d.Card_Name = t1.R4
 INNER JOIN Card_Deck e ON e.Card_Name = t1.R5
 SET t1.Hand_Type = 'Three of a Kind'
 WHERE (a.Face_Value = b.Face_Value AND b.Face_Value = c.Face_Value AND a.Face_Value != d.Face_Value AND a.Face_Value != e.Face_Value AND d.Face_Value != e.Face_Value)
 OR (b.Face_Value = c.Face_Value AND c.Face_Value = d.Face_Value AND b.Face_Value != a.Face_Value AND a.Face_Value != e.Face_Value)
 OR (c.Face_Value = d.Face_Value AND d.Face_Value = e.Face_Value AND c.Face_Value != a.Face_Value AND a.Face_Value != b.Face_Value)
 OR (d.Face_Value = e.Face_Value AND e.Face_Value = a.Face_Value AND d.Face_Value != c.Face_Value AND b.Face_Value != c.Face_Value)
 OR (e.Face_Value = a.Face_Value AND a.Face_Value = b.Face_Value AND e.Face_Value != d.Face_Value AND d.Face_Value != c.Face_Value)
 OR (a.Face_Value = c.Face_Value AND c.Face_Value = d.Face_Value AND a.Face_Value != b.Face_Value AND b.Face_Value != e.Face_Value)
 OR (b.Face_Value = d.Face_Value AND d.Face_Value = e.Face_Value AND b.Face_Value != a.Face_Value AND a.Face_Value != c.Face_Value)
 OR (c.Face_Value = e.Face_Value AND e.Face_Value = a.Face_Value AND c.Face_Value != b.Face_Value AND b.Face_Value != d.Face_Value)
 OR (d.Face_Value = a.Face_Value AND a.Face_Value = b.Face_Value AND d.Face_Value != c.Face_Value AND c.Face_Value != e.Face_Value)
 OR (e.Face_Value = b.Face_Value AND b.Face_Value = c.Face_Value AND e.Face_Value != d.Face_Value AND d.Face_Value != a.Face_Value);

/* Update Hand_Type column for Two Pairs*/
UPDATE poker_hands t1
 INNER JOIN Card_Deck a ON a.Card_Name = t1.R1
 INNER JOIN Card_Deck b ON b.Card_Name = t1.R2
 INNER JOIN Card_Deck c ON c.Card_Name = t1.R3
 INNER JOIN Card_Deck d ON d.Card_Name = t1.R4
 INNER JOIN Card_Deck e ON e.Card_Name = t1.R5
 SET t1.Hand_Type = 'Two Pairs'
 WHERE (a.Face_Value = b.Face_Value AND c.Face_Value = d.Face_Value AND d.Face_Value != e.Face_Value AND b.Face_Value != e.Face_Value AND d.Face_Value != b.Face_Value)
 OR (b.Face_Value = c.Face_Value AND d.Face_Value = e.Face_Value AND a.Face_Value != b.Face_Value AND a.Face_Value != d.Face_Value AND b.Face_Value != d.Face_Value)
 OR (a.Face_Value = b.Face_Value AND d.Face_Value = e.Face_Value AND c.Face_Value != a.Face_Value AND c.Face_Value != d.Face_Value AND a.Face_Value != e.Face_Value);

/* Update Hand_Type column for a Pair*/
 UPDATE poker_hands t1
  INNER JOIN Card_Deck a ON a.Card_Name = t1.R1
  INNER JOIN Card_Deck b ON b.Card_Name = t1.R2
  INNER JOIN Card_Deck c ON c.Card_Name = t1.R3
  INNER JOIN Card_Deck d ON d.Card_Name = t1.R4
  INNER JOIN Card_Deck e ON e.Card_Name = t1.R5
  SET t1.Hand_Type = 'Pairs'
 WHERE (a.Face_Value = b.Face_Value AND b.Face_Value != c.Face_Value AND c.Face_Value != d.Face_Value AND d.Face_Value != e.Face_Value)
OR (b.Face_Value = c.Face_Value AND a.Face_Value != b.Face_Value AND c.Face_Value != d.Face_Value AND d.Face_Value != e.Face_Value)
OR (c.Face_Value = d.Face_Value AND a.Face_Value != c.Face_Value AND b.Face_Value != d.Face_Value AND d.Face_Value != e.Face_Value)
OR (d.Face_Value = e.Face_Value AND a.Face_Value != b.Face_Value AND b.Face_Value != c.Face_Value AND d.Face_Value != e.Face_Value);

/* Display Poker hands in descending order */
  SELECT player_ID, game_ID, R1, R2, R3, R4, R5, Hand_Type
       FROM poker_hands
   Order BY Hand_Type DESC;