local function generate_uuid(template)
  math.randomseed(os.time())
  local random = math.random
  return string.gsub(template, "x", function()
    local v = random(0, 0xf) -- v is a decimal number 0 to 15
    return string.format("%x", v) --formatted as a hex number
  end)
end

local insert_uuid = function(template)
  if not template then
    template = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  end
  -- Get row and column cursor,
  -- use unpack because it's a tuple.
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local uuid = generate_uuid(template)
  -- Notice the uuid is given as an array parameter, you can pass multiple strings.
  -- Params 2-5 are for start and end of row and columns.
  -- See earlier docs for param clarification or `:help nvim_buf_set_text.
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { uuid })
end

require("which-key").add({
  {
    "<leader>cu",
    function()
      insert_uuid()
    end,
    desc = "Insert UUID",
  },
  {
    "<leader>cU",
    function()
      insert_uuid("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
    end,
    desc = "Insert UUID - No Dashes",
  },
})
