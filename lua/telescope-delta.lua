local previewers = require("telescope.previewers")
local builtin = require("telescope.builtin")

local delta = previewers.new_termopen_previewer({
  get_command = function(entry)
    if entry.status and (entry.status == "??" or entry.status == "A ") then
      return { "git", "diff", "--no-index", "--", "/dev/null", entry.value }
    else
      return { "git", "diff", "HEAD", "--", entry.value }
    end
  end,
})

local delta_git_status = function(opts)
  opts = opts or {}
  opts.previewer = delta

  builtin.git_status(opts)
end

require("which-key").add({
  {
    "<leader>gs",
    function()
      delta_git_status()
    end,
    desc = "Status",
  },
})
