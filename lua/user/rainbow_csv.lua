local status_ok, rainbow_csv = pcall(require, "rainbow_csv")
if not status_ok then
  return
end

vim.g.rcsv_colorpairs = {
  {'red', 'red'},
  {'green', 'green'},
  {'magenta', 'magenta'},
  {'NONE', 'NONE'},
  {'lightred', 'lightred'},
  {'lightblue', 'lightblue'},
  {'lightgreen', 'lightgreen'},
  {'lightmagenta', 'lightmagenta'},
  {'lightcyan', 'lightcyan'}
}
