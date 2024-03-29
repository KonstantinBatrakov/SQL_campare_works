# SQL_Payments_family_dbeaver

База данных "Payments_family" представляет собой систему учета расходов и членов семьи. 

Ее цель - отслеживать траты семьи на различные товары и услуги, а также хранить информацию о членах семьи.

Она состоит из нескольких таблиц:
- FamilyMembers: Содержит информацию о членах семьи, таких как их идентификатор, статус в семье, имя и дата рождения.
- goodTypes: Содержит типы товаров.
- Goods: Хранит информацию о товарах, их идентификатор, название и тип.
- payments: Содержит информацию о платежах, включая идентификатор платежа, дату, члена семьи, купленный товар, количество и цену за единицу товара.

Связи между таблицами:
- Таблица payments связана с таблицей FamilyMembers через поле family_member, представляющее идентификатор члена семьи.
- Таблица payments также связана с таблицей Goods через поле good, представляющее идентификатор товара.

Типы связей:
- Один ко многим: Таблица FamilyMembers имеет отношение один ко многим с таблицей payments, так как один член семьи может совершать несколько платежей.
- Один ко многим: Таблица Goods имеет отношение один ко многим с таблицей payments, так как один товар может быть куплен несколько раз.
- Многие ко многим: Отношение многие ко многим отсутствует в данной базе данных.

Были решены типовые задачи, которые позволяют анализировать данные авиаперевозок с различных точек зрения, от общего обзора данных до более специфических запросов.
- Получение списка членов семьи: Выводятся имена всех членов семьи, зарегистрированных в базе данных.
- Получение списка типов товаров: Выводятся названия всех типов товаров, представленных в базе данных.
- Фильтрация платежей по городу отправления: Выводятся все платежи, совершенные из определенного города.
- Поиск платежей по имени пассажира: Выводятся платежи, совершенные пассажиром с определенным именем.
- Подсчет платежей для определенного типа товара: Определяется количество платежей для определенного типа товара.
- Поиск членов семьи по типу товара: Выводятся члены семьи, совершавшие платежи за определенный тип товара.
- Поиск доступных товаров для конкретного члена семьи: Выводятся названия всех товаров, на которые были совершены платежи для конкретного члена семьи.
- Подсчет общей суммы затрат из определенного города: Определяется общая сумма затрат из указанного города.
- Поиск членов семьи для определенного города: Выводятся члены семьи, совершавшие платежи из указанного города.
- Подсчет платежей за определенный период времени: Определяется количество платежей, совершенных в указанный промежуток времени.
- Поиск членов семьи с самым длинным именем: Выводятся имена членов семьи с самой длинной записью в базе данных.
- Подсчет количества платежей на каждого члена семьи: Определяется количество платежей для каждого члена семьи, отсортированных по убыванию.
- Поиск платежей для товаров из одного города в другой: Выводится количество платежей для каждого товара из одного города в другой.
- Поиск членов семьи, совершавших платежи за определенный тип товара в указанный город: Выводятся имена членов семьи, совершавших платежи за определенный тип товара в указанный город.
- Подсчет общей суммы платежей для каждого товара: Определяется общая сумма платежей для каждого товара, отсортированная по убыванию.
  
Для решения этих задач были использованы различные функции SQL, такие как
- Выборка данных: SELECT, FROM, WHERE, JOIN, LEFT JOIN, GROUP BY, DISTINCT, AS
- Агрегатные функции: COUNT(), SUM(), MAX(), AVG(), MIN()
- Фильтрация данных: LIKE, HAVING, BETWEEN
- Сортировка данных: ORDER, BY, ASC, DESC
- Преобразование данных: DATE(), CHAR_LENGTH(), TIMESTAMPDIFF()
  
