#Использовать gitrunner
#Использовать logos
#Использовать gitsync
#Использовать fs
#Использовать json

Перем Ф; // Главная форма
Перем ПутьКХранилищуПоле, ПользовательПоле, ПарольПоле, ПутьКРепозиторию; 
Перем ЛогПоле, УдаленныйРепозиторийПоле, ВеткаПоле;

Процедура ИнициализацияФормы()
    ФормаДляОС = Новый ФормыДляОдноСкрипта();
    Ф = ФормаДляОС.Форма();
    Ф.Текст = "Экспорт конфигурации 1С из хранилища в удаленный репозиторий";
    Ф.Границы = ФормаДляОС.Прямоугольник(100, 100, 600, 550);
    
    // Хранилище 1С
    ЛблХранилище = Ф.ЭлементыУправления.Добавить(ФормаДляОС.Надпись());
    ЛблХранилище.Текст = "Путь к хранилищу:";
    ЛблХранилище.Границы = ФормаДляОС.Прямоугольник(10, 10, 150, 20);
    
    ПутьКХранилищуПоле = Ф.ЭлементыУправления.Добавить(ФормаДляОС.ПолеВвода());
    ПутьКХранилищуПоле.Границы = ФормаДляОС.Прямоугольник(160, 10, 400, 20);
    ПутьКХранилищуПоле.Имя = "StoragePath";
    
    // Пользователь
    ЛблПользователь = Ф.ЭлементыУправления.Добавить(ФормаДляОС.Надпись());
    ЛблПользователь.Текст = "Пользователь:";
    ЛблПользователь.Границы = ФормаДляОС.Прямоугольник(10, 40, 150, 20);
    
    ПользовательПоле = Ф.ЭлементыУправления.Добавить(ФормаДляОС.ПолеВвода());
    ПользовательПоле.Границы = ФормаДляОС.Прямоугольник(160, 40, 200, 20);
    ПользовательПоле.Имя = "StorageUser";
    
    // Пароль
    ЛблПароль = Ф.ЭлементыУправления.Добавить(ФормаДляОС.Надпись());
    ЛблПароль.Текст = "Пароль:";
    ЛблПароль.Границы = ФормаДляОС.Прямоугольник(10, 70, 150, 20);
    
    ПарольПоле = Ф.ЭлементыУправления.Добавить(ФормаДляОС.ПолеВвода());
    ПарольПоле.Границы = ФормаДляОС.Прямоугольник(160, 70, 200, 20);
    ПарольПоле.Имя = "StoragePwd";
    
    // Git
    ЛблWorkDir = Ф.ЭлементыУправления.Добавить(ФормаДляОС.Надпись());
    ЛблWorkDir.Текст = "Локальный репозиторий:";
    ЛблWorkDir.Границы = ФормаДляОС.Прямоугольник(10, 100, 150, 20);
    
    ПутьКРепозиторию = Ф.ЭлементыУправления.Добавить(ФормаДляОС.ПолеВвода());
    ПутьКРепозиторию.Границы = ФормаДляОС.Прямоугольник(160, 100, 400, 20);
    ПутьКРепозиторию.Имя = "WorkDir";
    
    // Удаленный репозиторий
    ЛблRemote = Ф.ЭлементыУправления.Добавить(ФормаДляОС.Надпись());
    ЛблRemote.Текст = "Удаленный репозиторий:";
    ЛблRemote.Границы = ФормаДляОС.Прямоугольник(10, 130, 150, 20);
    
    УдаленныйРепозиторийПоле = Ф.ЭлементыУправления.Добавить(ФормаДляОС.ПолеВвода());
    УдаленныйРепозиторийПоле.Границы = ФормаДляОС.Прямоугольник(160, 130, 200, 20);
    УдаленныйРепозиторийПоле.Имя = "GitRemote";
    УдаленныйРепозиторийПоле.Текст = "origin"; // Значение по умолчанию
    
    // Ветка
    ЛблBranch = Ф.ЭлементыУправления.Добавить(ФормаДляОС.Надпись());
    ЛблBranch.Текст = "Ветка:";
    ЛблBranch.Границы = ФормаДляОС.Прямоугольник(10, 160, 150, 20);
    
    ВеткаПоле = Ф.ЭлементыУправления.Добавить(ФормаДляОС.ПолеВвода());
    ВеткаПоле.Границы = ФормаДляОС.Прямоугольник(160, 160, 200, 20);
    ВеткаПоле.Имя = "Branch";
    ВеткаПоле.Текст = "master"; // Значение по умолчанию
    
    // Кнопки
    КнопкаСохранить = Ф.ЭлементыУправления.Добавить(ФормаДляОС.Кнопка());
    КнопкаСохранить.Текст = "Сохранить";
    КнопкаСохранить.Границы = ФормаДляОС.Прямоугольник(10, 190, 120, 30);
    КнопкаСохранить.Нажатие = ФормаДляОС.Действие(ЭтотОбъект, "СохранитьНастройки");
    
    КнопкаВыгрузить = Ф.ЭлементыУправления.Добавить(ФормаДляОС.Кнопка());
    КнопкаВыгрузить.Текст = "Выгрузить";
    КнопкаВыгрузить.Границы = ФормаДляОС.Прямоугольник(140, 190, 120, 30);
    КнопкаВыгрузить.Нажатие = ФормаДляОС.Действие(ЭтотОбъект, "ЗапуститьВыгрузку");
    
    // Лог
    ЛблЛог = Ф.ЭлементыУправления.Добавить(ФормаДляОС.Надпись());
    ЛблЛог.Текст = "Лог выполнения:";
    ЛблЛог.Границы = ФормаДляОС.Прямоугольник(10, 230, 150, 20);
    
    ЛогПоле = Ф.ЭлементыУправления.Добавить(ФормаДляОС.ПолеВвода());
    ЛогПоле.Границы = ФормаДляОС.Прямоугольник(10, 250, 550, 250);
    ЛогПоле.МногострочныйРежим = Истина;
    ЛогПоле.Имя = "Log";
    ЛогПоле.ТолькоЧтение = Истина;
    ЛогПоле.Перенос = Истина;
    
    ЗагрузитьНастройки();
