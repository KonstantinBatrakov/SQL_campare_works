use wells;
-- примеры чтобы вспомнить. 
SELECT 
namber_kust
, type_well
, count(namber_kust)
FROM well
where type_well = 'горизонтальная скв'
GROUP BY namber_kust
ORDER BY namber_kust;


SELECT 
namber_kust
, type_well
, count(namber_kust)
FROM well
where type_well = 'наклонная скв'
GROUP BY namber_kust
ORDER BY namber_kust;




-- 6. скрипты характерных выборок (включающие группировки, JOIN'ы, вложенные
-- таблицы)решить 6 задач с JOIN. Написать название задачи и скрипт.;

-- Задание 1-2. Определить cписок скважин, на которых был хотя бы 1 ГТМ GRP. Вывести по ним id, номер скв, 
-- номер куста и отфильтровать по кустам
SELECT DISTINCT nov_str_id FROM nov_str;
-- 1 решение через SELECT 
SELECT 
id, namber_well , namber_kust
FROM well
WHERE id IN (
SELECT nov_str_id FROM nov_str WHERE vid_gtm = 'GRP')
 GROUP BY id 
 ORDER BY namber_kust DESC
;
-- 2 решение через JOIN
SELECT w.id, w.namber_well, w.namber_kust
FROM well AS w
JOIN 
nov_str AS n_s
ON
w.id = n_s.nov_str_id AND n_s. vid_gtm = 'GRP'
 GROUP BY id 
 ORDER BY namber_kust DESC
;

-- Задание 3-4. Подсчитать общее количество данных в MER, для скважин младше 10 лет.
-- 3 решение через SELECT 
    SELECT 
COUNT(id) AS 'кол_данных' 
FROM mer
WHERE mer_id IN (
  SELECT id 
  FROM well 
  WHERE id IN(
     SELECT delo_well_id
     FROM delo_well dw 
     WHERE TIMESTAMPDIFF(YEAR, date_bureniya, NOW()) < 10)
     );
-- 4 решение через JOIN
SELECT 
COUNT(m.id) AS 'кол_данных'
FROM mer AS m
JOIN delo_well AS d_w 
ON m.mer_id = d_w.delo_well_id 
AND 
TIMESTAMPDIFF(YEAR, d_w.date_bureniya, NOW()) < 10
;

-- Задание 5. Определить все скважины на которых были оба вида ГТМ GRP и OPZ
-- 5 решение через JOIN
SELECT 
w.id, w.namber_well
FROM well AS w
JOIN nov_str AS ns 
ON w.id = ns.nov_str_id 
JOIN nov_str_grp nsg 
ON ns.id = nsg.nov_str_GRP_id
JOIN nov_str_opz nso
ON ns.id = nso.nov_str_OPZ_id 
GROUP BY w.id
ORDER BY w.id
;

-- Задание 6. Определить все горизонтальные скважины и № кустовой площадки 
-- с глубиной более H_well = 4500м и наличием нефтяного коллектора  

SELECT 
w.namber_well AS 'номер скважины',
w.namber_kust  AS 'куст',
w.type_well AS 'тип скв',
dw.h_well AS 'глубина скв'
-- , COUNT(w.namber_well) AS 'кол-во длинных ГС с нефтью'
FROM well AS w 
JOIN gis AS g 
ON g.gis_id = w.id 
AND w.type_well = 'горизонтальная скв'
-- AND w.namber_kust = 6
AND g.nalich_neft_koll = 'да'
JOIN 
delo_well AS dw
ON w.id = dw.delo_well_id 
AND dw.h_well > 4500
;



-- 7.представления (минимум 2). Написать название задачи и скрипт.;

-- 1. Cоздать представление, которое выводит все пласты на  определенную скважину 
CREATE OR REPLACE VIEW plast_wells
AS 
SELECT *
FROM well w
	JOIN wells_plasts wp ON w.id = wp.well_id
	-- JOIN plast p ON wp.plast_id = p.id
;

SELECT * 
FROM plast_wells
WHERE id=1;

-- 2. Cоздать представление, которое выводит все скважины определенного пласта 
CREATE OR REPLACE VIEW well_plast
AS 
SELECT *
FROM wells_plasts wp
	JOIN plast p ON wp.plast_id = p.id
;

SELECT * 
FROM well_plast
WHERE id=1; 

-- 3. Cоздать представление, которое выводит название скважины, номер куста, тип из WELL и
-- соответсвуюшее ей влияющую пару из таблицы PARY
CREATE OR REPLACE VIEW pary_wells
AS 
SELECT *
FROM well w
	JOIN pary p ON w.id = p.para2_well_id
WHERE p.status = 'влияют' 
    UNION
SELECT *
FROM well w
	JOIN pary p ON w.id = p.para1_well_id
WHERE p.status = 'влияют';

SELECT id, namber_well, namber_kust, type_well, para1_well_id, para2_well_id, status 
FROM pary_wells
WHERE id=1;

-- 8. хранимые процедуры и триггеры. по 2 штуки. Написать название задачи и скрипт.;

-- ПРОЦЕДУРА №1
-- найти скважины которые относятся к скважине как 
-- 1. влияющие пары
-- 2. имеют один метод работы
-- 3. пары пар

