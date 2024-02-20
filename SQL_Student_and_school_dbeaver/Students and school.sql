DROP DATABASE IF EXISTS Student_and_school;
CREATE DATABASE Student_and_school;
USE Student_and_school;


DROP TABLE IF EXISTS Student;
CREATE TABLE Student (
	id	INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(50),
	middle_name VARCHAR(50),
	last_name VARCHAR(50),
	birthday DATE,
	address	VARCHAR(50)
);

DROP TABLE IF EXISTS class;
CREATE TABLE class (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50)
);

DROP TABLE IF EXISTS Student_in_class;
CREATE TABLE Student_in_class (
	id INT AUTO_INCREMENT PRIMARY KEY,
	class INT,
	student INT,
	FOREIGN KEY(class) REFERENCES Student(id),
	FOREIGN KEY (class) REFERENCES Class(id)
);	


DROP TABLE IF EXISTS Subject;
CREATE TABLE Subject (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50)
);	

DROP TABLE IF EXISTS Teacher;
CREATE TABLE Teacher (
	id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(50),
	middle_name VARCHAR(50),
	last_name VARCHAR(50)
);	

DROP TABLE IF EXISTS Timepair;
CREATE TABLE Timepair (
	id INT AUTO_INCREMENT PRIMARY KEY,
	start_pair TIME,
	end_pair TIME
);	

DROP TABLE IF EXISTS Schedule;
CREATE TABLE Schedule (
	id	INT,
	date DATE,
	class INT,
	number_pair INT,
	teacher	INT,
	subject	INT,
	classroom INT,
	FOREIGN KEY(class) REFERENCES Class(id),
	FOREIGN KEY(number_pair) REFERENCES Timepair(id),
	FOREIGN KEY(teacher) REFERENCES Teacher(id),
	FOREIGN KEY(subject) REFERENCES Subject(id)
	);

INSERT INTO Subject (id, name) VALUES
(1, 'Math'),
(2, 'Russian language'),
(3, 'Literature'),
(4, 'Physics'),
(5, 'Chemistry'),
(6, 'Geography'),
(7, 'History'),
(8, 'Biology'),
(9, 'English language'),
(10, 'Informatics'),
(11, 'Physical Culture'),
(12, 'Robotics'),
(13, 'Technology');

INSERT INTO Teacher (id, first_name, middle_name, last_name) VALUES
(1, 'Pavel', 'Petrovich', 'Romashkin'),
(2, 'Vasilij', 'Antonovich', 'Kolesnikov'),
(3, 'Mariya', 'Stepanovna', 'Vaulina'),
(4, 'Taisiya', 'Timurovna', 'ZHedrinskaya'),
(5, 'Marina', 'Gennadevna', 'Sosnovskaya'),
(6, 'Ekaterina', 'YAkovlevna', 'Myasoedova'),
(7, 'Liliya', 'Timurovna', 'Arakcheeva'),
(8, 'Sofya', 'Dmitrievna', 'Krauze'),
(9, 'Viktoriya', 'Nikolaevna', 'Ostrozhskaya'),
(10, 'YUrij', NULL, 'Krylov'),
(11, 'Andrej', NULL, 'Evseev'),
(12, 'Bogdan', 'Romanovich', 'Moiseev'),
(13, 'Aleksandr', 'Vladimirovich', 'Sobolev'),
(14, 'Vasil''ev', 'Vasilij', 'Vasil''evich'),
(15, 'Petr', 'Alekseevich', 'Romashkin');

INSERT INTO Timepair (id, start_pair, end_pair) VALUES
(1, '8:30:00', '9:15:00'),
(2, '9:20:00', '10:05:00'),
(3, '10:15:00', '11:00:00'),
(4, '11:05:00', '11:50:00'),
(5, '12:50:00', '13:35:00'),
(6, '13:40:00', '14:25:00'),
(7, '14:35:00', '15:20:00'),
(8, '15:25:00', '16:10:00');

