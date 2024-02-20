DROP DATABASE IF EXISTS wells;
CREATE DATABASE wells;
USE wells;

DROP TABLE IF EXISTS well;
CREATE TABLE well (
	id SERIAL PRIMARY KEY,
    namber_well INT UNSIGNED NOT NULL UNIQUE COMMENT 'номер скважины',
    namber_kust INT UNSIGNED NOT NULL COMMENT 'кустовая площадка',
    dobycha_ppd enum('добыча','нагнетание') COMMENT 'характер скв',
    type_well enum('горизонтальная скв','наклонная скв')COMMENT 'тип скв'
);

DROP TABLE IF EXISTS delo_well;
CREATE TABLE delo_well (
	delo_well_id SERIAL PRIMARY KEY,
	date_bureniya DATE COMMENT 'дата бурения',
	h_well INT UNSIGNED NOT NULL COMMENT 'глубина скважины',
	h_koll INT UNSIGNED NOT NULL COMMENT 'глубина экспл. колонны',
    diametr_koll INT UNSIGNED NOT NULL COMMENT 'диаметр экспл. колонны',
    created_at DATETIME DEFAULT NOW()
  );

ALTER TABLE delo_well ADD CONSTRAINT uniqkey_well_id
    FOREIGN KEY (delo_well_id) REFERENCES well(id)
    ON UPDATE CASCADE ON DELETE CASCADE;
   

