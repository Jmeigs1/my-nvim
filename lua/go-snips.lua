local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

ls.add_snippets("go", {
  snip({
    trig = "ifer",
    name = "If Err",
    desc = "If Err Stub",
  }, {
    text({ "if err != nil {", "\treturn " }),
    insert(1, "err"),
    text({ "", "}" }),
  }),
})
