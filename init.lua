-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("toggleterm-config")
require("telescope-delta")
require("templ-format")
require("go-snips")

local function set_current_directory_as_titlestring()
  -- Get the first level directory of the current buffer's file path
  local current_directory = vim.fn.fnamemodify(vim.loop.cwd(), ":p:h:t")

  -- Set the current directory as the titlestring
  vim.opt.titlestring = current_directory .. " %< %F %="
end

vim.g.minipairs_disable = true

vim.opt.title = true
vim.opt.titlelen = 0

set_current_directory_as_titlestring()

vim.api.nvim_create_user_command("Cppath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  callback = set_current_directory_as_titlestring,
})

-- Templ
vim.filetype.add({ extension = { templ = "templ" } })
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = vim.lsp.buf.format })
