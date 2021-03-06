
#Область ОписаниеПеременных

Перем id; // Идентификатор спринта.
Перем self; // Ссылка на спринт в API.
Перем name; // Имя спринта.
Перем state; // Состояние спринта.
Перем startDate; // Состояние спринта.
Перем endDate; // Состояние спринта.
Перем activatedDate; // Состояние спринта.
Перем originBoardId; // Состояние спринта.
Перем goal; // Состояние спринта.
Перем Подключение; // Подключение к Jira, из которого получен спринт.

#КонецОбласти

#Область ПрограммныйИнтерфейс

// Идентификатор (id) спринта.
//
//  Возвращаемое значение:
//   Число - идентификатор спринта.
//
Функция Идентификатор() Экспорт
	Возврат id;
КонецФункции

// Имя спринта.
//
//  Возвращаемое значение:
//   Строка - имя спринта.
//
Функция Имя() Экспорт
	Возврат name;
КонецФункции

// Ссылка (self) на данные спринта в API.
//
//  Возвращаемое значение:
//   Строка - ссылка на спринт в API.
//
Функция Ссылка() Экспорт
	Возврат self;
КонецФункции

// Состояние спринта.
//
//  Возвращаемое значение:
//   Строка - состояние спринта.
//
Функция Состояние() Экспорт
	Возврат state;
КонецФункции

// Дата начала спринта.
//
//  Возвращаемое значение:
//   Дата - дата начала спринта.
//
Функция ДатаНачала() Экспорт
	Возврат startDate;
КонецФункции

// Дата окончания спринта.
//
//  Возвращаемое значение:
//   Дата - дата окончания спринта.
//
Функция ДатаОкончания() Экспорт
	Возврат endDate;
КонецФункции

// Дата запуска спринта.
//
//  Возвращаемое значение:
//   Дата - дата запуска спринта.
//
Функция ДатаЗапуска() Экспорт
	Возврат activatedDate;
КонецФункции

// Идентификатор доски происхождения спринта.
//
//  Возвращаемое значение:
//   Число - идентификатор доски происхождения спринта.
//
Функция ИдентификаторДоскиПроисхождения() Экспорт
	Возврат originBoardId;
КонецФункции

// Цель спринта.
//
//  Возвращаемое значение:
//   Строка - цель спринта.
//
Функция Цель() Экспорт
	Возврат goal;
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ПриСозданииОбъекта(пПодключение, ДанныеЗаполнения)

	Подключение = пПодключение;
	УстановитьДанные(ДанныеЗаполнения);
	
КонецПроцедуры

Функция УстановитьДанные(ДанныеЗаполнения)
	
	id = ДанныеЗаполнения["id"];
	self = ДанныеЗаполнения["self"];
	name = ДанныеЗаполнения["name"];
	state = ДанныеЗаполнения["state"];
	startDate = ДанныеЗаполнения["startDate"];
	endDate = ДанныеЗаполнения["endDate"];
	activatedDate = ДанныеЗаполнения["activatedDate"];
	originBoardId = ДанныеЗаполнения["originBoardId"];
	goal = ДанныеЗаполнения["goal"];
	Возврат ЭтотОбъект;

КонецФункции

#КонецОбласти
