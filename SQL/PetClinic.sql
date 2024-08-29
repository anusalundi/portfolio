SELECT * FROM Pets WHERE Kind='Dog' AND Name GLOB '*An*';
SELECT * FROM Pets WHERE Kind='Dog' AND Name GLOB '*Vi*';
SELECT * FROM Pets WHERE Kind='Dog' AND Name GLOB '*Kir*';
SELECT * FROM Pets WHERE Kind='Dog' AND Name GLOB '*Han*';

SELECT * FROM pets WHERE kind= 'Cat' OR kind='Rabbit';
SELECT * FROM pets WHERE age BETWEEN 1 AND 5;
SELECT City, COUNT(*) AS OwnerCount FROM owners GROUP BY City ORDER BY OwnerCount DESC LIMIT 5;
SELECT Name, Age, Kind FROM Pets ORDER BY Age DESC LIMIT 1; -- the oldest Pet
SELECT Kind, Name, Age FROM Pets WHERE (Kind, Age) IN (SELECT Kind, MAX(Age) FROM Pets GROUP BY Kind); -- the oldest Pet of every Kind
SELECT Kind, COUNT(*) AS Count FROM Pets GROUP BY Kind; -- the no of Pets per Kind
SELECT Kind, AVG(Age) AS Average_Age FROM Pets GROUP BY Kind; -- Average age per Kind
SELECT p.Name AS PetName, p.Kind, o.Name AS OwnerName FROM Pets AS p JOIN Owners AS o ON p.OwnerID = o.OwnerID; -- Pets and Owners
SELECT OwnerID, COUNT(*) AS PetCount FROM Pets GROUP BY OwnerID HAVING COUNT(*) > 5; -- Owners with more than 5 Pets