INSERT INTO Student (id, first_name, middle_name, last_name, birthday, address) VALUES
(1, 'Nikolaj', 'Fedorovich', 'Sokolov', '2000-10-01', 'ul. Pushkina, d. 36, kv. 5'),
(2, 'Vyacheslav', 'Evgenevich', 'Eliseev', '2000-11-21', 'ul. Pushkina, d. 40, kv. 7'),
(3, 'Ivan', 'Antonovich', 'Efremov', '2000-09-19', 'ul. Pushkina, d. 58, kv. 16'),
(4, 'Anatolij', 'Valentinovich', 'ZHdanov', '2007-07-15', 'ul. Pushkina, d. 21, kv. 7'),
(5, 'Georgij', 'Dmitrievich', 'Noskov', '2000-03-03', 'ul. Pushkina, d. 45, kv. 65'),
(6, 'Artyom', 'Borisovich', 'Sergeev', '2007-01-01', 'ul. Pushkina, d. 1, kv. 5'),
(7, 'Arina', 'Fyodorovna', 'Evseeva', '2000-08-11', 'ul. Pushkina, d. 21, kv. 51'),
(8, 'Angelina', 'Aleksandrovna', 'Voroncova', '2000-05-21', 'ul. Pervomajskaya, d. 121, kv. 5'),
(9, 'Ekaterina', 'Alekseevna', 'Ustinova', '2000-01-04', 'ul. Pervomajskaya, d. 45, kv. 2'),
(10, 'Raisa', 'Semyonovna', 'Lapina', '2000-02-05', 'ul. Pervomajskaya, d. 56, kv. 7'),
(11, 'Leonid', 'Nikitich', 'Ignatov', '2007-12-30', 'ul. Pushkina, d. 78, kv. 9'),
(12, 'Snezhana', 'YAkovlevna', 'Seliverstova', '2000-07-23', 'ul. Pushkina, d. 78, kv. 56'),
(13, 'Semyon', 'Vladislavovich', 'Biryukov', '2000-09-11', 'ul. CHernova, d. 54, kv. 67'),
(14, 'Georgij', 'Vyacheslavovich', 'Baranov', '2001-01-11', 'ul. CHernova, d. 56, kv. 89'),
(15, 'YUliya', 'Rostislavovna', 'Vishnyakova', '2001-12-03', 'ul. Kuratova, d. 96, kv. 45'),
(16, 'Valentina', 'Andreevna', 'Bolshakova', '2001-05-30', 'ul. Pervomajskaya, d. 89, kv. 67'),
(17, 'Leonid', 'Romanovich', 'Kryukov', '2001-06-04', 'ul. Zapadnaya, d. 78, kv. 9'),
(18, 'Vladislav', 'Sergeevich', 'Cvetkov', '2001-04-05', 'ul. Karla Marksa, d. 89, kv. 7'),
(19, 'Snezhana', 'Ivanovna', 'Morozova', '2001-11-06', 'ul. Internacionalnaya, d. 7, kv. 9'),
(20, 'Lyubov', 'Maksimovna', 'Borisova', '2001-07-12', 'ul. Kirova, d. 23, kv. 13'),
(21, 'Anfisa', 'Antonovna', 'Kalashnikova', '2001-01-11', 'ul. Oplesnina, d. 4, kv. 4'),
(22, 'Anna', 'Olegovna', 'Osipova', '2001-04-16', 'ul. CHernova, d. 32, kv. 56'),
(23, 'Kristina', 'Fyodorovna', 'Myasnikova', '2001-02-03', 'ul. YUzhnaya, d. 45, kv. 56'),
(24, 'Kristina', 'Glebovna', 'Smirnova', '2001-03-04', 'ul. Markova, d. 78, kv. 67'),
(25, 'Boris', 'Innokentevich', 'Simonov', '2001-04-05', 'ul. Kuratova, d. 89, kv. 78'),
(26, 'Dmitrij', 'Leonidovich', 'Trofimov', '2001-05-06', 'ul. Pushkina, d. 78, kv. 9'),
(27, 'YAkov', 'Leonidovich', 'Rozhkov', '2001-06-07', 'ul. Karla Marksa, d. 45, kv. 7'),
(28, 'Fyodor', 'Rostislavovich', 'Drozdov', '2001-07-08', 'ul. Pervomajskaya, d. 23, kv. 34'),
(29, 'Gleb', 'Antonovich', 'Strelkov', '2001-08-09', 'ul. Zapadnaya, d. 23, kv. 13'),
(30, 'Angelina', 'Aleksandrovna', 'Lukina', '2001-09-10', 'ul. Internacionalnaya, d. 45, kv. 7'),
(31, 'Nina', 'Ilinichna', 'Odincova', '2001-10-11', 'ul. Kuratova, d. 4, kv. 76'),
(32, 'Valeriya', 'Olegovna', 'Novikova', '2001-11-12', 'ul. Kirova, d. 3, kv. 56'),
(33, 'Grigorij', 'Gennadevich', 'Kapustin', '2001-12-13', 'ul. Pervomajskaya, d. 45, kv. 6'),
(34, 'Vitalij', 'Eduardovich', 'Panfilov', '2001-01-01', 'ul. CHernova, d. 34, kv. 87'),
(35, 'Svyatoslav', 'Vyacheslavovich', 'Tarasov', '2002-01-14', 'ul. Pushkina, d. 5, kv. 6'),
(36, 'Matvej', 'Vyacheslavovich', 'YAkushev', '2002-02-15', 'ul. Zapadnaya, d. 7, kv. 8'),
(37, 'Ilya', 'Stepanovich', 'Alekseev', '2002-03-16', 'ul. Pervomajskaya, d. 9, kv. 12'),
(38, 'Lyubov', 'Vyacheslavovna', 'Zaharova', '2002-04-17', 'ul. CHernova, d. 12, kv. 13'),
(39, 'Polina', 'Kirillovna', 'Sidorova', '2002-05-18', 'ul. Kuratova, d. 13, kv. 14'),
(40, 'Elizaveta', 'Fyodorovna', 'Samojlova', '2002-06-19', 'ul. Karla Marksa, d. 46, kv. 45'),
(41, 'YUliya', 'Daniilovna', 'Avdeeva', '2002-07-20', 'ul. Internacionalnaya, d. 87, kv. 78'),
(42, 'Matvej', 'Gennadevich', 'Bogdanov', '2002-08-21', 'ul. Pervomajskaya, d. 9, kv. 8'),
(43, 'Ilya', 'Egorovich', 'Filippov', '2002-09-22', 'ul. CHernova, d. 100, kv. 90'),
(44, 'Denis', 'Nikitich', 'Mel', '2002-10-23', 'ul. Kirova, d. 123, kv. 45'),
(45, 'Svyatoslav', 'Valentinovich', 'Muravyov', '2002-11-24', 'ul. Pervomajskaya, d. 45, kv. 67'),
(46, 'Anna', 'Denisovna', 'Kulagina', '2002-12-25', 'ul. CHernova, d. 7, kv. 78'),
(47, 'ZHanna', 'Ilinichna', 'Fokina', '2002-01-26', 'ul. Karla Marksa, d. 8, kv. 9'),
(48, 'Valeriya', 'YUrevna', 'Lapina', '2002-02-27', 'ul. Oplesnina, d. 78, kv. 56'),
(49, 'Valentina', 'Andreevna', 'Sazonova', '2002-03-01', 'ul. Zapadnaya, d. 84, kv. 48'),
(50, 'Nataliya', 'Igorevna', 'Myasnikova', '2002-04-02', 'ul. Pushkina, d. 1, kv. 23'),
(51, 'Viktoriya', 'YAroslavovna', 'Makarova', '2002-05-03', 'ul. Kirova, d. 5, kv. 8'),
(52, 'Stanislav', NULL, 'Lazarev', '2002-06-04', 'ul. Internacionalnaya, d. 6, kv. 9'),
(53, 'Gennadij', 'Denisovich', 'Ovchinnikov', '2002-07-05', 'ul. Kuratova, d. 7, kv. 9'),
(54, 'Roman', 'Nikolaevich', 'SHilov', '2003-08-06', 'ul. Pushkina, d. 56, kv. 80'),
(55, 'Timur', 'Ilich', 'Subbotin', '2003-09-07', 'ul. Zapadnaya, d. 47, kv. 39'),
(56, 'Danila', 'Ivanovich', 'Osipov', '2003-10-08', 'ul. CHernova, d. 78, kv. 69'),
(57, 'Arina', 'Timofeevna', 'Silina', '2003-11-09', 'ul. CHernova, d. 75, kv. 39'),
(58, 'Nadezhda', 'Ilinichna', 'Zaharova', '2003-12-10', 'ul. Internacionalnaya, d. 70, kv. 84'),
(59, 'Larisa', 'Stanislavovna', 'SHCHerbakova', '2003-01-11', 'ul. Pervomajskaya, d. 94, kv. 4'),
(60, 'Aleksandra', 'Andreevna', 'Belozyorova', '2003-02-12', 'ul. Pushkina, d. 3, kv. 21'),
(61, 'Natalya', 'Nikolaevna', 'Davydova', '2003-03-13', 'ul. Zapadnaya, d. 4, kv. 2'),
(62, 'Mariya', 'Valerievna', 'Fadeeva', '2003-04-14', 'ul. CHernova, d. 8, kv. 5'),
(63, 'YUrij', 'Denisovich', 'Markov', '2003-05-15', 'ul. Kuratova, d. 9, kv. 5'),
(64, 'Kirill', NULL, 'SHubin', '2003-06-16', 'ul. Zapadnaya, d. 6, kv. 3'),
(65, 'Grigorij', 'Kirillovich', 'Kolobov', '2003-07-17', 'ul. CHernova, d. 9, kv. 34'),
(66, 'Semyon', 'Semyonovich', 'Trofimov', '2003-08-18', 'ul. Karla Marksa, d. 11, kv. 56'),
(67, 'Vasilij', 'Gennadevich', 'Ustinov', '2003-09-17', 'ul. Oplesnina, d. 11, kv. 13'),
(68, 'Valentina', 'YAkovlevna', 'SHarova', '2003-10-04', 'ul. Pervomajskaya, d. 31, kv. 3'),
(69, 'Larisa', 'Timurovna', 'Savina', '2004-11-05', 'ul. Zapadnaya, d. 22, kv. 33'),
(70, 'Galina', 'YAroslavovna', 'Orekhova', '2004-12-07', 'ul. Internacionalnaya, d. 77, kv. 87'),
(71, 'Arina', 'Ivanovna', 'SHarapova', '2004-01-08', 'ul. Kirova, d. 47, kv. 94'),
(72, 'Viktoriya', 'YUrevna', 'Sergeeva', '2004-02-09', 'ul. Kuratova, d. 44, kv. 87'),
(73, 'Vasilij', 'Glebovich', 'Krasilnikov', '2004-03-15', 'ul. Zapadnaya, d. 101, kv. 92'),
(74, 'Timur', 'Filippovich', 'Rusakov', '2004-04-26', 'ul. CHernova, d. 197, kv. 56'),
(75, 'Gleb', 'Timofeevich', 'Nesterov', '2004-05-05', 'ul. Pervomajskaya, d. 91, kv. 71'),
(76, 'Denis', 'Matveevich', 'Makarov', '2004-05-09', 'ul. CHernova, d. 41, kv. 31'),
(77, 'Elizaveta', 'Borisovna', 'SHilova', '2004-06-14', 'ul. Karla Marksa, d. 68, kv. 15'),
(78, 'Vera', 'Lvovna', 'Evseeva', '2004-07-04', 'ul. Pushkina, d. 5, kv. 13'),
(79, 'Margarita', 'Vladislavovna', 'Kabanova', '2004-08-08', 'ul. Kuratova, d. 98, kv. 67'),
(80, 'Angelina', 'Danilovna', 'Lazareva', '2004-09-04', 'ul. Zapadnaya, d. 67, kv. 93'),
(81, 'Semyon', 'Anatolevich', 'Voronov', '2004-10-05', 'ul. Oplesnina, d. 89, kv. 89'),
(82, 'Innokentij', 'Vyacheslavovich', 'Nekrasov', '2004-01-06', 'ul. CHernova, d. 777, kv. 77'),
(83, 'Artyom', 'Viktorovich', 'Nikitin', '2004-11-07', 'ul. Internacionalnaya, d. 666, kv. 7'),
(84, 'Egor', 'Petrovich', 'Belyakov', '2004-12-08', 'ul. Zapadnaya, d. 87, kv. 9'),
(85, 'Elizaveta', NULL, 'Fadeeva', '2001-11-01', 'ul. Zapadnaya, d. 7, kv. 19');

