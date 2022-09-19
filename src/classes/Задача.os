#Использовать "../internal"
#Область ОписаниеПеременных

Перем id; // Идентификатор задачи.
Перем key; // Ключ задачи.
Перем self; // Ссылка на задачу в API.
Перем fields; // Поля задачи.

Перем Подключение; // Подключение к Jira, из которого получена задача.

#КонецОбласти

#Область ПрограммныйИнтерфейс

// Идентификатор (id) задачи.
//
//  Возвращаемое значение:
//   Строка - идентификатор задачи.
//
Функция Идентификатор() Экспорт
	Возврат id;
КонецФункции

// Ключ (key) задачи.
//
//  Возвращаемое значение:
//   Строка - ключ задачи.
//
Функция Ключ() Экспорт
	Возврат key;
КонецФункции

// Ссылка (self) на данные задачи в API.
//
//  Возвращаемое значение:
//   Строка - ссылка на задачу в API.
//
Функция Ссылка() Экспорт
	Возврат self;
КонецФункции

// Поля задачи.
//
//  Возвращаемое значение:
//   Соответствие - поля задачи.
//
Функция Поля() Экспорт
	Возврат fields;
КонецФункции

Функция ПолучитьКомментарии(НачинаяС = Неопределено, МаксКоличествоРезультатов = Неопределено,
	УпорядочитьПо = Неопределено, РасширитьПо = Неопределено) Экспорт

	ПараметрыЗапроса = Новый Структура;
	СлужебныеМетоды.ВставитьЗначениеВСтруктуруЕслиОпределено(ПараметрыЗапроса, НачинаяС, "startAt");
	СлужебныеМетоды.ВставитьЗначениеВСтруктуруЕслиОпределено(ПараметрыЗапроса, МаксКоличествоРезультатов, "maxResults");
	СлужебныеМетоды.ВставитьЗначениеВСтруктуруЕслиОпределено(ПараметрыЗапроса, УпорядочитьПо, "orderBy");
	СлужебныеМетоды.ВставитьЗначениеВСтруктуруЕслиОпределено(ПараметрыЗапроса, РасширитьПо, "expand");

	ДополнительныеПараметры = Новый Структура("ПараметрыЗапроса", ПараметрыЗапроса);

	АдресРесурса = СтрШаблон("/rest/api/latest/issue/%1/comment", Ключ());

	РезультатЗапроса = Подключение.РезультатЗапроса(АдресРесурса, "GET", ДополнительныеПараметры);

	Комментарии = РезультатЗапроса.JSON();

	Результат = Новый Массив;
	Для каждого ДанныеКомментария Из Комментарии["comments"] Цикл
		Комментарий = Новый Комментарий(Подключение, ДанныеКомментария);
		Результат.Добавить(Комментарий);
	КонецЦикла;
	Возврат Результат;

КонецФункции

Функция ПолучитьКомментарий(ИдентификаторКомментария, РасширитьПо = Неопределено) Экспорт

	ПараметрыЗапроса = Новый Структура;
	СлужебныеМетоды.ВставитьЗначениеВСтруктуруЕслиОпределено(ПараметрыЗапроса, РасширитьПо, "expand");

	ДополнительныеПараметры = Новый Структура("ПараметрыЗапроса", ПараметрыЗапроса);

	АдресРесурса = СтрШаблон("/rest/api/latest/issue/%1/comment/%2", Ключ(), ИдентификаторКомментария);

	РезультатЗапроса = Подключение.РезультатЗапроса(АдресРесурса, "GET", ДополнительныеПараметры);

	ДанныеКомментария = РезультатЗапроса.JSON();

	Возврат Новый Комментарий(Подключение, ДанныеКомментария);

КонецФункции

Функция ДобавитьКомментарий(ДанныеКомментария) Экспорт

	Данные = СлужебныеМетоды.ЗначениеВJSONСтроку(ДанныеКомментария);

	ДополнительныеПараметры = Новый Структура("Данные", Данные);

	АдресРесурса = СтрШаблон("/rest/api/latest/issue/%1/comment", Ключ());

	РезультатЗапроса = Подключение.РезультатЗапроса(АдресРесурса, "POST", ДополнительныеПараметры);

	Если РезультатЗапроса.КодСостояния = 201 Тогда
		Возврат ПолучитьКомментарий(РезультатЗапроса.JSON()["id"]);
	ИначеЕсли РезультатЗапроса.КодСостояния = 400 Тогда
		ТекстОтвета = РезультатЗапроса.Текст();
		ТекстИсключения = СтрШаблон("Не удалось создать комментарий по причине:
			|%1", ТекстОтвета);
		ВызватьИсключение ТекстИсключения;
	Иначе
		ТекстИсключения = "Не удалось создать комментарий";
		ВызватьИсключение ТекстИсключения;
	КонецЕсли;

КонецФункции

Процедура СменитьСтатус(ДанныеСменыСтатуса) Экспорт

	Данные = СлужебныеМетоды.ЗначениеВJSONСтроку(ДанныеСменыСтатуса);

	ДополнительныеПараметры = Новый Структура("Данные", Данные);

	АдресРесурса = СтрШаблон("/rest/api/latest/issue/%1/transitions", Ключ());

	РезультатЗапроса = Подключение.РезультатЗапроса(АдресРесурса, "POST", ДополнительныеПараметры);

	Если РезультатЗапроса.КодСостояния <> 204 Тогда
		ТекстОтвета = РезультатЗапроса.Текст();
		ТекстИсключения = СтрШаблон("Не удалось сменить статус по причине:
			|%1", ТекстОтвета);
		ВызватьИсключение ТекстИсключения;
	КонецЕсли;

КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ПриСозданииОбъекта(пПодключение, ДанныеЗадачи)

	Подключение = пПодключение;
	УстановитьДанные(ДанныеЗадачи);
	
КонецПроцедуры

Функция УстановитьДанные(ДанныеЗадачи)
	
	key = ДанныеЗадачи["key"];
	id = ДанныеЗадачи["id"];
	self = ДанныеЗадачи["self"];
	fields = ДанныеЗадачи["fields"];
	Возврат ЭтотОбъект;

КонецФункции

#КонецОбласти
