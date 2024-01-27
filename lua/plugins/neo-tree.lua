local myOpts = {
  sources = { "filesystem", "buffers", "git_status", "document_symbols" },
  open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
  filesystem = {
    filtered_items = {
      visible = true,
    },
    bind_to_cwd = false,
    follow_current_file = { enabled = true },
    use_libuv_file_watcher = true,
  },
  window = {
    mappings = {
      ["<space>"] = "none",
    },
  },
  default_component_configs = {
    indent = {
      with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
  },
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  init = function()
    if vim.fn.argc(-1) == 1 then
      local fname = vim.fn.argv(0)
      local dir_name = fname .. "/"
      local stat = vim.loop.fs_stat(fname)
      if stat and stat.type == "directory" then
        vim.api.nvim_set_current_dir(dir_name)
        require("neo-tree").setup(myOpts)
      else
      end
    end
  end,
  opts = myOpts,
}
