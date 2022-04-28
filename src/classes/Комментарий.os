
#Область ОписаниеПеременных

Перем id; // Идентификатор.
Перем self; // Ссылка в API.
Перем author; // Автор.
Перем body; // Тело комментария.
Перем updateAuthor; // Автор изменения.
Перем created; // Создан.
Перем updated; // Изменен.
Перем Подключение; // Подключение к Jira, из которого получен комментарий.

#КонецОбласти

#Область ПрограммныйИнтерфейс

// Идентификатор.
//
//  Возвращаемое значение:
//   Строка - идентификатор.
//
Функция Идентификатор() Экспорт
	Возврат id;
КонецФункции

// Ссылка (self) на данные в API.
//
//  Возвращаемое значение:
//   Строка - ссылка в API.
//
Функция Ссылка() Экспорт
	Возврат self;
КонецФункции

// Автор комментария.
//
//  Возвращаемое значение:
//   Соответствие - данные о пользователе-авторе комментария.
//
Функция Автор() Экспорт
	Возврат author;
КонецФункции

// Тело комментария.
//
//  Возвращаемое значение:
//   Строка - Тело комментария.
//
Функция Тело() Экспорт
	Возврат body;
КонецФункции

// Автор изменения комментария.
//
//  Возвращаемое значение:
//   Соответствие - данные о пользователе-авторе изменения комментария.
//
Функция АвторИзменения() Экспорт
	Возврат updateAuthor;
КонецФункции

// Дата и время создания комментария.
//
//  Возвращаемое значение:
//   Дата - дата и время создания комментария.
//
Функция Создан() Экспорт
	Возврат created;
КонецФункции

// Дата и время изменения комментария
//
//  Возвращаемое значение:
//   Дата - дата и время изменения комментария.
//
Функция Изменен() Экспорт
	Возврат updated;
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ПриСозданииОбъекта(пПодключение, ДанныеЗаполнения)

	Подключение = пПодключение;
	УстановитьДанные(ДанныеЗаполнения);
	
КонецПроцедуры

Функция УстановитьДанные(ДанныеЗадачи)
	
	id = ДанныеЗадачи["id"];
	self = ДанныеЗадачи["self"];
	author = ДанныеЗадачи["author"];
	body = ДанныеЗадачи["body"];
	updateAuthor = ДанныеЗадачи["updateAuthor"];
	created = ДанныеЗадачи["created"];
	updated = ДанныеЗадачи["updated"];
	Возврат ЭтотОбъект;

КонецФункции

#КонецОбласти
