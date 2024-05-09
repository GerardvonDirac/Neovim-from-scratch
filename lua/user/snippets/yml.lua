local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return
end

local s = luasnip.snippet
local sn = luasnip.snippet_node
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
local c = luasnip.choice_node
local d = luasnip.dynamic_node
local r = luasnip.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")


luasnip.add_snippets("yaml", {
	-- trigger is `fn`, second argument to snippet-constructor are the nodes to insert into the buffer on expansion.
	s("debug", {
		t({"- debug:", "\t"}),
		t("  msg: \"{{ "),
    i(1),
    t({" }}\""}),
	}),
	s("vdebug", {
		t({"- debug:", "\t"}),
		t("  var: \""),
    i(1),
    t({"\""}),
	}),
})