INSERT INTO Class (id, name) VALUES
(1, '8 A'),
(2, '8 B'),
(3, '9 C'),
(4, '9 B'),
(5, '9 A'),
(6, '10 B'),
(7, '10 A'),
(8, '11 B'),
(9, '11 A'),
(10, '7 A'),
(11, '7 B'),
(13, '6 A'),
(14, '6 B'),
(15, '5 A'),
(16, '5 B'),
(17, '4 A');

INSERT INTO Student_in_class (id, class, student) VALUES
(67, 9, 1), (68, 9, 2), (69, 9, 3), (57, 9, 4),(71, 9, 5), (72, 9, 6), (73, 9, 7), (74, 9, 8), (75, 9, 9),
(76, 9, 10),(77, 9, 11), (78, 9, 12), (79, 9, 13), (80, 8, 14), (81, 8, 15), (82, 8, 16), (83, 8, 17), (84, 8, 18),
(85, 8, 19), (86, 8, 20), (87, 8, 21), (88, 8, 22), (89, 8, 23), (90, 8, 24), (91, 7, 25), (92, 7, 26), (93, 7, 27),
(94, 7, 28), (95, 7, 29), (96, 7, 30), (97, 7, 31), (98, 7, 32), (99, 7, 33), (100, 7, 34), (101, 6, 35), (102, 6, 36),
(103, 6, 37), (104, 6, 38), (105, 6, 39), (106, 6, 40), (107, 6, 41), (108, 6, 42), (109, 6, 43), (110, 6, 44), (111, 6, 45),
(112, 5, 46), (113, 5, 47), (114, 5, 48), (115, 5, 49), (116, 5, 50), (117, 5, 51), (118, 5, 52), (119, 5, 53), (120, 4, 54),
(121, 4, 55), (122, 4, 56), (123, 4, 57), (124, 4, 58), (125, 4, 59), (126, 4, 60), (127, 4, 61), (128, 4, 62), (129, 3, 63),
(130, 3, 64), (131, 3, 65), (132, 3, 66), (133, 3, 67), (134, 3, 68), (135, 3, 69), (136, 3, 70), (137, 2, 71), (138, 2, 72),
(139, 2, 73), (140, 2, 74), (141, 2, 75), (142, 2, 76), (143, 2, 77), (144, 1, 78), (145, 1, 79), (146, 1, 80), (147, 1, 81),
(148, 1, 82), (149, 1, 83), (150, 1, 84);

