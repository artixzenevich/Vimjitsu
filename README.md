# VimJitsu

Основано на [lazyvim](https://www.lazyvim.org/)

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
