# Laravel.nvim - Плагин для разработки на Laravel в Neovim

[https://github.com/adibhanna/laravel.nvim](https://github.com/adibhanna/laravel.n)

## Обзор

Laravel.nvim — это комплексный плагин для разработки на Laravel в Neovim, вдохновленный Laravel Idea для PhpStorm. Плагин предоставляет интеллектуальную навигацию, автодополнение и инструменты разработки, специально разработанные для проектов Laravel.

⚠️ **Важное замечание**: Плагин находится в активной разработке, возможны ошибки. Сообщайте о любых проблемах.

## ✨ Возможности

### 🧭 Умная навигация

**Переход к определению (gd)**: Навигация к ресурсам Laravel с интеллектуальным контекстом

- **Парсинг на Treesitter**: Использует treesitter Neovim для точного анализа AST-кода
- **Интеллектуальный фолбэк**: Плавно переходит на regex-паттерны, когда treesitter недоступен
- **Поддержка многострочных конструкций**: Обрабатывает сложные цепочки методов и многострочные определения
- **40+ паттернов функций Laravel**: Полная поддержка хелперов и фасадов Laravel

**Поддерживаемые цели навигации**:
- Маршруты: `route('dashboard')` → `routes/web.php`
- Представления: `view('users.index')` → `resources/views/users/index.blade.php`
- Inertia: `Inertia::render('Dashboard')` → `resources/js/Pages/Dashboard.tsx`
- Конфигурация: `config('app.name')` → `config/app.php`
- Переводы: `__('auth.failed')` → `lang/en/auth.php`
- Переменные окружения: `env('APP_NAME')` → `.env` файл
- Контроллеры: `UserController::class` → `app/Http/Controllers/UserController.php`
- Статические вызовы методов: `Route::get()`, `Inertia::render()`, `Config::get()`
- Цепочки методов: `->name()`, `->middleware()`, `->where()`
- Глобальные функции Laravel: `auth()`, `request()`, `session()` и др.

### 🔍 Интеллектуальное автодополнение

- Имена маршрутов: Автодополнение из определений маршрутов
- Имена представлений: Дополнение шаблонов Blade и компонентов Inertia
- Ключи конфигурации: Дополнение ключей конфигурации из config-файлов
- Ключи переводов: Дополнение ключей переводов из языковых файлов
- Переменные окружения: Дополнение из `.env` файлов
- Улучшенные дополнения IDE Helper (при установке):
  - Методы фасадов: `DB::table()`, `Cache::get()`, `Auth::user()`
  - Привязки контейнера: `app('service')`, `resolve('binding')`
  - Fluent методы миграций: `$table->string()`, `$table->nullable()`
- 30-секундное кэширование для оптимальной производительности

### 📁 Автоматическое создание файлов

- Запрос на создание отсутствующих представлений
- Умные шаблоны: Определяет ваш фронтенд-стек (React, Vue, Svelte) и создает соответствующие файлы
- Создание структуры каталогов: Автоматически создает необходимые структуры директорий

### 🎯 Инструменты для Laravel

- Интеграция Artisan: Запуск команд Artisan с автодополнением
- Интеграция Composer: Запуск команд Composer с интерактивным управлением пакетами
- Поддержка Laravel Sail: Полная интеграция с Docker средой разработки
- Визуализация маршрутов: Просмотр и навигация по маршрутам приложения
- Помощники миграций: Навигация и управление миграциями БД
- Навигация по моделям: Быстрый доступ к Eloquent моделям
- Диаграммы схемы: Визуализация структуры базы данных
- Архитектурные диаграммы: Просмотр структуры приложения

## Просмотрщик дампов Laravel

Просмотрщик дампов захватывает все вызовы `dump()` и `dd()` и отображает их в красивом всплывающем окне.

### Возможности
- **Автоматический захват**: Все вызовы `dump()` и `dd()` автоматически захватываются
- **Обновления в реальном времени**: Новые дампы мгновенно появляются в просмотрщике
- **Красивое форматирование**: Подсветка синтаксиса и правильные отступы
- **Отслеживание местоположения**: Видно, откуда произошел каждый дамп
- **Временные метки**: Знайте, когда был выполнен каждый дамп
- **Автопрокрутка**: Автоматическая прокрутка к последним дампам
- **Поиск**: Легко находите конкретные дампы

### Использование

1. Включите захват дампов:
```vim
:LaravelDumpsEnable
```

2. Откройте просмотрщик дампов:
```vim
:LaravelDumps
```
Или используйте хоткей: `<leader>Ld`

3. Используйте `dump()` в вашем коде Laravel:
```php
Route::get('/test', function () {
    dump('Hello from Laravel!');
    dump(['key' => 'value', 'array' => [1, 2, 3]]);
    dump(User::first());
    
    return view('welcome');
});
```

4. Просматривайте дампы в реальном времени во всплывающем окне

### Команды
- `:LaravelDumps` - Открыть просмотрщик дампов
- `:LaravelDumpsInstall` - Установить service provider (только настройка)
- `:LaravelDumpsEnable` - Установить service provider и включить захват дампов
- `:LaravelDumpsDisable` - Выключить захват дампов
- `:LaravelDumpsToggle` - Переключить захват дампов
- `:LaravelDumpsClear` - Очистить все захваченные дампы

### Хоткеи
Все хоткеи используют префикс `<leader>L` (где `<leader>` обычно `\` или `,`):

- `<leader>Ld` - Открыть просмотрщик дампов
- `<leader>LDi` - Установить dump service provider
- `<leader>LDe` - Установить и включить захват дампов
- `<leader>LDd` - Выключить захват дампов
- `<leader>LDt` - Переключить захват дампов
- `<leader>LDc` - Очистить дампы

### Управление окном просмотрщика дампов
Когда просмотрщик дампов открыт:
- `q` или `<Esc>` - Закрыть окно
- `c` - Очистить все дампы
- `s` - Переключить автопрокрутку
- `r` - Обновить содержимое

## Настройка

🛠️ **Требуется ручная настройка при первом использовании**

Чтобы начать работу с просмотрщиком дампов, вам нужно установить Laravel service provider:

**Вариант 1: Установить и включить за один шаг**
```vim
:LaravelDumpsEnable
```

**Вариант 2: Сначала установить, потом включить**
```vim
:LaravelDumpsInstall   " Просто создает service provider
:LaravelDumpsEnable    " Включить захват дампов когда готовы
```

Когда вы устанавливаете, плагин будет:
- 🚀 Создавать `app/Providers/NvimDumpServiceProvider.php`
- 🔧 Автоматически регистрировать service provider в вашем Laravel приложении:
  - Laravel 11+ (текущий): Добавляет в `bootstrap/app.php` используя `withProviders()`
  - Laravel 10 (legacy): Добавляет в `config/app.php` в массив `providers`
- ✅ Готов к использованию! Начинайте использовать вызовы `dump()`

### Решение проблем настройки
🔍 **Не видите дампы? Проверьте вашу конфигурацию Laravel:**

1. Проверьте существование service provider:
```bash
ls app/Providers/NvimDumpServiceProvider.php
```

2. Проверьте регистрацию в вашем Laravel приложении:

**Laravel 12/11 - Смотрите в bootstrap/app.php:**
```php
->withProviders([
    App\Providers\NvimDumpServiceProvider::class,  // ← Должно быть здесь
])
```

**Laravel 10 - Смотрите в config/app.php:**
```php
'providers' => [
    // ... другие провайдеры ...
    App\Providers\NvimDumpServiceProvider::class,  // ← Должно быть здесь
],
```

3. Очистите кэши Laravel:
```bash
php artisan config:cache
```

4. Протестируйте простым дампом:
```php
// Добавьте в routes/web.php
Route::get('/test-dumps', function () {
    dump('Hello from Laravel!');
    return 'Check your dump viewer!';
});
```

**Ручная регистрация (если авто-настройка не сработала):**
Если автоматическая настройка не работает, вы можете вручную зарегистрировать service provider:

- Laravel 12/11 (`bootstrap/app.php`)
- Laravel 10 (`config/app.php`)

💡 **Профессиональный совет**: Service provider работает только в локальном окружении, так что это не повлияет на продакшен!

## Как это работает

Просмотрщик дампов работает следующим образом:

1. Устанавливает Laravel Service Provider, который перехватывает вывод `dump()`
2. Логирует дампы в `storage/logs/nvim-dumps.log` с временными метками и местоположениями файлов
3. Отслеживает лог-файл в реальном времени используя job system Neovim
4. Отображает дампы в красивом всплывающем окне с подсветкой синтаксиса

Service provider автоматически интегрируется с компонентом VarDumper Laravel для захвата всего вывода дампов без влияния на нормальное поведение вашего приложения.

## 📦 Установка

### Используя lazy.nvim
```lua
{
    "adibhanna/laravel.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>la", ":Artisan<cr>", desc = "Laravel Artisan" },
        { "<leader>lc", ":Composer<cr>", desc = "Composer" },
        { "<leader>lr", ":LaravelRoute<cr>", desc = "Laravel Routes" },
        { "<leader>lm", ":LaravelMake<cr>", desc = "Laravel Make" },
    },
    config = function()
        require("laravel").setup()
    end,
}
```

### Используя packer.nvim
```lua
use {
    "adibhanna/laravel.nvim",
    requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("laravel").setup()
    end
}
```

## 📋 Требования

### Поддержка Treesitter (Рекомендуется)
Для оптимальной точности навигации этот плагин использует treesitter Neovim для интеллектуального парсинга PHP кода:

- **Treesitter PHP парсер**: Установите через `:TSInstall php` для лучшего опыта навигации
- **Автоматический фолбэк**: Плагин плавно переходит на regex-парсинг если treesitter недоступен
- **Улучшенная точность**: Treesitter предоставляет AST-парсинг для точного обнаружения вызовов функций
- **Поддержка многострочных конструкций**: Обрабатывает сложные паттерны Laravel через несколько строк

**Быстрая настройка:**
```vim
" Установите PHP treesitter парсер
:TSInstall php