INSERT INTO Schedule (id, date, class, number_pair, teacher, subject, classroom) VALUES
(1, '2019-09-01T00:00:00', 9, 1, 11, 1, 47),
(2, '2019-09-01T00:00:00', 9, 2, 8, 2, 13),
(3, '2019-09-01T00:00:00', 9, 3, 4, 3, 13),
(4, '2019-09-02T00:00:00', 9, 1, 4, 3, 13),
(5, '2019-09-02T00:00:00', 9, 2, 2, 4, 34),
(6, '2019-09-02T00:00:00', 9, 3, 6, 5, 35),
(7, '2019-09-03T00:00:00', 9, 1, 5, 6, 36),
(8, '2019-09-03T00:00:00', 9, 2, 13, 7, 37),
(9, '2019-09-03T00:00:00', 9, 3, 6, 8, 38),
(10, '2019-09-04T00:00:00', 9, 1, 9, 9, 39),
(11, '2019-09-04T00:00:00', 9, 2, 10, 10, 40),
(12, '2019-09-04T00:00:00', 9, 3, 3, 11, 41),
(13, '2019-09-05T00:00:00', 9, 1, 3, 13, 43),
(14, '2019-09-05T00:00:00', 9, 2, 11, 1, 47),
(15, '2019-09-05T00:00:00', 9, 3, 5, 6, 36),
(16, '2019-08-30T00:00:00', 9, 1, 2, 4, 34),
(17, '2019-08-30T00:00:00', 9, 2, 8, 2, 13),
(18, '2019-08-30T00:00:00', 9, 3, 6, 5, 35),
(19, '2019-08-30T00:00:00', 9, 4, 10, 1, 47),
(20, '2019-09-03T00:00:00', 9, 4, 10, 10, 40),
(21, '2019-08-30T00:00:00', 8, 1, 7, 9, 53),
(22, '2019-08-30T00:00:00', 8, 2, 7, 9, 53),
(23, '2019-08-30T00:00:00', 8, 3, 8, 2, 38),
(24, '2019-08-30T00:00:00', 8, 4, 11, 1, 43),
(25, '2019-08-30T00:00:00', 8, 5, 8, 3, 39),
(26, '2019-09-01T00:00:00', 8, 2, 2, 4, 34),
(27, '2019-09-01T00:00:00', 8, 3, 6, 5, 35),
(28, '2019-09-01T00:00:00', 8, 4, 12, 6, 36),
(29, '2019-09-01T00:00:00', 8, 5, 13, 7, 37),
(30, '2019-09-02T00:00:00', 8, 3, 6, 8, 38),
(31, '2019-09-02T00:00:00', 8, 4, 7, 9, 53),
(32, '2019-09-03T00:00:00', 8, 1, 10, 10, 40),
(33, '2019-09-03T00:00:00', 8, 2, 7, 9, 53),
(34, '2019-09-03T00:00:00', 8, 3, 7, 9, 53),
(35, '2019-09-04T00:00:00', 8, 1, 1, 11, 4),
(36, '2019-09-04T00:00:00', 8, 2, 1, 12, 42),
(37, '2019-09-04T00:00:00', 8, 3, 3, 13, 43),
(38, '2019-09-04T00:00:00', 8, 4, 8, 2, 42),
(39, '2019-09-04T00:00:00', 8, 5, 11, 1, 43),
(40, '2019-09-05T00:00:00', 8, 2, 11, 1, 43),
(41, '2019-09-03T00:00:00', 7, 1, 8, 2, 42),
(42, '2019-09-03T00:00:00', 7, 2, 4, 3, 13),
(43, '2019-09-03T00:00:00', 7, 3, 15, 10, 40);

