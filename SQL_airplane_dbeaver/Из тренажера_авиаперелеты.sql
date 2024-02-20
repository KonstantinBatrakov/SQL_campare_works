DROP DATABASE IF EXISTS airplane;
CREATE DATABASE airplane;
USE airplane;

DROP TABLE IF EXISTS company;
CREATE TABLE company (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

DROP TABLE IF EXISTS trip;
CREATE TABLE trip (
    id INT PRIMARY KEY AUTO_INCREMENT,
    company INT,
    plane VARCHAR(50),
    town_from VARCHAR(100),
    town_to VARCHAR(100),
    time_out DATETIME,
    time_in DATETIME,
    FOREIGN KEY (company) REFERENCES company(id)
);

DROP TABLE IF EXISTS passenger;
CREATE TABLE passenger (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

DROP TABLE IF EXISTS pass_in_trip;
CREATE TABLE pass_in_trip (
    id INT PRIMARY KEY AUTO_INCREMENT,
    trip INT,
    passenger INT,
    place VARCHAR(50),
    FOREIGN KEY (trip) REFERENCES trip(id),
    FOREIGN KEY (passenger) REFERENCES passenger(id)
);

INSERT INTO company (id, name) VALUES
(1, 'Don_avia'),
(2, 'Aeroflot'),
(3, 'Dale_avia'),
(4, 'air_France'),
(5, 'British_AW');

INSERT INTO passenger (id, name) VALUES 
(1, 'Bruce Willis'), (2, 'George Clooney'), (3, 'Kevin Costner'), (4, 'Donald Sutherland'), (5, 'Jennifer Lopez'), (6, 'Ray Liotta'), (7, 'Samuel L. Jackson'), (8, 'Nikole Kidman'), (9, 'Alan Rickman'), (10, 'Kurt Russell'), (11, 'Harrison Ford'), (12, 'Russell Crowe'), (13, 'Steve Martin'), (14, 'Michael Caine'), (15, 'Angelina Jolie'), (16, 'Mel Gibson'), (17, 'Michael Douglas'), (18, 'John Travolta'), (19, 'Sylvester Stallone'), (20, 'Tommy Lee Jones'), (21, 'Catherine Zeta-Jones'), (22, 'Antonio Banderas'), (23, 'Kim Basinger'), (24, 'Sam Neill'), (25, 'Gary Oldman'), (26, 'ClINT Eastwood'), (27, 'Brad Pitt'), (28, 'Johnny Depp'), (29, 'Pierce Brosnan'), (30, 'Sean Connery'), (31, 'Bruce Willis'), (37, 'Mullah Omar'), (38, 'Leonardo Grant-Baker');

INSERT INTO trip (id, company, plane, town_from, town_to, time_out, time_in) VALUES
(1100, 4, 'Boeing', 'Rostov', 'Paris', '1900-01-01T14:30:00', '1900-01-01T17:50:00'),
(1101, 4, 'Boeing', 'Paris', 'Rostov', '1900-01-01T08:12:00', '1900-01-01T11:45:00'),
(1123, 3, 'TU-154', 'Rostov', 'Vladivostok', '1900-01-01T16:20:00', '1900-01-02T03:40:00'),
(1124, 3, 'TU-154', 'Vladivostok', 'Rostov', '1900-01-01T09:00:00', '1900-01-01T19:50:00'),
(1145, 2, 'IL-86', 'Moscow', 'Rostov', '1900-01-01T09:35:00', '1900-01-01T11:23:00'),
(1146, 2, 'IL-86', 'Rostov', 'Moscow', '1900-01-01T17:55:00', '1900-01-01T20:01:00'),
(1181, 1, 'TU-134', 'Rostov', 'Moscow', '1900-01-01T06:12:00', '1900-01-01T08:01:00'),
(1182, 1, 'TU-134', 'Moscow', 'Rostov', '1900-01-01T12:35:00', '1900-01-01T14:30:00'),
(1187, 1, 'TU-134', 'Rostov', 'Moscow', '1900-01-01T15:42:00', '1900-01-01T17:39:00'),
(1188, 1, 'TU-134', 'Moscow', 'Rostov', '1900-01-01T22:50:00', '1900-01-02T00:48:00'),
(1195, 1, 'TU-154', 'Rostov', 'Moscow', '1900-01-01T23:30:00', '1900-01-02T01:11:00'),
(1196, 1, 'TU-154', 'Moscow', 'Rostov', '1900-01-01T04:00:00', '1900-01-01T05:45:00'),
(7771, 5, 'Boeing', 'London', 'Singapore', '1900-01-01T01:00:00', '1900-01-01T11:00:00'),
(7772, 5, 'Boeing', 'Singapore', 'London', '1900-01-01T12:00:00', '1900-01-02T02:00:00'),
(7773, 5, 'Boeing', 'London', 'Singapore', '1900-01-01T03:00:00', '1900-01-01T13:00:00'),
(7774, 5, 'Boeing', 'Singapore', 'London', '1900-01-01T14:00:00', '1900-01-02T06:00:00'),
(7775, 5, 'Boeing', 'London', 'Singapore', '1900-01-01T09:00:00', '1900-01-01T20:00:00'),
(7776, 5, 'Boeing', 'Singapore', 'London', '1900-01-01T18:00:00', '1900-01-02T08:00:00'),
(7777, 5, 'Boeing', 'London', 'Singapore', '1900-01-01T18:00:00', '1900-01-02T06:00:00'),
(7778, 5, 'Boeing', 'Singapore', 'London', '1900-01-01T22:00:00', '1900-01-02T12:00:00'),
(8881, 5, 'Boeing', 'London', 'Paris', '1900-01-01T03:00:00', '1900-01-01T04:00:00'),
(8882, 5, 'Boeing', 'Paris', 'London', '1900-01-01T22:00:00', '1900-01-01T23:00:00');

INSERT INTO pass_in_trip (id, trip, passenger, place) VALUES
(1, 1100, 1, '1a'), (2, 1123, 3, '2a'), (3, 1123, 1, '4c'), (4, 1123, 6, '4b'), (5, 1124, 2, '2d'), (6, 1145, 3, '2c'), (7, 1181, 1, '1a'), (8, 1181, 6, '1b'), (9, 1181, 8, '3c'), (10, 1181, 5, '1b'), (11, 1182, 5, '4b'), (12, 1187, 8, '3a'), (13, 1188, 8, '3a'), (14, 1182, 9, '6d'), (15, 1145, 5, '1d'), (16, 1187, 10, '3d'), (17, 8882, 37, '1a'), (18, 7771, 37, '1c'), (19, 7772, 37, '1a'), (20, 8881, 37, '1d'), (21, 7778, 10, '2a'), (22, 7772, 10, '3a'), (23, 7771, 11, '4a'), (24, 7771, 11, '1b'), (25, 7771, 11, '5a'), (26, 7772, 12, '1d'), (27, 7773, 13, '2d'), (28, 7772, 13, '1b'), (29, 8882, 14, '3d'), (30, 7771, 14, '4d'), (31, 7771, 14, '5d'), (32, 7772, 14, '1c');

-- 1. Вывести имена всех людей, которые есть в базе данных авиакомпаний. Поля в результирующей таблице: name
SELECT name FROM passenger;

-- 2. Вывести названия всеx авиакомпаний. Поля в результирующей таблице: name
SELECT name FROM company;

-- 3. Вывести все рейсы, совершенные из Москвы. Поля в результирующей таблице: *
SELECT * FROM trip WHERE town_from = 'Moscow';

-- 4. Вывести имена людей, которые заканчиваются на "man". Поля в результирующей таблице: name
SELECT name
FROM passenger
WHERE name LIKE '%man';

-- 5. Вывести количество рейсов, совершенных на TU-134. Поля в результирующей таблице: count
SELECT COUNT(*) AS count
FROM trip
WHERE plane = 'TU-134';

-- 6. Какие компании совершали перелеты на Boeing. Поля в результирующей таблице: name
SELECT DISTINCT company.name
FROM trip
	LEFT JOIN company ON trip.company = company.id
WHERE trip.plane = 'Boeing';

-- 7. Вывести все названия самолётов, на которых можно улететь в Москву (Moscow). Поля в результирующей таблице: plane
SELECT DISTINCT plane FROM trip WHERE town_to = 'Moscow'; 

-- 8. В какие города можно улететь из Парижа (Paris) и сколько времени это займёт? Поля в результирующей таблице: town_to flight_time
-- Используйте конструкцию "as flight_time" для вывода необходимого времени. Это необходимо для корректной проверки.
-- Формат для вывода времени: HH:MM:SS

SELECT town_to, SEC_TO_TIME(TIMESTAMPDIFF(SECOND, time_out, time_in)) AS flight_time
FROM trip
WHERE town_from = 'Paris';

-- 9. Какие компании организуют перелеты из Владивостока (Vladivostok)? Поля в результирующей таблице: name
SELECT company.name
	FROM trip 
	LEFT JOIN company ON trip.company = company.id
	WHERE trip.town_from = 'Vladivostok';

-- 10.Вывести вылеты, совершенные с 10 ч. по 14 ч. 1 января 1900 г. 
-- Поля в результирующей таблице: *

SELECT *
FROM trip
WHERE time_out BETWEEN '1900-01-01 10:00:00' AND '1900-01-01 14:00:00';

-- 11. Выведите пассажиров с самым длинным ФИО. Пробелы, дефисы и точки считаются частью имени. 
-- Поля в результирующей таблице: name

SELECT name FROM passenger 
	WHERE char_length(name) =  (SELECT MAX(char_length(name)) FROM passenger);

-- 12. Вывести id и количество пассажиров для всех прошедших полётов.
-- Поля в результирующей таблице: trip count
-- Используйте конструкцию "as count" для агрегатной функции подсчета количества пассажиров. Это необходимо для корректной проверки.

SELECT trip, COUNT(passenger) AS count FROM pass_in_trip
GROUP BY trip;

-- 13. Вывести имена людей, у которых есть полный тёзка среди пассажиров. 
-- Поля в результирующей таблице: name

SELECT DISTINCT name FROM passenger GROUP BY name HAVING COUNT(*) > 1;

-- 14. В какие города летал Bruce Willis
-- Поля в результирующей таблице: town_to

SELECT DISTINCT town_to FROM trip
JOIN pass_in_trip ON trip.id = pass_in_trip.trip
JOIN passenger ON pass_in_trip.passenger = passenger.id
WHERE passenger.name = 'Bruce Willis';

-- 15.Выведите дату и время прилёта пассажира Стив Мартин (Steve Martin) в Лондон (London)
-- Поля в результирующей таблице: time_in

SELECT time_in FROM trip
JOIN pass_in_trip ON trip.id = pass_in_trip.trip
JOIN passenger ON pass_in_trip.passenger = passenger.id
WHERE passenger.name = 'Steve Martin' AND trip.town_to='london';

-- 16. Вывести отсортированный по количеству перелетов (по убыванию) и имени (по возрастанию) список пассажиров, совершивших хотя бы 1 полет.
-- Поля в результирующей таблице: name, count
-- Используйте конструкцию "as count" для агрегатной функции подсчета количества перелетов. Это необходимо для корректной проверки.

SELECT DISTINCT name, COUNT(pass_in_trip.id) AS count
FROM passenger 
JOIN pass_in_trip ON passenger.id = pass_in_trip.passenger
GROUP BY passenger.name 
ORDER BY count DESC, name; 

-- 17. Сколько рейсов совершили авиакомпании из Ростова (Rostov) в Москву (Moscow) ?
-- Поля в результирующей таблице: count
-- Используйте конструкцию "as count" для агрегатной функции подсчета количества рейсов. Это необходимо для корректной проверки.

SELECT COUNT(id) AS COUNT FROM Trip
WHERE town_to = 'Rostov'
AND town_from = 'Moscow';

-- 18. Выведите имена пассажиров улетевших в Москву (Moscow) на самолете TU-134
-- Поля в результирующей таблице: name

SELECT DISTINCT name FROM passenger
JOIN Pass_in_trip ON Pass_in_trip.passenger = passenger.id
JOIN Trip ON Trip.id = Pass_in_trip.trip
WHERE plane = 'TU-134'
AND town_to = 'Moscow';

-- 19. Выведите нагруженность (число пассажиров) каждого рейса (trip). Результат вывести в отсортированном виде по убыванию нагруженности.
-- Поля в результирующей таблице: trip count
-- Используйте конструкцию "as count" для агрегатной функции подсчета числа пассажиров на рейсе. Это необходимо для корректной проверки.

SELECT trip, COUNT(id) AS COUNT FROM Pass_in_trip
GROUP BY trip
ORDER BY COUNT DESC;