DROP TABLE IF EXISTS mer;
CREATE TABLE mer (
	id SERIAL PRIMARY KEY,
	mer_id BIGINT UNSIGNED NOT NULL,
	date_mer DATE COMMENT 'дата замера',
	debit_gidk INT UNSIGNED COMMENT 'дебит жидкости',
    debit_neft double COMMENT 'дебит нефти',
    obvod INT UNSIGNED COMMENT 'обводненноость',
    time_work INT COMMENT 'время работы',
    metod enum('ЭЦН','ФОНТАН') COMMENT 'наличие оборудования',
    
    FOREIGN KEY (mer_id) REFERENCES well(id)
    ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS tr;
CREATE TABLE tr (
	id SERIAL PRIMARY KEY,
	tr_id BIGINT UNSIGNED NOT NULL,
	date_tr DATE COMMENT 'дата замера',
	debit_gidk INT UNSIGNED COMMENT 'дебит жидкости',
    debit_neft double COMMENT 'дебит нефти',
    obvod INT UNSIGNED COMMENT 'обводненноость',
    time_work INT COMMENT 'время работы',
    metod enum('ЭЦН','ФОНТАН') COMMENT 'наличие оборудования',
    
    FOREIGN KEY (tr_id) REFERENCES well(id)
    ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS nov_str;
CREATE TABLE nov_str (
	id SERIAL PRIMARY KEY,
	nov_str_id BIGINT UNSIGNED NOT NULL,
	vid_gtm enum('GRP', 'OPZ') COMMENT 'вид ГТМ',
	date_nov_str_1 DATE COMMENT 'дата начала',
	date_nov_str_2 DATE COMMENT 'дата окончания',
	debit_gidk INT UNSIGNED COMMENT 'дебит жидкости',
    debit_neft double COMMENT 'дебит нефти',
    
    FOREIGN KEY (nov_str_id) REFERENCES well(id)
    ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS nov_str_OPZ;
CREATE TABLE nov_str_OPZ(
	id SERIAL PRIMARY KEY,
	nov_str_OPZ_id BIGINT UNSIGNED NOT NULL,
	obem INT UNSIGNED COMMENT 'объем закачки',
	companiya enum('NGTH','MNGP') COMMENT 'компания подрядчик',
	Ppl INT UNSIGNED NOT NULL COMMENT 'пластовое давление',
	Scin INT UNSIGNED COMMENT 'значение скина',
	
    FOREIGN KEY (nov_str_OPZ_id) REFERENCES nov_str(id) 
    ON UPDATE CASCADE ON DELETE CASCADE
    );
    
DROP TABLE IF EXISTS nov_str_GRP;
CREATE TABLE nov_str_GRP(
	id SERIAL PRIMARY KEY,
	nov_str_GRP_id BIGINT UNSIGNED NOT NULL,
	massa INT UNSIGNED COMMENT 'масса проппанта',
	companiya enum('SHLB','SNPH') COMMENT 'компания подрядчик',
	Ppl INT UNSIGNED NOT NULL COMMENT 'пластовое давление',
	Scin INT UNSIGNED COMMENT 'значение скина',
	JD INT UNSIGNED NOT NULL COMMENT 'коэфф', 
	Hf INT UNSIGNED NOT NULL COMMENT 'длина трещины',
	Wf INT NOT NULL COMMENT 'ширина трещины',
	
    FOREIGN KEY (nov_str_GRP_id) REFERENCES nov_str(id) 
    ON UPDATE CASCADE ON DELETE CASCADE
    );
    
    DROP TABLE IF EXISTS hal;
CREATE TABLE hal (
	id SERIAL PRIMARY KEY,
	hal_id BIGINT UNSIGNED NOT NULL,
	date_hall DATE COMMENT 'дата замера',
    obvod INT UNSIGNED COMMENT 'обводненноость',
    metod enum('центр','осадк') COMMENT 'метод анализа',
    
    FOREIGN KEY (hal_id) REFERENCES well(id)
    ON UPDATE CASCADE ON DELETE CASCADE
);

  DROP TABLE IF EXISTS gis;
CREATE TABLE gis (
	id SERIAL PRIMARY KEY,
	gis_id BIGINT UNSIGNED NOT NULL,
	date_gis DATE COMMENT 'дата исследования',
    companiya enum('восток','запад') COMMENT 'компания предоставл усл ГИС',
    	h_zaboy INT UNSIGNED NOT NULL COMMENT 'текущий забой',
	azimut INT UNSIGNED NOT NULL,
	nalich_koll enum('да','нет') COMMENT 'признак по коллектору',
    nalich_neft_koll enum('да','нет') COMMENT 'признак нефти по коллектору',
    
    FOREIGN KEY (gis_id) REFERENCES well(id)
    ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS pary;
CREATE TABLE pary (
	para1_well_id BIGINT UNSIGNED NOT NULL,
    para2_well_id BIGINT UNSIGNED NOT NULL,
    `status` ENUM('влияют', 'не влияют'),
    -- `status` TINYINT UNSIGNED, -- в этом случае в коде хранили бы цифирный enum (0, 1, 2, 3...)
	requested_at DATETIME DEFAULT NOW(),
	updated_at DATETIME on update now(),
	
    PRIMARY KEY (para1_well_id, para2_well_id),
    FOREIGN KEY (para1_well_id) REFERENCES well(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (para2_well_id) REFERENCES well(id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS plast;
CREATE TABLE plast(
	id SERIAL PRIMARY KEY,
	name ENUM('АВ1', 'АВ2', 'АВ3','БВ6','БВ8','БВ9','Ач1-4','ЮВ1','ЮВ2'),
	admin_well_id BIGINT UNSIGNED,

	INDEX plast_name_idx(name),
	FOREIGN KEY (admin_well_id) REFERENCES well(id) ON UPDATE CASCADE ON DELETE SET NULL
);

DROP TABLE IF EXISTS wells_plasts;
CREATE TABLE wells_plasts(
	well_id BIGINT UNSIGNED NOT NULL,
	plast_id BIGINT UNSIGNED NOT NULL,
  
	PRIMARY KEY (well_id, plast_id), -- чтобы не было 2 записей о пользователе и сообществе
    FOREIGN KEY (well_id) REFERENCES well(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (plast_id) REFERENCES plast(id) ON UPDATE CASCADE ON DELETE CASCADE
);