-- 1. Сколько всего 10-ых классов
-- Поля в результирующей таблице: count
-- Используйте конструкцию "as count" для агрегатной функции подсчета количества классов. Это необходимо для корректной проверки.

SELECT COUNT(name) AS count FROM class
WHERE name LIKE '%10%';

-- 2. Сколько различных кабинетов школы использовались 2 сентября 2019 года для проведения занятий?
-- Поля в результирующей таблице: count
-- Используйте конструкцию "as count" для агрегатной функции подсчета количества различных кабинетов. Это необходимо для корректной проверки.

SELECT COUNT(classroom) AS count FROM Schedule
WHERE date = '2019-09-02';

-- 3. Выведите информацию об обучающихся живущих на улице Пушкина (ul. Pushkina)?
-- Поля в результирующей таблице: *

SELECT * FROM Student
WHERE address LIKE '%ul. Pushkina%';

-- 4. Сколько лет самому молодому обучающемуся ?
-- Поля в результирующей таблице: year

SELECT MIN(TIMESTAMPDIFF(YEAR, birthday, CURDATE())) AS year 
FROM Student;

-- 5. Сколько Анн (Anna) учится в школе ?
-- Поля в результирующей таблице: count

SELECT COUNT(first_name) AS count FROM student
WHERE first_name LIKE 'Anna';

