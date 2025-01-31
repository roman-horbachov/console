
# Task Manager Console Application

Це консольний застосунок для управління задачами з можливістю додавання, редагування, видалення, позначення виконаних задач та фільтрації за статусом і дедлайнами. Дані зберігаються у JSON-файлі.

## Вимоги

- Ruby версії 2.5 або новішої
- Гем `minitest` для запуску тестів

## Встановлення


1. Збережіть наведені вище коди у файли:
   - `task.rb`
   - `task_manager.rb`
   - `main.rb`
   - `test_task_manager.rb`

2. Встановіть гем `minitest`, якщо він не встановлений:
   ```bash
   gem install minitest
   ```

## Запуск застосунку

Щоб запустити консольний застосунок, виконайте команду:

```bash
ruby main.rb
```

### Функціональні можливості застосунку:

- Додавання нової задачі з описом та дедлайном.
- Видалення задачі за її ID.
- Редагування опису та дедлайну існуючої задачі.
- Позначення задачі як виконаної.
- Показ усіх задач із зазначенням їхнього статусу виконання.
- Фільтрація задач за статусом виконання, датою до та після певної дати.

## Запуск тестів

Щоб запустити тести для перевірки основних функцій додавання, видалення, редагування, позначення виконаними та фільтрації задач, виконайте команду:

```bash
ruby test_task_manager.rb
```

## Опис файлів

- `task.rb`: Містить клас `Task`, який представляє окрему задачу з атрибутами:
  - `id` — ідентифікатор задачі
  - `description` — опис задачі
  - `deadline` — дедлайн задачі
  - `completed` — статус виконання (за замовчуванням `false`)

- `task_manager.rb`: Містить клас `TaskManager`, який відповідає за управління списком задач. Основні методи:
  - `add_task` — додає нову задачу
  - `delete_task` — видаляє задачу за ID
  - `edit_task` — редагує опис та дедлайн задачі
  - `mark_completed` — позначає задачу як виконану
  - `filter_tasks` — фільтрує задачі за статусом, датою до та після певної дати

- `main.rb`: Надає консольний інтерфейс для взаємодії з користувачем.

- `test_task_manager.rb`: Містить тести для перевірки основних функцій класу `TaskManager`.

## Приклади використання

### Додавання задачі
При запуску застосунку виберіть опцію "1. Додати задачу", введіть опис та дедлайн у форматі `YYYY-MM-DD`.

### Видалення задачі
Виберіть опцію "2. Видалити задачу" та введіть ID задачі, яку потрібно видалити.

### Редагування задачі
Виберіть опцію "3. Редагувати задачу", введіть ID задачі, новий опис та дедлайн.

### Позначення задачі як виконаної
Виберіть опцію "4. Позначити задачу як виконану" та введіть ID задачі.

### Фільтрація задач
Виберіть опцію "6. Фільтрувати задачі" та задайте параметри фільтрації (статус виконання, дата до, дата після).

## Автор

Горбачов Роман КС31