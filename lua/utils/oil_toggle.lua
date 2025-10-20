-- В какой-то момент я просто подумал, что так будет проще именно мне.
-- Суть в том, что при вызове Oil делается поведение как к NvimTreeToggle 
local oil = require("oil")

-- Создаем toggle функцию
local function toggle_oil()
    local oil_open = false
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == "oil" then
            oil_open = true
            break
        end
    end

    if oil_open then
        -- Закрыть все Oil окна
        vim.cmd("bd")
    else
        -- Открыть Oil
        oil.open_float()
    end
end

-- Настройка маппинга
vim.keymap.set("n", "<space>e", toggle_oil, { desc = "Toggle Oil" })