" Проверьте установку
:TSInstallInfo php
```

**Примечание**: Хотя treesitter настоятельно рекомендуется для лучшего опыта, плагин будет работать без него используя regex-парсинг как фолбэк.

## ⚙️ Конфигурация

### Базовая настройка
```lua
require("laravel").setup({
    notifications = true, -- Включить/выключить уведомления Laravel.nvim (по умолчанию: true)
    debug = false,        -- Включить/выключить отладочные уведомления об ошибках (по умолчанию: false)
    keymaps = true,       -- Включить/выключить хоткеи Laravel.nvim (по умолчанию: true)
    sail = {
        enabled = true,           -- Включить/выключить интеграцию Laravel Sail (по умолчанию: true)
        auto_detect = true,       -- Авто-определение использования Sail в проекте (по умолчанию: true)
    },
})
```

### Опции конфигурации

| Опция | Тип | По умолчанию | Описание |
|-------|-----|--------------|----------|
| `notifications` | boolean | `true` | Включить/выключить уведомления обнаружения Laravel проекта |
| `debug` | boolean | `false` | Включить/выключить отладочные уведомления об ошибках для дополнений |
| `keymaps` | boolean | `true` | Включить/выключить хоткеи Laravel.nvim по умолчанию |
| `sail.enabled` | boolean | `true` | Включить/выключить интеграцию Laravel Sail |
| `sail.auto_detect` | boolean | `true` | Авто-определение использования Sail и обертывание команд |

### Примеры

**Отключить уведомления:**
```lua
require("laravel").setup({
    notifications = false, -- Нет уведомлений когда обнаружен Laravel проект
})
```

**Включить режим отладки (чтобы видеть ошибки дополнений):**
```lua
require("laravel").setup({
    debug = true, -- Показывать уведомления об ошибках дополнений для отладки
})
```

**Настроить интеграцию Laravel Sail:**
```lua
require("laravel").setup({
    sail = {
        enabled = true,           -- Включить интеграцию Sail (по умолчанию: true)
        auto_detect = true,       -- Авто-определение когда использовать Sail (по умолчанию: true)
    },
})
```

Когда Sail обнаружен в вашем проекте (наличие `docker-compose.yml` и `vendor/bin/sail`), все команды Artisan и Composer будут автоматически обернуты с `./vendor/bin/sail`. Например:

- `:Artisan migrate` становится `./vendor/bin/sail artisan migrate`
- `:Composer install` становится `./vendor/bin/sail composer install`

Все команды Laravel (включая Sail команды) работают глобально - вы можете запускать их из любого типа файла (JavaScript, CSS, Markdown и т.д.) внутри Laravel проекта, не только из PHP файлов.

**Включить интеграцию Laravel IDE Helper:**

Сначала установите пакет Laravel IDE Helper в вашем Laravel проекте:

```bash
# В корне вашего Laravel проекта
composer require --dev barryvdh/laravel-ide-helper
```

Затем сгенерируйте helper файлы:

```bash
# Сгенерируйте все IDE helper файлы
php artisan ide-helper:generate
php artisan ide-helper:models --write
php artisan ide-helper:meta
```

Или используйте команды Neovim после открытия вашего Laravel проекта:

```vim
" Установите Laravel IDE Helper (если еще не установлен)
:LaravelInstallIdeHelper