DROP PROCEDURE IF EXISTS sp_well_1;
DELIMITER $$
CREATE PROCEDURE sp_well_1(for_well_id BIGINT)
BEGIN
-- пары влияющие	
WITH pary_w AS (
SELECT para1_well_id AS id
    FROM pary
    WHERE status = 'влияют' AND para2_well_id = for_well_id 
    UNION
    SELECT para2_well_id AS id
    FROM pary
    WHERE status = 'влияют' AND para1_well_id = for_well_id 
)
-- обшие методы работы "ЭЦН/ФОНТАН" по данным МЭР
	SELECT 	m2.mer_id
	FROM mer m1 
	JOIN mer m2 ON m1.metod = m2.metod 
	WHERE m1.mer_id=for_well_id AND m2.mer_id <> for_well_id
-- пары пар
    UNION
	SELECT pr.para1_well_id
    	FROM pary_w p_w
        JOIN pary pr ON pr.para2_well_id = p_w.id
	WHERE pr.para1_well_id != for_well_id  AND pr.status = 'влияют'
    UNION
    	SELECT pr.para2_well_id
    	FROM  pary_w p_w
        JOIN  pary pr ON pr.para1_well_id = p_w.id 
	WHERE pr.para2_well_id != for_well_id  AND pr.status = 'влияют'
ORDER BY mer_id;
END$$
DELIMITER ;

CALL sp_well_1(1);

-- ПРОЦЕДУРА №2
-- найти 5 скважин которые относятся к заданнойскважине по условию: 
-- скважины с одной кустовой площадки
-- одинаковый вид ГТМ
-- имеют одну группу по пластам

DROP PROCEDURE IF EXISTS sp_well_2;
DELIMITER $$
CREATE PROCEDURE sp_well_2(for_well_id BIGINT)
BEGIN
-- скважины с одной кустовой площадки		
SELECT 	w1.id
	FROM well w1 
	JOIN well w2 ON w1.namber_kust = w2.namber_kust 
	WHERE w1.id=for_well_id AND w2.id <> for_well_id
	UNION
-- одинаковый вид ГТМ
	SELECT 	gtm1.nov_str_id
	FROM nov_str gtm1 
	JOIN nov_str gtm2 ON gtm1.vid_gtm = gtm2.vid_gtm 
	WHERE gtm1.nov_str_id=for_well_id AND gtm2.nov_str_id <> for_well_id
	UNION
-- обшие объект работы "plast_id"
SELECT 	wp2.well_id
	FROM wells_plasts wp1 
	JOIN wells_plasts wp2 ON wp1.plast_id = wp2.plast_id 
	WHERE wp1.well_id=for_well_id AND wp2.well_id <> for_well_id
ORDER BY id
limit 5;
END$$
DELIMITER ;

CALL sp_well_2(3);

-- Хранимая_ПРОЦЕДУРА №1
-- процедура добавления скважины и его данные в delo_well
-- ПОЧЕМУ ТО ОНА У МЕНЯ НЕ РАБОТАЕТ?????

/* DROP PROCEDURE IF EXISTS sp_ad_well;
DELIMITER $$
BEGIN
	DECLARE '_rollback' BIT DEFAULT b'0';
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN 
		SET '_rollback' = b'1';
	END;
	
	START TRANSACTION;

	INSERT INTO well (namber_well, namber_kust, dobycha_ppd, type_well)
	VALUES ('new', 2, 'добыча', 'горизонтальная скв');
	
	SET @last_delo_well_id = last_insert_id(); 
	
	INSERT INTO delo_well (delo_well_id, date_bureniya, h_well, h_koll, diametr_koll)
	VALUES (@last_delo_well_id, '1990-01-01', '5000', '4900', '168');

	IF 	'_	rollback' THEN
		ROLLBACK;
	ELSE
		COMMIT;
	END IF;
END$$
DELIMITER ;

CALL sp_ad_well(1);


SELECT * FROM well w
LEFT JOIN delo_well dw ON w.id = dw.delo_well_id 
ORDER BY w.id DESC;

*/


-- ТРИГГЕР №1
-- скопировал триггеры сюда, они рабочие, я их проверял.
-- №1 Триггер для данных hal. Не обновлять обводненность если значение превышает 100

DELIMITER //

CREATE DEFINER=`root`@`localhost` TRIGGER `chek_obvodnennost` BEFORE UPDATE ON `hal` FOR EACH ROW 
BEGIN 
	IF NEW.obvod > 100 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Сработал ТРИГГЕР. Обновление отменено. Неправильно указана обводненость';
	END IF;
END;
//

DELIMITER ;

-- проверка корректости
UPDATE hal 
SET obvod = 101
WHERE id = 1;

-- ТРИГГЕР №2
-- №2. Триггер для данных delo_well. Проверять перед вставкой даты начала бурения. 
-- Для будущих дат заменять значения на сегодня.
DELIMITER //

CREATE DEFINER=`root`@`localhost` TRIGGER `chek_well_dat_buureniya` BEFORE INSERT ON `delo_well` FOR EACH ROW BEGIN 
	IF NEW.date_bureniya > current_date() THEN
		SET NEW.date_bureniya = current_date();
	END IF;
END;

//
DELIMITER ;