-- 6. Сколько обучающихся в 10 B классе ?
-- Поля в результирующей таблице: count

SELECT COUNT(sc.id) AS count FROM Student_in_class sc
JOIN Class c ON sc.class = c.id
WHERE name = '10 B'
ORDER BY COUNT;

-- 7. Выведите название предметов, которые преподает Ромашкин П.П. (Romashkin P.P.) ?
-- Поля в результирующей таблице: subjects

SELECT Subject.name AS subjects
-- , Teacher.first_name, Teacher.last_name, Teacher.middle_name 
FROM Subject 
JOIN Schedule ON Subject.id = Schedule.subject
JOIN Teacher ON Schedule.teacher = Teacher.id
WHERE Teacher.last_name = 'Romashkin'
AND Teacher.first_name LIKE 'P%'
AND Teacher.middle_name LIKE 'P%';

-- 8. Во сколько начинается 4-ый учебный предмет по расписанию ?
-- Поля в результирующей таблице: start_pair

SELECT start_pair FROM Timepair
WHERE id = 4;

-- 9. Сколько времени обучающийся будет находиться в школе, учась со 2-го по 4-ый уч. предмет?
-- Поля в результирующей таблице:  time
-- Используйте конструкцию "as time" для указания разницы во времени. Это необходимо для корректной проверки.
-- Результат должен быть в формате HH:MM:SS

