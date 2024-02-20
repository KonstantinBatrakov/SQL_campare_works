DROP DATABASE IF EXISTS Payments_family;
CREATE DATABASE Payments_family;
USE Payments_family;

CREATE TABLE FamilyMembers (
    member_id INT PRIMARY KEY,
    status VARCHAR(50),
    member_name VARCHAR(100),
    birthday DATETIME
);

DROP TABLE IF EXISTS goodTypes;
CREATE TABLE IF NOT EXISTS goodTypes (
    good_type_id INT AUTO_INCREMENT PRIMARY KEY,
    good_type_name VARCHAR(255)
);

DROP TABLE IF EXISTS Goods;
CREATE TABLE Goods (
    good_id INT PRIMARY KEY,
    good_name VARCHAR(255),
    type INT,
    FOREIGN KEY (type) REFERENCES goodTypes(good_type_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    date DATETIME,
    family_member INT,
    good INT,
    amount INT,
    unit_price INT,
    FOREIGN KEY (good) REFERENCES Goods(good_id),
    FOREIGN KEY (family_member) REFERENCES FamilyMembers(member_id)
);

INSERT INTO FamilyMembers (member_id, status, member_name, birthday) VALUES
(1, 'father', 'Headley Quincey', '1960-05-13'), (2, 'mother', 'Flavia Quincey', '1963-02-16'), (3, 'son', 'Andie Quincey', '1983-06-05'), (4, 'daughter', 'Lela Quincey', '1985-06-07'), (5, 'daughter', 'Annie Quincey', '1988-04-10'), (6, 'father', 'Ernest Forrest', '1961-09-11'), (7, 'mother', 'Constance Forrest', '1968-09-06'), (8, 'daughter', 'Wednesday Addams', '2005-01-13');

INSERT INTO goodTypes (good_type_id, good_type_name) VALUES
(1, 'communal payments'), (2, 'food'), (3, 'delicacies'), (4, 'entertainment'), (5, 'treatment'), (6, 'education'), (7, 'clothes'), (8, 'equipment');

INSERT INTO Goods (good_id, good_name, type) VALUES
(1, 'apartment fee', 1), (2, 'phone fee', 1), (3, 'bread', 2), (4, 'milk', 2), (5, 'red caviar', 3), (6, 'cinema', 4), (7, 'black caviar', 3), (8, 'cough tablets', 5), (9, 'potato', 2), (10, 'pineapples', 3), (11, 'television', 8), (12, 'vacuum cleaner', 8), (13, 'jacket', 7), (14, 'fur coat', 7), (15, 'music school fee', 6), (16, 'english school fee', 6);

INSERT INTO payments (payment_id, date, family_member, good, amount, unit_price) VALUES
(1, '2005-02-12', 1, 1, 1, 2000),
(2, '2005-03-23', 2, 1, 1, 2100),
(3, '2005-05-14', 3, 4, 5, 20),
(4, '2005-07-22', 4, 5, 1, 350),
(5, '2005-07-26', 4, 7, 2, 150),
(6, '2005-02-20', 5, 6, 1, 100),
(7, '2005-07-30', 2, 6, 1, 120),
(8, '2005-09-12', 2, 16, 1, 5500),
(9, '2005-09-30', 5, 15, 1, 230),
(10, '2005-10-27', 5, 15, 1, 230),
(11, '2005-11-28', 5, 15, 1, 250),
(12, '2005-12-22', 5, 15, 1, 250),
(13, '2005-08-11', 3, 13, 1, 2200),
(14, '2005-10-23', 2, 14, 1, 66000),
(15, '2005-02-03', 1, 9, 5, 8),
(16, '2005-03-11', 1, 9, 5, 7),
(17, '2005-03-18', 2, 9, 3, 8),
(18, '2005-04-20', 1, 9, 8, 8),
(19, '2005-05-13', 1, 9, 5, 7),
(20, '2005-06-11', 2, 9, 3, 150),
(21, '2006-01-12', 3, 10, 1, 100),
(22, '2006-03-12', 1, 5, 3, 10),
(23, '2005-06-05', 1, 8, 1, 300),
(24, '2005-06-20', 3, 6, 8, 150),
(25, '2005-06-21', 2, 9, 3, 150);

-- Задание 1. Определить, сколько потратил в 2005 году каждый из членов семьи. В результирующей выборке не выводите тех членов семьи, которые ничего не потратили.
-- Поля в результирующей таблице: member_name, status, costs
-- Используйте конструкцию "as costs" для отображения затраченной суммы членом семьи. Это необходимо для корректной проверки.

SELECT fm.member_name, fm.status, SUM(p.amount * p.unit_price) AS costs
FROM payments p
JOIN FamilyMembers fm ON p.family_member = fm.member_id
WHERE YEAR(p.date) = 2005
GROUP BY fm.member_name, fm.status
HAVING costs > 0;

-- 2. Выведите имя самого старшего человека. Если таких несколько, то выведите их всех.
-- Поля в результирующей таблице: member_name

SELECT member_name FROM familymembers
WHERE birthday = (SELECT min(birthday) FROM familymembers);


-- 3. Определить, кто из членов семьи покупал картошку (potato)
-- Поля в результирующей таблице: status

SELECT DISTINCT status FROM FamilyMembers
JOIN Payments ON FamilyMembers.member_id = Payments.family_member
JOIN Goods ON Goods.good_id = Payments.good
WHERE good_name = 'potato';

-- 4. Сколько и кто из семьи потратил на развлечения (entertainment). Вывести статус в семье, имя, сумму
-- Поля в результирующей таблице: status, member_name, costs, 
-- Используйте конструкцию "as costs" для отображения затраченной суммы членом семьи.
-- Это необходимо для корректной проверки.

SELECT status, member_name, SUM(Payments.amount*Payments.unit_price) AS costs
FROM FamilyMembers
JOIN Payments ON FamilyMembers.member_id = Payments.family_member
JOIN Goods ON Payments.good = Goods.good_id
JOIN GoodTypes ON Goods.type = GoodTypes.good_type_id
WHERE good_type_name = 'entertainment'
GROUP BY status, member_name;

-- 5. Определить товары, которые покупали более 1 раза
-- Поля в результирующей таблице: good_name

SELECT good_name FROM Goods
JOIN Payments ON Goods.good_id = Payments.good
GROUP BY good_name
HAVING COUNT(payment_id) > 1;

-- 6. Найти имена всех матерей (mother)
-- Поля в результирующей таблице: member_name

SELECT member_name from familymembers
WHERE status = 'mother';


-- 7. Найдите самый дорогой деликатес (delicacies) и выведите его цену
-- Поля в результирующей таблице: good_name unit_price

SELECT good_name, 
    (SELECT unit_price 
     FROM Payments 
     WHERE Payments.good = Goods.good_id 
     ORDER BY unit_price DESC 
     LIMIT 1) AS unit_price
FROM Goods
JOIN GoodTypes ON GoodTypes.good_type_id = Goods.type
WHERE GoodTypes.good_type_name = 'delicacies'
ORDER BY unit_price DESC
LIMIT 1;


-- 8. Определить кто и сколько потратил в июне 2005
-- Поля в результирующей таблице: member_name costs
-- Используйте конструкцию "as costs" для отображения затраченной суммы членом семьи. Это необходимо для корректной проверки.

SELECT member_name, SUM(Payments.amount*Payments.unit_price) as costs FROM FamilyMembers
JOIN Payments ON FamilyMembers.member_id= Payments.family_member
WHERE YEAR(date) = '2005' AND MONTH(date) = '6'
GROUP BY member_name;

-- 9. Определить, какие товары не покупались в 2005 году
-- Поля в результирующей таблице: good_name
-- Все доступные к покупке продукты находятся в таблице Goods

SELECT good_type_name
FROM GoodTypes
WHERE good_type_id not in
(SELECT type FROM Payments
JOIN Goods ON Goods.good_id = Payments.good
WHERE YEAR(date) = 2005);


-- 10. Узнать, сколько потрачено на каждую из групп товаров в 2005 году. Вывести название группы и сумму
-- Поля в результирующей таблице: good_type_name costs
-- Используйте конструкцию "as costs" для отображения затраченной суммы на конкретную группу товаров. Это необходимо для корректной проверки.

SELECT good_type_name, SUM(amount*unit_price) AS costs
FROM GoodTypes
JOIN Goods ON GoodTypes.good_type_id = Goods.type
JOIN Payments ON Goods.good_id = Payments.good
WHERE YEAR(date) = 2005
GROUP BY good_type_name;

-- 11. Найдите среднюю цену икры на основе данных, хранящихся в таблице Payments. В базе данных хранятся данные о покупках красной (red caviar) и черной икры (black caviar). В ответе должна быть одна строка со средней ценой всей купленной когда-либо икры.
-- Поля в результирующей таблице: cost
-- Используйте конструкцию "as cost" для агрегатной функции подсчета средней цены икры. Это необходимо для корректной проверки.

SELECT SUM(amount * unit_price) / SUM(amount) AS cost FROM Payments 
JOIN Goods ON Goods.good_id = Payments.good
WHERE  
good_name = 'red caviar'
OR 
good_name = 'black caviar';

-- 12. Вывести всех членов семьи с фамилией Quincey.
-- Поля в результирующей таблице: *
SELECT * FROM FamilyMembers
WHERE member_name LIKE '%Quincey%';

-- 13. Вывести средний возраст людей (в годах), хранящихся в базе данных. Результат округлите до целого в меньшую сторону.
-- Поля в результирующей таблице: age
-- Используйте конструкцию "as age" для агрегатной функции подсчета среднего возраста. Это необходимо для корректной проверки.
-- округл в меньшую, до ближ и в большую стороны FLOOR, ROUND, CEIL

SELECT FLOOR(AVG(TIMESTAMPDIFF(YEAR, birthday, CURDATE()))) AS age 
FROM FamilyMembers;


























