Функция ЗначениеВJSONСтроку(Значение) Экспорт // BSLLS:LatinAndCyrillicSymbolInWord-off

	ЗаписьJSON = Новый ЗаписьJSON();
	ЗаписьJSON.УстановитьСтроку();
	ЗаписатьJSON(ЗаписьJSON, Значение);
	Возврат ЗаписьJSON.Закрыть();
	
КонецФункции

Функция JSONСтрокаВЗначение(Значение) Экспорт

	ЧтениеJSON = Новый ЧтениеJSON();
	ЧтениеJSON.УстановитьСтроку(Значение);
	Возврат ПрочитатьJSON(ЧтениеJSON);

КонецФункции

Процедура ВставитьЗначениеВСтруктуруЕслиОпределено(Структура, Значение, Ключ) Экспорт

	Если Значение <> Неопределено Тогда
		Структура.Вставить(Ключ, Значение);
	КонецЕсли;

КонецПроцедуры