КонецПроцедуры

Процедура СохранитьНастройки() Экспорт
    Настройки = Новый Структура;
    Настройки.Вставить("StoragePath", ПутьКХранилищуПоле.Текст);
    Настройки.Вставить("StorageUser", ПользовательПоле.Текст);
    Настройки.Вставить("StoragePwd", ПарольПоле.Текст);
    Настройки.Вставить("WorkDir", ПутьКРепозиторию.Текст);
    Настройки.Вставить("GitRemote", УдаленныйРепозиторийПоле.Текст);
    Настройки.Вставить("Branch", ВеткаПоле.Текст);

    _преобразовательJSON = Новый ПарсерJSON();
    РезультатЗаписи = _преобразовательJSON.ЗаписатьJSON(Настройки);
    Запись = Новый ЗаписьТекста("settings.json", "UTF-8");
    Запись.ЗаписатьСтроку(РезультатЗаписи);
    Запись.Закрыть();
    
    ОбновитьЛог("Настройки сохранены!");
КонецПроцедуры

Процедура ЗагрузитьНастройки()
    Если ФС.ФайлСуществует("settings.json") Тогда
        Настройки = Новый ЧтениеJSON();
        Настройки.ОткрытьФайл("settings.json");

        ИмяТекущегоПоля = "";
        Пока Настройки.Прочитать() Цикл
            Если Настройки.ТипТекущегоЗначения = ТипЗначенияJSON.Строка Тогда
                Если НЕ ПустаяСтрока(ИмяТекущегоПоля) Тогда
                    Если СтрСравнить(ИмяТекущегоПоля, "StoragePath") = 0 Тогда
                        ПутьКХранилищуПоле.Текст = Настройки.ТекущееЗначение;   
                    ИначеЕсли СтрСравнить(ИмяТекущегоПоля, "StorageUser") = 0 Тогда
                        ПользовательПоле.Текст = Настройки.ТекущееЗначение;
                    ИначеЕсли СтрСравнить(ИмяТекущегоПоля, "StoragePwd") = 0 Тогда
                        ПарольПоле.Текст = Настройки.ТекущееЗначение;
                    ИначеЕсли СтрСравнить(ИмяТекущегоПоля, "WorkDir") = 0 Тогда
                        ПутьКРепозиторию.Текст = Настройки.ТекущееЗначение;
                    ИначеЕсли СтрСравнить(ИмяТекущегоПоля, "GitRemote") = 0 Тогда
                        УдаленныйРепозиторийПоле.Текст = Настройки.ТекущееЗначение;
                    ИначеЕсли СтрСравнить(ИмяТекущегоПоля, "Branch") = 0 Тогда
                        ВеткаПоле.Текст = Настройки.ТекущееЗначение;
                    КонецЕсли;
                КонецЕсли;
            КонецЕсли;

            Если Настройки.ТипТекущегоЗначения = ТипЗначенияJSON.ИмяСвойства Тогда
                ИмяТекущегоПоля = Настройки.ТекущееЗначение;
            КонецЕсли;
        КонецЦикла;
    КонецЕсли;
