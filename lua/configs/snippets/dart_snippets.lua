local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require "luasnip.util.events"
-- local ai = require "luasnip.nodes.absolute_indexer"
local extras = require "luasnip.extras"
local l = extras.lambda
local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require "luasnip.extras.expand_conditions"
local postfix = require("luasnip.extras.postfix").postfix
-- local types = require "luasnip.util.types"
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet
-- local k = require("luasnip.nodes.key_indexer").new_key

local function get_current_file_name()
  return vim.fn.expand "%:t:r"
end

local function snake_to_pascal(snake_case_str)
  -- Split the string by underscores
  local parts = {}
  for part in snake_case_str:gmatch "[^_]+" do
    table.insert(parts, part)
  end

  -- Capitalize the first letter of each part and concatenate
  local pascal_case_str = ""
  for _, part in ipairs(parts) do
    pascal_case_str = pascal_case_str .. part:sub(1, 1):upper() .. part:sub(2)
  end

  return pascal_case_str
end

local function class_name_from_file_name()
  local current_file_name = get_current_file_name()
  return snake_to_pascal(current_file_name)
end

return {
  -- SizedBox with height
  s("sbh", {
    t "const SizedBox(height: ",
    i(1, "20"),
    t "),",
  }),

  -- SizedBox with width
  s("sbh", {
    t "const SizedBox(width: ",
    i(1, "20"),
    t "),",
  }),

  -- freezed import and part files
  s("fpart", {
    -- get name and turn into PascalCase
    t { "import 'package:freezed_annotation/freezed_annotation.dart';", "", "part '" },
    f(function()
      local current_file_name = get_current_file_name()
      return current_file_name .. ".freezed.dart';"
    end),
    t { "", "part '" },
    f(function()
      local current_file_name = get_current_file_name()
      return current_file_name .. ".g.dart';"
    end),
    t { "", "" },
  }),

  -- freezed class
  s("fdc", {
    t { "@freezed", "" },
    c(1, { t "", t "sealed " }),
    t "class ",
    d(2, function()
      return sn(nil, { i(1, class_name_from_file_name()) })
    end),
    t " with _$",
    rep(2),
    t { " {", "" },
    t "\tconst factory ",
    rep(2),
    t "(",
    i(3),
    t ") = _",
    rep(2),
    t ";",
    t { "", "}" },
  }),

  -- freezed union cases
  s("fuc", {
    t "const factory ",
    d(1, function()
      return sn(nil, { i(1, class_name_from_file_name()) })
    end),
    t ".",
    i(2, "case"),
    t "(",
    i(3),
    t ") = ",
    d(4, function(args)
      local case = args[1][1]
      local case_with_first_letter_upper = case:gsub("^%l", string.upper)
      return sn(nil, { t(case_with_first_letter_upper) })
    end, { 2 }),
    t ";",
  }),

  -- freezed json serialization
  s("fjson", {
    t "factory ",
    d(1, function()
      return sn(nil, { i(1, class_name_from_file_name()) })
    end),
    t ".fromJson(Map<String, dynamic> json) => _$",
    rep(1),
    t "FromJson(json);",
  }),

  -- wrap variable in string interpolation
  postfix(".si", {
    l("'${" .. l.POSTFIX_MATCH .. "}'"),
  }),

  -- wrap with print
  postfix(".print", {
    l("print(" .. l.POSTFIX_MATCH .. ");"),
  }),
}
