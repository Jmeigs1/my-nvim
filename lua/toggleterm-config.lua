local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

local Terminal = require("toggleterm.terminal").Terminal

local node = Terminal:new({ cmd = "node", hidden = true })
function _NODE_TOGGLE()
  node:toggle()
end

local python = Terminal:new({ cmd = "python3", hidden = true })
function _PYTHON_TOGGLE()
  python:toggle()
end

require("which-key").add({
  { "<leader>t", group = "Terminal" },
  { "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", desc = "Node" },
  { "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", desc = "Python" },
  { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float" },
  { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal" },
  { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical" },
  { "<leader>ts", "<cmd>TermSelect<cr>", desc = "Select Terminal" },
})