КонецПроцедуры

Процедура ЗапуститьВыгрузку() Экспорт
    Попытка
        ОбновитьЛог("Начало выгрузки...");
        // Получаем параметры из формы
        StoragePath = ПутьКХранилищуПоле.Текст;
        StorageUser = ПользовательПоле.Текст;
        StoragePwd  = ПарольПоле.Текст;
        WorkDir    = ПутьКРепозиторию.Текст;  
        GitRemote = УдаленныйРепозиторийПоле.Текст;
        Branch    = ВеткаПоле.Текст;

        // Основная логика выгрузки
        Cmd = СтрШаблон(
            "gitsync sync --storage-user %1 --storage-pwd %2 %3 %4",
            StorageUser, StoragePwd, StoragePath, WorkDir);
        ВыполнитьКоманду(Cmd, WorkDir);
        
        Репозиторий = Новый ГитРепозиторий();
        Репозиторий.УстановитьРабочийКаталог(WorkDir);
        Репозиторий.ДобавитьФайлВИндекс(".");
        
        Попытка
            Репозиторий.Закоммитить("Auto export from storage", Истина);
            ОбновитьЛог("✓ Коммит создан");
        Исключение
            ОбновитьЛог("Нет изменений для коммита");
        КонецПопытки;
        
        Репозиторий.Отправить(GitRemote, Branch);
        ОбновитьЛог("✓ Выгрузка в ветку " + Branch + " завершена успешно!");
        
    Исключение
        ОбновитьЛог("Ошибка: " + ОписаниеОшибки());
    КонецПопытки;
КонецПроцедуры

Процедура ВыполнитьКоманду(Команда, Каталог)
    ОбновитьЛог("► " + Команда);
    Проц = СоздатьПроцесс("cmd /c " + Команда, Каталог, Истина, Истина);
    Проц.Запустить();
    Проц.ОжидатьЗавершения();
    Если Проц.Завершен И Проц.КодВозврата > 1 Тогда
        ВызватьИсключение "Код ошибки: " + Проц.КодЗавершения;
    КонецЕсли;
КонецПроцедуры

Процедура ОбновитьЛог(Текст)
    ЛогПоле.Текст = ЛогПоле.Текст + "
    | " + Текст;
КонецПроцедуры

// Запуск приложения
ПодключитьВнешнююКомпоненту("G:/OneScript/lib/oscriptforms/OneScriptForms.dll");
ФормаКласс = Новый ФормыДляОдноСкрипта();
ИнициализацияФормы();
Ф.Отображать = Истина;
Ф.Показать();
Ф.Активизировать();
ФормаКласс.ЗапуститьОбработкуСобытий();