" Проверьте статус IDE Helper и опционально сгенерируйте файлы
:LaravelIdeHelperCheck

" Или напрямую сгенерируйте все IDE helper файлы
:LaravelIdeHelper all

" Удалите только сгенерированные файлы (оставьте пакет установленным)
:LaravelIdeHelperClean

" Чтобы полностью удалить IDE Helper (пакет + файлы)
:LaravelRemoveIdeHelper
```

Плагин автоматически обнаружит когда IDE Helper установлен и предоставит улучшенные дополнения!

**Примечание**: Плагин больше не показывает автоматические запросы при запуске. Используйте `:LaravelIdeHelperCheck` чтобы вручную проверить нужно ли генерировать файлы.

**Отключить хоткеи по умолчанию (чтобы создать кастомные):**
```lua
require("laravel").setup({
    keymaps = false, -- Отключить все хоткеи по умолчанию
})

-- Затем создайте свои кастомные хоткеи
vim.keymap.set('n', '<leader>a', ':Artisan<CR>')
vim.keymap.set('n', '<leader>c', ':Composer<CR>')
vim.keymap.set('n', '<leader>gc', function()
    require('laravel.navigate').goto_controller()
end)
```

### Интеграция с движком дополнений

**Для пользователей blink.nvim:**
```lua
{
    "saghen/blink.nvim",
    opts = {
        sources = {
            default = { "laravel", "lsp", "path", "snippets", "buffer" },
            providers = {
                laravel = {
                    name = "laravel",
                    module = "laravel.blink_source",
                },
            },
        },
    },
}
```

**Для пользователей nvim-cmp:**
```lua
require('cmp').setup({
    sources = cmp.config.sources({
        { name = 'laravel' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    })
})
```

## 🚀 Примеры использования

### Навигация с gd или :LaravelGoto

**Навигация по маршрутам**
```php
// В вашем контроллере
Route::get('/dashboard', function () {
    return view('dashboard'); // Нажмите 'gd' или выполните :LaravelGoto на 'dashboard'
});

// Нажмите 'gd' или выполните :LaravelGoto на имени маршрута для перехода к определению
return route('dashboard'); // → routes/web.php
```

**Навигация по представлениям**
```php
// Blade шаблоны
return view('users.index'); // → resources/views/users/index.blade.php
return view('auth.login'); // → resources/views/auth/login.blade.php

// Inertia компоненты
return Inertia::render('Dashboard'); // → resources/js/Pages/Dashboard.tsx
return Inertia::render('users/show'); // → resources/js/Pages/users/show.tsx
```

**Навигация по конфигурации**
```php
// Переход к config файлам
$name = config('app.name'); // → config/app.php (к ключу 'name')
$driver = config('database.default'); // → config/database.php
```

**Навигация по переводам**
```php
// Переход к языковым файлам
$message = __('auth.failed'); // → lang/en/auth.php
$welcome = trans('messages.welcome'); // → lang/en/messages.php
```

**Навигация по переменным окружения**
```php
// Переход к .env файлу
$name = env('APP_NAME'); // → .env файл (к строке APP_NAME)
$debug = env('APP_DEBUG'); // → .env файл (к строке APP_DEBUG)
```

**Навигация по контроллерам**
```php
// Переход к классам контроллеров
Route::get('/users', UserController::class); // → app/Http/Controllers/UserController.php
```

### Примеры автодополнения

**Дополнение маршрутов**
```php
// Введите 'route(' и получите дополнения для:
route('dashboard')     // ← Автодополнение из routes/web.php
route('users.index')   // ← Из именованных маршрутов
route('api.users.show') // ← API маршруты включены
```

**Дополнение представлений**
```php
// Введите 'view(' и получите дополнения для:
view('dashboard')        // ← Из resources/views/dashboard.blade.php
view('users.index')      // ← Из resources/views/users/index.blade.php
view('auth.login')       // ← Поддерживаются вложенные директории

// Inertia дополнение
Inertia::render('Dashboard')    // ← Из resources/js/Pages/Dashboard.tsx
Inertia::render('users/Show')   // ← Вложенные компоненты
```

**Дополнение конфигурации**
```php
// Введите 'config(' и получите дополнения для:
config('app.name')           // ← Из config/app.php
config('database.default')   // ← Из config/database.php
config('mail.mailers.smtp')  // ← Поддерживаются вложенные ключи
```

**Дополнение переводов**
```php
// Введите '__(' и получите дополнения для:
__('auth.failed')        // ← Из lang/en/auth.php
__('validation.required') // ← Из lang/en/validation.php
trans('messages.welcome') // ← Кастомные файлы переводов
```

**Дополнение переменных окружения**
```php
// Введите 'env(' и получите дополнения для:
env('APP_NAME')          // ← Из .env файла
env('DB_CONNECTION')     // ← Конфигурация базы данных
env('MAIL_MAILER')       // ← Конфигурация почты
```

### Интеграция Laravel IDE Helper
С установленным `barryvdh/laravel-ide-helper`, вы получаете улучшенные дополнения для:

**Дополнение методов фасадов**
```php
// Введите 'DB::' и получите дополнения для:
DB::table('users')       // ← Методы базы данных
DB::connection()         // ← Методы соединения
DB::transaction()        // ← Методы транзакций

// Другие фасады тоже работают:
Cache::get()             // ← Методы кэша
Auth::user()             // ← Методы аутентификации
Storage::disk()          // ← Методы хранилища
```

**Дополнение привязок контейнера**
```php
// Введите 'app(' и получите дополнения для:
app('auth')              // ← Из привязок контейнера
app('cache')             // ← Сервисный контейнер
app('config')            // ← Сервис конфигурации
resolve('custom.service') // ← Кастомные привязки
```

**Fluent методы миграций**
```php
Schema::create('users', function (Blueprint $table) {
    $table->id();            // ← Автодополнение после $table->
    $table->string('name');  // ← Типы колонок
    $table->nullable();      // ← Модификаторы колонок
    $table->index();         // ← Методы индексов
});
```

**Примечание**: Чтобы включить дополнения IDE Helper, установите пакет:

```bash
composer require --dev barryvdh/laravel-ide-helper
```

Затем выполните `:LaravelIdeHelper all` чтобы сгенерировать helper файлы.

### Примеры управления Composer

**Интерактивная установка пакетов**
```vim
:ComposerRequire
" ↓ Плагин запрашивает имя пакета
" Имя пакета: laravel/horizon
" ↓ Плагин запрашивает версию (опционально)
" Ограничение версии (опционально): ^5.0
" ↓ Плагин запрашивает dev зависимость
" Установить как dev зависимость? (y/N): n
" ↓ Выполняет: composer require laravel/horizon:^5.0
```

**Интерактивное удаление пакетов**
```vim
:ComposerRemove
" ↓ Плагин показывает fuzzy finder с установленными пакетами
" Выберите пакет для удаления:
" > laravel/horizon
"   phpunit/phpunit
"   spatie/laravel-ray
" ↓ Выполняет: composer remove laravel/horizon
```

**Прямые команды Composer**
```vim
:Composer install              " Установить зависимости
:Composer update               " Обновить все пакеты
:Composer dump-autoload        " Регенерировать автозагрузчик
:Composer show                 " Список установленных пакетов
:Composer outdated             " Показать устаревшие пакеты
:Composer validate             " Валидировать composer.json
```

**Визуализация зависимостей**
```vim
:ComposerDependencies
" ↓ Открывает буфер показывающий дерево зависимостей:
" laravel/framework v10.0.0
" ├── doctrine/inflector (^2.0)
" ├── dragonmantank/cron-expression (^3.0)
" ├── egulias/email-validator (^3.0)
" └── ...
```

### Примеры создания файлов

Когда вы переходите к несуществующему представлению, вам будет предложено создать его:

```php
// Переход к несуществующему представлению
return Inertia::render('onboarding/welcome');
// ↓ Плагин обнаруживает отсутствующий файл и предлагает:
// "Создать React TypeScript представление onboarding/welcome? (y/N)"
```

Плагин будет:
- Определять ваш фронтенд-стек (React, Vue, Svelte, TypeScript)
- Предлагать несколько вариантов:
  - `resources/views/onboarding/welcome.blade.php` (Blade)
  - `resources/js/Pages/onboarding/welcome.tsx` (React TypeScript)
  - `resources/js/Pages/Onboarding/Welcome.tsx` (Capitalized)
- Создавать пустые файлы с правильными расширениями
- Создавать директории если они не существуют

## 📋 Команды

### Основные команды

| Команда | Описание | Пример |
|---------|----------|--------|
| `:Artisan` | Запуск команд Laravel Artisan | `:Artisan make:controller UserController` |
| `:Composer` | Запуск команд Composer | `:Composer install` |
| `:LaravelMake` | Интерактивный выбор команд make | `:LaravelMake` |
| `:LaravelRoute` | Показать все маршруты приложения | `:LaravelRoute` |
| `:LaravelStatus` | Проверить статус плагина | `:LaravelStatus` |

### Команды Composer

| Команда | Описание | Пример |
|---------|----------|--------|
| `:Composer [command]` | Запустить любую команду Composer | `:Composer update` |
| `:ComposerRequire [pkg]` | Интерактивная установка пакетов | `:ComposerRequire laravel/horizon` |
| `:ComposerRemove [pkg]` | Интерактивное удаление пакетов | `:ComposerRemove phpunit/phpunit` |
| `:ComposerDependencies` | Показать дерево зависимостей проекта | `:ComposerDependencies` |

### Команды Laravel Sail

| Команда | Описание | Пример |
|---------|----------|--------|
| `:Sail [command]` | Запустить любую команду Sail | `:Sail php --version` |
| `:SailUp` | Запустить Sail контейнеры | `:SailUp -d` |
| `:SailDown` | Остановить Sail контейнеры | `:SailDown` |
| `:SailRestart` | Перезапустить Sail контейнеры | `:SailRestart` |
| `:SailTest` | Запустить тесты через Sail | `:SailTest --parallel` |
| `:SailShare` | Поделиться приложением через туннель | `:SailShare` |
| `:SailShell` | Открыть shell в контейнере | `:SailShell` |

## Как работает плагин

### Механизм навигации
1. **Анализ кода**: Использует treesitter для парсинга PHP кода и поиска вызовов Laravel функций
2. **Сопоставление паттернов**: Идентифицирует вызовы типа `route()`, `view()`, `config()` и т.д.
3. **Разрешение путей**: Преобразует строковые идентификаторы в реальные пути к файлам
4. **Переход**: Открывает соответствующий файл в Neovim

### Механизм автодополнения
1. **Сканирование проекта**: Анализирует файлы проекта для поиска доступных ресурсов
2. **Кэширование**: Сохраняет результаты для быстрого доступа (30-секундный кэш)
3. **Интеграция с completion engine**: Предоставляет источники для nvim-cmp и blink.nvim

### Просмотрщик дампов
1. **Service Provider**: Устанавливает провайдер в Laravel приложение
2. **Перехват вывода**: Захватывает вывод `dump()` и `dd()` функций
3. **Логирование**: Записывает дампы в лог-файл
4. **Мониторинг**: Neovim отслеживает изменения лог-файла в реальном времени
5. **Отображение**: Показывает дампы в форматированном всплывающем окне

### Требования
- **Treesitter PHP парсер** (рекомендуется): `:TSInstall php`
- **Neovim 0.8+**: Для поддержки всех функций
- **Laravel проект**: Плагин автоматически определяет проекты Laravel

Плагин предоставляет полноценную среду разработки для Laravel прямо в Neovim, экономя время на переключении между IDE и терминалом.
