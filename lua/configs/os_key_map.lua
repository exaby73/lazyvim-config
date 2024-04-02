local M = {}

local mac_map = {
  CMD_1 = "¡",
  CMD_2 = "™",
  CMD_3 = "£",
  CMD_4 = "¢",
  CMD_5 = "∞",
  CMD_6 = "§",
  CMD_7 = "¶",
  CMD_8 = "•",
  CMD_9 = "ª",
  CMD_SHIFT_P = "++",
  CMD_SHIFT_S = "ß",
  CMD_SHIFT_T = "†",
  CMD_SHIFT_V = "√",
  CMD_SHIFT_comma = "¯",
  CMD_SHIFT_period = "˘",
  CMD_a = "<C-a>",
  CMD_c = "<C-c>",
  CMD_comma = "≤",
  CMD_f = "+-",
  CMD_h = "<C-h>",
  CMD_i = "<C-i>",
  CMD_j = "<C-j>",
  CMD_k = "<C-k>",
  CMD_l = "<C-l>",
  CMD_p = "<C-p>",
  CMD_period = "≥",
  CMD_t = "<C-t>",
  CMD_u = "<C-u>",
  OPT_BACKSLASH = "«",
  OPT_SHIFT_BACKSLASH = "»",
  OPT_h = "˙",
  OPT_j = "∆",
  OPT_k = "˚",
  OPT_l = "¬",
  OPT_p = "π",
  OPT_w = "∑",
  OPT_BRACKET_LEFT = "“",
  OPT_BRACKET_RIGHT = "‘",
}

local regular_map = {
  CMD_1 = "¡",
  CMD_2 = "™",
  CMD_3 = "£",
  CMD_4 = "¢",
  CMD_5 = "∞",
  CMD_6 = "§",
  CMD_7 = "¶",
  CMD_8 = "•",
  CMD_9 = "ª",
  CMD_SHIFT_P = "++",
  CMD_SHIFT_S = "ß",
  CMD_SHIFT_T = "†",
  CMD_SHIFT_V = "√",
  CMD_SHIFT_comma = "¯",
  CMD_SHIFT_period = "˘",
  CMD_a = "<C-a>",
  CMD_c = "<C-c>",
  CMD_comma = "≤",
  CMD_f = "+-",
  CMD_h = "<C-h>",
  CMD_i = "<C-i>",
  CMD_j = "<C-j>",
  CMD_k = "<C-k>",
  CMD_l = "<C-l>",
  CMD_p = "<C-p>",
  CMD_period = "≥",
  CMD_t = "<C-t>",
  CMD_u = "<C-u>",
  OPT_BACKSLASH = "«",
  OPT_BRACKET_LEFT = "“",
  OPT_BRACKET_RIGHT = "‘",
  OPT_SHIFT_BACKSLASH = "»",
  OPT_h = "˙",
  OPT_j = "∆",
  OPT_k = "˚",
  OPT_l = "¬",
  OPT_p = "<A-p>",
  OPT_w = "<A-w>",
}

-- override = 'mac' or 'regular'
function M.setup(override)
  if override == "mac" then
    M.mapping = mac_map
  elseif override == "regular" then
    M.mapping = regular_map
  elseif vim.loop.os_uname().sysname == "Darwin" then
    M.mapping = mac_map
  else
    M.mapping = regular_map
  end
end

return M
