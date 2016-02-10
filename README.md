# rpgmaker-vx-ace-i18n
Localization for rpg maker vx ace
Данный скрипт предназначен для локализации игр построенных на основе RPG Maker VX ACE. Вместо тысячи слов описание просто посмотрите видео, что умеет делать этот скрипт - https://youtu.be/HvPquHih0KU

###Это не ИИ!
Прежде чем приступить к описанию стоит уяснить, что этот скрипт НЕ переводит тексты самостоятельно (что, я надеюсь, очевидно для большинства мейкеристов). В любом случае вам придется самому перевести все тексты и слова и добавить переводы в словари.

###Основные понятия
- Текущая локаль - язык игры, по умолчанию русский. Изменяется через новый пункт главного меню. 
- Словарь - совокупность всех слов, предложений и текстов, использующихся в игре. Под каждую локаль нужно составлять отдельный.
- Ключ - строковый ключ однозначно указывающий на какой либо перевод в словаре. 

###Принцип действия
В процессе создания игры, в любом месте где вы хотели бы видеть текст, который нужно перевести при смене локали (показать текст в эвенте, название предмета в базе данных, строки в скриптах и т.п.), вы вставляете ключ вместо текста. Во время исполнения кода такого участка скрипт по ключу находит перевод в словаре ТЕКУЩЕЙ локали и подставляет его вместо ключа. Общепринятой практикой в том же Web программировании является полное отсутствие текста во всем проекте и миграция его в словари.

###Подключение
- Как гем при помощи https://github.com/godsent/rpg-maker-side-script-loader
- ИЛИ вставте batch.rb как обычный скрипт

###Словари
Словарь представляет собой Ruby Hash ( К сожалению из ACE безжалостно удалены многие стандартные руби классы, в том числе и YAML)  произвольной вложенности со строковыми или символьными ключами.
По умолчанию словарей два - для английского https://github.com/godsent/rpgmaker-vx-ace-i18n/blob/master/i18n/en.rb и русского https://github.com/godsent/rpgmaker-vx-ace-i18n/blob/master/i18n/ru.rb языков. В них добавлены переводы для базового функционала - все то, что можно настроить через стандартные средства мейкера (элементы, типы оружия, команды и т.п.).Эти переводы сгруппированы под общим ключем basic. Чтобы расширить стандартные словари просто добавляйте в них новые переводы:
```
I18n.add :en, 'English', {
  basic: {
    #стандартные переводы
  },
  hellow_word: 'Hello world' #новый перевод
}
```
В качестве значений для словаря годятся строки и массивы строк. Последние довольно удобны для создания последовательных диалогов.
```
I18n.add :en, 'English', {
  basic: {
    #стандартные переводы
  },
  dialogs: {
    prisoner: [
      'Hello here',
      'Hello, what is your name'
    ]
  }
}
```
Если вы будете использовать этот скрипт как гем, то все файлы словарей, где есть не ASCII символы следует начинать с магического комментария:
```
#encoding=utf-8
```
Отдельно стоит упомянуть про ширину текста. Мейкер по умолчанию не разбивает текст по ширине окошка сообщения. Поэтому или сами вставляйте перенос строки в нужные вам места текста, или используйте этот замечательный скрипт - http://www.rpgmakervxace.net/topic/6964-word-wrapping-message-boxes/


Чтобы добавить новую локаль и, соответственно, новый словарь следует использовать метод I18n.add.
```
I18n.add :en, 'English', {
  ...
}
#:en - локаль, должна быть уникальной для каждого словаря
#'English' - имя локали, отображается в меню выбора языка
#Третий аргумент - собственно сам словарь
```
В новом словаре обязательно должны быть все переводы из раздела basic, проще всего скопировать существующий словарь, добавить его под новой локалью и именем и заменить все значения на новые.

###Ключи
Ключи представляют собой строку, разбитую точками на подстроки. Ключ указывает на значение в словаре, к примеру вот так:
```
I18n.add :en, 'English', {
  ...
  first: {
    second: {
      third: 'Here you are!'
    }
  }
}
#Ключ
t 'first.second.third'
```
Чтобы достать значение из массива достаточно последним элементом ключа указать его индекс.
```
I18n.add :en, 'English', {
  ...
  first: {
    second: [
      'Here you are!'
    ]
  }
}
#Ключ
t 'first.second.0'
```
Обратите внимание на метод t который указывает на метод I18n.t - именно он по ключу ищет значение в словаре и заменяет ключ на перевод. Для использования переводов для имен или описаний в базе данных, или для текстовых команд эвентов смело добавляйте вместо текста ту же конструкцию.
```
#В поле имени навыка
#символ 't', пробел, ключ к переводу
t 'path.to.your.translation'
#или без ковычек
t path.to.your.translation
```
На данный момент работают:
- Замена имен в БД
- Замена описаний в БД
- Show text в эвентах
- Show messages в вентах

Если найдете место, где перевод не работает - пишите, или создавайте баг.

