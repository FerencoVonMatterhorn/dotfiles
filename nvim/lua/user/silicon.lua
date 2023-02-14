local status_ok, silicon = pcall(require, "silicon")
if not status_ok then
  return
end

silicon.setup({
  font = 'Hack Nerd Font Mono',
  theme = 'Monokai Extended',
  output = {
    file = "", -- full path of the file to save to.
    clipboard = true,
    path = ".", -- where to save images e.g. /home/user/Pictures
    format = "silicon_[year][month][day]_[hour][minute][second].png",
  }
})