SELECT TIMEDIFF(end_pair, (SELECT
start_pair FROM Timepair WHERE id = 2)) AS time 
FROM Timepair WHERE id = 4;

-- 10. Выведите фамилии преподавателей, которые ведут физическую культуру (Physical Culture). 
-- Отсортируйте преподавателей по фамилии в алфавитном порядке.
-- Поля в результирующей таблице: last_name

SELECT last_name FROM Teacher
JOIN Schedule ON Teacher.id = Schedule.teacher
JOIN Subject ON Subject.id = Schedule.subject
WHERE Subject.name = 'Physical Culture'
ORDER BY last_name

-- 11. Найдите максимальный возраст (колич. лет) среди обучающихся 10 классов ?
-- Поля в результирующей таблице: max_year

SELECT MAX(TIMESTAMPDIFF(YEAR, birthday, CURDATE())) AS max_year FROM student
JOIN Student_in_class ON Student_in_class.class = Student.id
JOIN Class ON Class.id = Student_in_class.class
WHERE Class.name like '10%';

-- 12. Какие кабинеты чаще всего использовались для проведения занятий? 
-- Выведите те, которые использовались максимальное количество раз.
-- Поля в результирующей таблице: classroom

SELECT DISTINCT classroom
FROM (
	SELECT classroom,
		RANK() OVER(ORDER BY COUNT(*) DESC) AS class_rank
	FROM Schedule
	GROUP BY classroom
)AS ranked
WHERE class_rank = 1;

-- 13. В каких классах введет занятия преподаватель "Krauze" ?
-- Поля в результирующей таблице: name

SELECT DISTINCT name FROM Class
JOIN Schedule ON Schedule.class = Class.id
JOIN Teacher ON Teacher.id = Schedule.teacher
WHERE last_name = 'Krauze';

-- 14. Сколько занятий провел Krauze 30 августа 2019 г.?
-- Поля в результирующей таблице: count	

SELECT COUNT(*) AS count FROM Schedule
JOIN Teacher ON Teacher.id=Schedule.teacher
WHERE last_name = 'Krauze'
AND date = '2019-08-30';

-- 15. Выведите заполненность классов в порядке убывания
-- Поля в результирующей таблице: name count

SELECT name, COUNT(Student_in_class.student) as count
FROM Class
LEFT JOIN Student_in_class ON Class.id = Student_in_class.class
WHERE Student_in_class.student IS NOT NULL
GROUP BY name
ORDER BY count DESC;

-- 16. Какой процент обучающихся учится в "10 A" классе? Выведите ответ в диапазоне от 0 до 100 без округления, например, 96.0201.
-- Поля в результирующей таблице: percent

