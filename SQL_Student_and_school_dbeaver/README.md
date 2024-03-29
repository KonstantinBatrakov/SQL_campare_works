# SQL_Student_and_school_dbeaver
Это учебный проект, созданный мною для практики SQL.
Проект "Student_and_school" представляет собой базу данных, созданную в рамках учебного проекта для практики SQL. В базе содержится информация о студентах, учителях, предметах, классах и др.

Таблицы:
- student: Содержит данные о студентах, включая их имена, даты рождения и другие персональные данные.
- teacher: Хранит информацию об учителях, такую как их имена, специализация и контактная информация.
- subject: Содержит информацию о предметах, включая названия и описания.
- class: Эта таблица содержит данные о классах, их уровнях, школьных годах и других аспектах организации учебного процесса.
- student_class: Связывает студентов с их классами, содержа информацию о том, кто учится в каком классе.

Связи между таблицами:
- Таблица student_class связана с таблицами student и class. Она хранит информацию о студентах, входящих в конкретные классы.
- Таблица class может быть связана с таблицей teacher, если в классе есть преподаватель.

Типовые запросы:
Получение списка студентов.
Получение списка учителей.
Фильтрация классов по уровню.
Поиск студентов по имени.
Подсчет предметов, предлагаемых в школе.
Поиск учителей по специализации.
Поиск доступных классов для конкретного уровня обучения.
Подсчет числа студентов в каждом классе.
Поиск студентов с самой длинной фамилией.
Подсчет числа студентов в каждом классе по полу.
Поиск студентов с определенным днем рождения.
Определение классов для конкретного студента.
Получение контактной информации учителя для определенного класса.
Подсчет числа классов, в которых преподает определенный учитель.
Поиск студентов, изучающих определенный предмет.
Подсчет среднего возраста студентов в каждом классе.
Подсчет числа студентов в каждом классе за определенный учебный год.

Используемые функции:
- Выборка данных: SELECT, FROM, WHERE, JOIN, LEFT JOIN, GROUP BY, DISTINCT, AS.
- Агрегатные функции: COUNT(), AVG().
- Фильтрация данных: LIKE, BETWEEN.
- Сортировка данных: ORDER BY.
