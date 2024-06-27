local status_ok, highlight_whitespace = pcall(require, "highlight-whitespace")
if not status_ok then
  return
end

highlight_whitespace.setup {
  tws = '\\s\\+$',
  clear_on_winleave = false,
  palette = {
    markdown = {
      tws = 'RosyBrown',
      ['\\(\\S\\)\\@<=\\s\\(\\.\\|,\\)\\@='] = 'CadetBlue3',
      ['\\(\\S\\)\\@<= \\{2,\\}\\(\\S\\)\\@=|\\@!'] = 'SkyBlue1', -- exclude spaces followed by | to make tables prettier
      ['\\t\\+'] = 'plum4',
    },
    go = {
      tws = 'PaleVioletRed',
    },
    csv = {
      tws = 'bg',
      ['\\(\\S\\)\\@<=\\s\\(\\.\\|,\\)\\@='] = 'bg',
      ['\\(\\S\\)\\@<= \\{2,\\}\\(\\S\\)\\@='] = 'bg',
      ['\\t\\+'] = 'plum4',
    },
    other = {
      tws = 'PaleVioletRed',
      ['\\(\\S\\)\\@<=\\s\\(,\\)\\@='] = 'coral1',
      -- ['\\(\\S\\)\\@<= \\{2,\\}\\(\\S\\)\\@='] = 'LightGoldenrod3',
      ['\\t\\+'] = 'plum4',
    }
  }
}
