# VimJitsu

Долгое время я пытался создать удобную рабочую среду, с которой мог бы комфортно работать. Готовые решения оказывались либо неудобными, либо слишком громоздкими, либо (что более вероятно) мне было лень разбираться и тратить на это время.

Этот проект представляет собой простую компиляцию идей, которые были либо подсмотрены на YouTube, либо пришли мне в голову во время ночных размышлений. Я старался сделать всё максимально минималистичным. Пока сложно сказать, что из этого получится.

Конфигурация ориентирована на типичную full-stack разработку. Меня также вдохновил Emacs с его подходом, и в настоящее время я планирую использовать **Neovim** как систему для ведения заметок, а в дальнейшем перевести половину своего workflow в эту среду.

## Зависимости

- [Neovim](https://github.com/neovim/neovim/blob/master/BUILD.md) - >= 0.11.0 (на момент последней сборки использовалась nightly 0.12.0)
- [Nerds Font](https://www.nerdfonts.com/) - шрифт с иконками
- [Lazygit](https://github.com/jesseduffield/lazygit/tree/master) - удобный интерфейс для работы с Git
- **curl** - требуется для blink.cmp
- **fd, fzf, ripgrep** - для поиска файлов и текста
- [kitty](https://sw.kovidgoyal.net/kitty/) - терминальный эмулятор

## Установка


```bash
git clone https://github.com/artixzenevich/Vimjitsu
```

Рекомендуется создать резервные копии или удалить существующие конфигурации Neovim:

```bash
# Создание резервных копий
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# Или полное удаление
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

## Архитектура

### Базовые компоненты

- [mini.nvim](https://github.com/nvim-mini/mini.nvim) - набор минималистичных модулей
 - mini.pairs - автоматическое закрытие скобок и кавычек
 - mini.tabline - панель с открытыми файлами
 - mini.cursorword - подсветка одинаковых слов под курсором

### Разработка

- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - движок сниппетов
- [blink.cmp](https://github.com/Saghen/blink.cmp) - система автодополнения
- [lazydev](https://github.com/folke/lazydev.nvim) - инструменты для разработки конфигураций Neovim
- [lazygit](https://github.com/kdheepak/lazygit.nvim) - интеграция с Lazygit

### Внешний вид

- [gruvbox](https://github.com/ellisonleao/gruvbox.nvim) - классическая цветовая схема
- [transparent.nvim](https://github.com/xiyaowong/transparent.nvim) - прозрачный фон для интеграции с окружением
- [startup.nvim](https://github.com/max397574/startup.nvim) - стартовая страница

### Файлы и навигация

- [oil](https://github.com/stevearc/oil.nvim) - файловый менеджер, позволяющий редактировать файловую систему как обычный буфер
- [oil-git](https://github.com/benomahony/oil-git.nvim) - отображение Git-статуса в Oil
- [oil-lsp-diagnostic](https://github.com/JezerM/oil-lsp-diagnostics.nvim) - диагностика ошибок для файлов в Oil
- [telescope](https://github.com/nvim-telescope/telescope.nvim) - мощная система поиска
- [noice](https://github.com/folke/noice.nvim) - улучшенная система уведомлений

### Форматирование и анализ кода

- [conform](https://github.com/stevearc/conform.nvim) - автоматическое форматирование при сохранении
- [mason](https://github.com/mason-org/mason.nvim) - менеджер для установки LSP, DAP, линтеров и форматеров
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - улучшенная подсветка синтаксиса

### Интерфейс

- [lualine](https://github.com/nvim-lualine/lualine.nvim) - информативная строка состояния

## Работа с LSP

[Перевод](https://neovim.io/doc/user/lsp.html)

Nvim предоставляет LSP-клиент, но серверы предоставляются сторонними разработчиками. 
Выполните следующие шаги, чтобы получить возможности LSP:

Установите языковые серверы с помощью вашего менеджера пакетов или следуя инструкциям по установке от разработчиков. 
Список языковых серверов можно найти здесь: [https://microsoft.github.io/language-server-protocol/implementors/servers/](https://microsoft.github.io/language-server-protocol/implementors/servers/)

Определите новую конфигурацию `lsp-new-config` (или установите [https://github.com/neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)). 

Пример:

```lua
vim.lsp.config['luals'] = {
  -- Команда и аргументы для запуска сервера.
  cmd = { 'lua-language-server' },
  -- Типы файлов, к которым следует автоматически подключаться.
  filetypes = { 'lua' },
  -- Устанавливает "рабочую область" в каталог, где найден любой из этих файлов.
  -- Файлы, имеющие общий корневой каталог, будут использовать одно LSP-подключение.
  -- Вложенные списки указывают равный приоритет, см. |vim.lsp.Config|.
  root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
  -- Специфичные настройки для отправки на сервер. Схема определяется сервером.
  -- Пример: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      }
    }
  }
}
```

Используйте `vim.lsp.enable()`, чтобы активировать конфигурацию. 

Пример:

```lua 
vim.lsp.enable('luals')
```

Откройте файл с кодом, соответствующий одному из типов файлов, указанных в конфигурации.
Примечание: В зависимости от LSP-сервера, вам может потребоваться убедиться, 
что в вашем проекте есть файл, указанный в root_markers, чтобы рабочая область могла быть распознана.

Проверьте, что LSP активен ("прикреплён") для буфера:

```text
:checkhealth vim.lsp
```

(Опционально) Настройте сочетания клавиш и автокоманды для использования возможностей LSP. lsp-attach


