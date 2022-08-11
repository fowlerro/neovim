local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local env = ls.config.snip_env
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local l = require("luasnip.extras").lambda
local postfix = require("luasnip.extras.postfix").postfix


-- React Typescript Snippets
ls.add_snippets("typescriptreact", {
  s({
    trig="rtfc",
    name="React TS Functional Component"
  }, {
      f(function(_, snip) return "function " .. snip.env.TM_FILENAME_BASE .. "()" end, {}),
      t({ "{", "\t" }),
      i(1),
      t({ "", "" }),
      t({ "}", "", "" }),
      f(function(_, snip) return "export default " .. snip.env.TM_FILENAME_BASE end, {})
  }),
  s({
    trig="rtfcp",
    name="React TS Functional Component with Props"
  }, {
      f(function(_, snip) return "interface " .. snip.env.TM_FILENAME_BASE .. "Props" end, {}),
      t({ "{", "\t" }),
      i(1),
      t({ "", "}", "", "" }),

      f(function(_, snip) return "function " .. snip.env.TM_FILENAME_BASE .. "({ " end, {}),
      i(2, "props"),
      f(function(_, snip) return " }: " .. snip.env.TM_FILENAME_BASE .. "Props) " end, {}),
      t({ "{", "\t" }),
      i(3),
      t({ "", "" }),
      t({ "}", "", "" }),
      f(function(_, snip) return "export default " .. snip.env.TM_FILENAME_BASE end, {})
  })
})
