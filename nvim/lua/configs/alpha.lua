local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require "alpha.themes.dashboard"

-- Footer
local function footer()
  local version = vim.version()
  local print_version = "v" .. version.major .. "." .. version.minor .. "." .. version.patch
  local datetime = os.date "%Y/%m/%d %H:%M:%S"

  return print_version .. " - " .. datetime
end

-- Banner
local banner = {
  [[]],
  [[]],
  [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠐⠁⠀⢀⡠⠀⣤⣶⣖⣾⣿⣿⢠⣾⣿⠿⣿⣿⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣷⣝⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠁⢀⣠⣾⠯⢑⣾⣿⢯⣿⣿⣿⣿⡏⠺⣷⣿⣭⣻⢿⣿⣿⣿⣦⣀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣯⣹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠏⢀⣴⣿⣿⣿⢓⣾⣿⢯⣿⣿⣿⣿⣿⣿⣠⡽⣿⣿⣿⣷⣽⢿⣿⣿⣿⣷⣦⡀⠀ ⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣷⡌⢿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠍⣰⣿⣿⣿⣟⢦⣿⣿⡿⣾⣿⣿⣿⣿⣿⣿⣯⢷⣮⢿⣿⣿⣿⣷⣝⢿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⡨⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣓⣾⣿⡿⣷⣿⡟⣾⣿⣿⢷⣿⣿⣿⣿⣿⣿⣿⣿⣯⢿⣷⡻⣿⣿⣿⣿⣿⡻⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣷⣙⣿⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⣾⣿⣿⣽⣿⣿⢻⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣷⡽⣿⣿⣿⣿⣿⡽⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠨⢿⣿⣿⣿⣿⣿⣷⠸⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣿⣿⠗⣾⣿⣿⣻⣿⣿⡿⣿⣿⣿⡏⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡽⣿⣿⣿⣿⣿⡽⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⢏⣿⣿⣿⣿⣿⣿⡖⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣿⡟⢸⣿⣿⢧⣿⣿⣿⡇⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⠜⣿⣿⣿⣿⣿⣿⣿⣿⡹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⢸⡼⣿⣿⣿⣿⣿⣇⡹⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣿⠗⣿⣿⡿⣾⣿⣿⣿⣿⣿⣿⣿⠃⣿⣿⣿⣿⣿⣿⡾⡿⣿⣿⣿⣿⣿⣿⣿⣷⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⢸⣴⢿⣿⣿⣿⣿⣿⠰⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⡟⢸⣿⣿⢷⣿⣿⣿⣿⣿⣿⣏⡏⠀⢹⣿⣿⣿⣿⣿⣿⣻⡽⣿⣯⢿⣿⣿⣿⣿⣷⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⣷⡞⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⡗⣿⣿⡿⣾⣿⣿⣿⣿⡿⣿⣹⠀⠀⠘⣿⣟⣿⣯⣿⣿⣧⢿⣟⣿⣯⠿⣿⣿⣿⣿⣧⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⣿⣷⢻⣿⣿⣿⣿⣧⣹⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⠀⣿⣿⣧⣿⣿⣿⣿⣿⣇⣏⡇⠀⠀⠀⠹⣿⡽⣿⣿⣿⣿⣯⢿⣯⣿⣯⣮⣿⣿⣷⣻⣯⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⣿⣿⡾⣿⣿⣿⣿⣿⢹⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⢵⣿⣿⢿⣿⣿⣿⣿⣿⡯⡌⠁⠀⠀⠀⠀⢳⣳⠹⣿⣿⣿⣿⣯⣿⣷⣽⣷⡿⣝⢿⣿⡽⡞⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⣿⣿⣧⣿⣿⣿⣿⣿⣜⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⢺⣿⣿⢸⣿⢿⣿⣿⣿⡏⠘⠀⠀⠀⠀⠀⠀⠻⣥⡹⣿⣿⣿⣿⣷⡻⣿⣮⣿⣾⢿⣿⣿⣽⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⢹⣿⣿⢹⢹⢫⣻⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⠀⣿⣼⡇⡿⢸⣿⣿⣟⣷⠄⠀⠀⠀⠀⠀⠀⠀⠙⣦⢘⢿⣿⣿⣿⣿⣿⢿⣿⣿⣷⣿⢿⡿⡍⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⡇⣹⣿⣿⢸⡏⣿⡌⣾⡈⣨⢿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⡆⡏⣿⣷⠇⡏⣿⣿⣿⣭⢆⠀⠀⠀⠀⠀⠀⡀⠀⠈⠣⠑⠙⣿⣿⣿⣿⣷⣵⣿⣿⣿⡻⣿⣿⢻⣿⣿⣿⣿⣿⣿⣿⣿⡛⡇⣿⣿⣿⢸⡇⡏⠁⡟⣹⣾⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣇⡇⣹⣿⡞⡿⣼⣿⣿⡿⣎⢆⠀⠀⠀⠀⠐⠀⠃⠆⠄⠑⠀⠀⢙⢿⣯⣻⣿⣷⣝⢝⡿⣿⣟⢜⢿⣿⣿⣿⣿⣿⣿⣿⢀⡇⣿⣿⣿⢸⣇⡧⣦⠁⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⡇⠁⠐⠉⣿⡇⣱⣻⢿⣷⢈⠃⠳⡄⠀⠀⠀⣀⡄⣖⣾⣿⣷⣮⡩⣟⣫⡻⣿⡳⣯⣗⣝⣾⣜⣽⣏⡟⠻⣿⣿⣿⣿⡟⢦⢷⣿⣿⣿⠳⡿⡇⣿⣰⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣿⡆⠾⣎⢸⡇⡏⢧⡸⡻⡞⣷⡀⠈⣠⣴⣿⣿⣿⡺⣿⣿⣿⣿⣿⣾⣿⣿⣷⣽⢢⢏⡟⣻⠯⢹⣿⡿⣿⣷⣿⣽⡟⡍⡞⣼⣿⣿⠏⣽⠇⢹⣧⣼⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣿⣿⣦⣙⡖⠹⡃⡞⣷⣽⣎⡪⣳⢺⣿⡿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣽⣾⣵⣫⠜⠿⠿⠿⣇⣿⠟⡰⢍⢶⣿⣟⡟⢰⡟⠨⣾⣿⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡘⡐⠤⠚⣿⣿⣽⣷⣖⡵⣿⣿⣿⣿⣿⡿⢿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡾⠊⣶⣾⣿⣻⢹⢵⠣⢥⢫⣿⡟⢊⠀⡟⣐⣽⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡵⢱⣦⡬⣻⣿⡹⣿⣮⣎⡻⣿⣿⣿⣾⡼⢿⣿⣶⣿⣿⣿⣿⣿⣿⡿⡯⣥⣆⣿⢿⠗⡏⢿⡗⢜⢡⠟⢏⣶⡿⠒⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡘⣛⣝⣂⣙⡷⣮⡙⡿⣌⢺⢟⢿⣿⣿⣿⣿⣿⣾⣿⣿⣿⢟⠯⣾⢽⡿⡼⠫⠫⠸⡤⡜⢣⠈⣑⢘⣼⣷⡯⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡜⢹⣿⡟⣷⣮⣵⠁⠅⡌⠀⣦⡍⠻⢿⣿⡿⠿⠛⢫⡄⢫⣼⣾⠿⢫⡆⢰⡆⠀⣾⣦⠈⠠⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⢻⠋⣁⣠⠋⡟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⣠⣼⠀⠀⢺⣧⣷⣶⣶⣾⣿⣿⣿⣼⣤⣼⡇⠈⠃⢰⣿⣿⣷⣄⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⠟⣛⡬⠊⠁⠀⠈⠻⣷⡧⣍⠟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠈⠉⠉⠉⠛⠛⠛⠛⠉⠉⠉⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⡿⢛⣬⣾⠏⢀⠂⡁⠠⠀⠀⠘⢻⢧⣝⢠⠘⠟⢿⣿⣿⡿⢿⠿⠋⠾⣠⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⣠⣾⡿⠁⡐⠠⠂⠄⠡⢀⠀⠀⠀⠑⠌⠣⠄⠀⠈⣭⣵⣶⣾⠟⠋⠉⠙⠛⠦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠨⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⡛⠛⠟⣿⣿⣿⣿⣿]],
  [[⣿⢟⡠⠡⠐⠡⠈⠄⠁⠀⠀⠀⠀⠀⠀⠁⠈⠀⡀⠊⠛⠉⠀⠀⢀⠀⠀⠀⠀⠁⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢋⠟⣿⡿⠟⣟⣭⣭⣭⣭⣴⠏⠀⢀⠀⠈⠋⣿⣿⣿]],
  -- [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣯⣾⣿⡿⢟⣿⠛⠉⠩⠁⠀⠀⡟⠁⠀⣀⠀⠀⠈⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠈⠢⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣾⡿⠟⠁⣐⡮⠁⠀⡐⠀⠀⠀⠀⢰⣅⠈⠀⠒⠄⡀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠐⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣰⡿⠋⠀⠀⠀⡬⠁⠀⡐⠀⠀⠀⠀⠀⠀⠟⢂⠀⠀⠀⠈⠂⡀⠀⠀⠀⠈⠙⢿⣿⣻⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠈⢳⡀⠀⠀⠀⠀⠀⠀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣲⠏⠀⠀⠀⠠⡙⠀⠀⢀⠁⠀⠀⠀⠀⠀⠀⠐⡈⠑⡀⠀⠀⠀⠈⠢⡀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⢗⠀⠀⠀⠀⠀⠀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠬⠁⠀⢀⠈⠀⢠⠁⠀⠀⡈⠀⠀⠀⠀⠀⠀⠀⠀⠐⡀⠈⢄⠀⠀⠀⠀⠀⢄⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠈⠦⠀⠀⠀⠀⠀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠁⠀⠀⠂⠀⠀⡄⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⠈⢂⠀⠀⠀⠀⠀⢂⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣗⡀⠀⠀⠀⠀⠀⠈⣇⠀⠀⠀⠀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⠀⠀⣨⠁⠀⠀⠄⠀⠀⢀⠀⠀⠀⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢂⠀⠀⠀⠀⠀⢂⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⡰⠀⠀⠀⠀⠀⠀⢩⠀⠀⠀⠀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⠀⢠⡇⠀⠀⡘⠀⠀⠀⢸⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⣣⠀⠀⠀⠀⠀⠀⠀⠀⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⡇⢃⠀⠀⠀⠀⠀⠸⢆⠀⠀⠀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⠀⣨⠀⠀⢀⠁⠀⠀⠀⠀⠀⠀⠀⣼⠀⠀⠀⠀⠀⠀⢁⢀⠀⠀⠀⠀⠀⠀⠀⠈⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⡇⠋⡀⠀⠀⠀⠀⠀⣏⠀⠀⠀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⢠⡇⠀⠀⡈⠀⠀⠀⠀⠀⠀⠰⢰⣿⡆⠀⠀⠀⠀⠀⠀⠄⢂⠀⠐⡀⠀⠀⠀⠀⠈⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⠈⢡⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⢨⠀⠀⢀⠁⠀⠀⠀⠀⢀⠀⠆⣿⣿⣧⠀⠠⠀⠐⠀⠀⠘⡀⠠⠀⠐⣀⠀⠀⠀⠀⠘⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⠀⠈⡄⠀⠀⠀⠀⠘⠆⠀⠀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⣿⠀⠀⠘⠀⠀⠀⠀⠀⠸⠰⢸⣿⣿⣿⣆⠀⢂⠀⠀⠀⠀⠐⡀⠐⠀⠐⠑⠀⠀⠈⠄⠐⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⠀⠀⢁⠀⠀⠀⠀⠀⡆⠀⠀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⡊⠀⠀⡀⠀⠀⠀⠀⠀⢐⢳⣾⣿⣿⣿⣿⡌⠌⣆⠀⠀⠀⠀⠐⠀⠈⠂⠈⢀⠢⡀⠀⢂⢡⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⠀⠀⠘⠀⠀⠀⠀⠀⠣⠀⠀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⡅⠀⠀⡇⠀⡀⠀⠀⠀⢰⣧⣿⣿⣿⣿⣿⣿⣄⠚⢆⠀⠀⠀⠀⠈⢄⠀⠑⠀⠁⡀⠀⠀⠂⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⡆⠀⠀⡆⡆⡔⠄⠀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⣿⠀⠃⢸⢀⡇⠀⠀⠠⠈⣻⣿⣿⣿⣿⣿⣿⣿⣦⠙⡧⡀⠀⠀⠀⠀⠀⡀⠀⠀⠈⠀⡀⢀⢲⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⢸⠆⠀⠀⡇⢰⠀⢳⠁⢷⠗⡀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⢹⢰⠀⠈⣸⢰⠀⠀⠀⠒⡹⣿⣿⣿⣿⣿⣿⢿⣿⣷⣜⣮⣦⠀⠀⠀⠀⠈⠊⠀⠀⠀⢄⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⢤⢸⠀⠀⠀⡇⢸⢰⣾⢠⠆⠁⠀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⠸⢸⠆⠀⢡⢀⠃⠀⠀⢀⠱⡹⣿⣿⣿⣿⣯⣿⣼⣹⣻⣮⣿⣿⡦⡀⠐⠄⠀⠈⠢⡢⢀⠀⠠⡣⡀⠀⠀⠀⠀⠀⠀⠀⡿⢸⠀⠀⠀⡇⠸⢘⠙⣾⠀⠀⠀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⢸⣾⣯⣶⠀⢸⠎⠄⡀⠈⡷⣼⣌⢻⣿⣿⣿⠿⢻⠩⠁⠀⠈⠑⢖⠠⠔⢄⠀⢌⠐⠨⠢⠁⠣⠂⠰⢠⣄⠀⠀⠀⠀⢠⡙⡈⠀⠀⠀⣌⢀⢸⠀⠏⠀⠀⠀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⠀⢹⣁⠱⡇⢸⢰⡘⢇⢄⢡⠈⢿⣷⠟⠋⠀⠀⠀⢅⠀⠀⠀⠀⠀⠁⠀⠀⠈⠂⡝⡰⢠⠄⣐⡆⠀⢀⠀⠈⠀⠂⢠⢲⢡⠃⠀⠀⣰⠂⣸⡆⠘⠃⠀⠀⠀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⠀⠀⠙⠦⢩⣆⢼⢡⠈⠂⠱⢕⠌⡅⠀⢀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠂⠁⠊⠔⣣⣀⣀⣀⠸⠀⣠⢏⡲⡉⠀⠠⢠⡏⢠⣗⠁⠀⠀⠀⠀⠀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢧⢯⣛⣥⠀⠀⠂⠈⠩⢊⠀⠀⠀⠀⠀⢀⡀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢁⣵⠉⠁⠀⠄⡆⡊⣜⡚⡔⠀⢠⡵⣿⢠⠯⠂⠀⠀⠀⠀⠀⠀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢊⡎⠙⢓⠄⠀⢆⠀⠑⠱⢄⠀⠀⠀⠁⢃⡀⠀⠉⠀⠀⠀⠀⠀⠀⢀⢐⠚⠹⠀⡀⣨⢰⡀⢨⡣⡞⣠⡰⠉⢀⣭⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢧⠤⠢⠽⠦⢈⠑⢦⢀⠳⡅⡠⡀⠀⠀⠀⠀⠀⠁⠀⠀⠀⡠⣐⠁⡂⢀⢃⣔⣔⣇⢛⢣⡜⣷⠮⡧⠃⠈⢐⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢣⡆⠀⢠⠈⠑⠊⣾⣺⢳⣿⠙⢲⣄⡀⠀⢀⣀⣤⡔⢻⡔⠃⠁⣀⡔⢹⡏⢹⣿⠁⠙⣷⣟⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  -- [[⠀⠀⠀⠀⠀⠀⡄⣴⠾⠟⣴⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠟⠃⣿⣿⡅⠘⠈⠉⠉⠁⠀⠀⠀⠃⠛⠃⢸⣷⣼⡏⠀⠀⠈⠻⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  -- [[⠀⠀⠀⣠⠤⢓⣵⣾⣿⣷⣄⠈⢘⠲⣠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣷⣶⣶⣶⣤⣤⣤⣤⣶⣶⣶⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  -- [[⢀⡤⠓⠁⣰⡿⣽⢾⣟⣿⣿⣧⡄⡘⠢⡟⣧⣠⡀⠀⠀⢀⡀⣀⣴⣁⠟⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  -- [[⠟⠁⢀⣾⢯⣟⣽⣻⣞⡿⣿⣿⣿⣮⣳⣜⣻⣿⣷⠒⠊⠉⠁⣠⣴⣶⣦⣤⣙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣗⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⢤⣤⣠⠀⠀⠀⠀⠀]],
}

dashboard.section.header.val = banner
vim.api.nvim_set_hl(0, "MyCustomHeader", { fg = "#7fbbb3" })
vim.api.nvim_set_hl(0, "MyCustomFooter", { fg = "#7fbbb3", italic = true })

-- Menu
dashboard.section.buttons.val = {
  dashboard.button("n", "󰙅  Toggle Tree", ":NvimTreeToggle <CR>"),
  dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
  dashboard.button("q", "󰈆  Quit Neovim", ":qa<CR>"),
  -- more... check nvconfig.lua file for full list of buttons
}

-- local function footer()
--   return "Sleep sleep and sleep..."
-- end

dashboard.section.footer.val = footer()

dashboard.section.header.opts.hl = "MyCustomHeader"
dashboard.section.footer.opts.hl = "MyCustomFooter"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

dashboard.section.footer.val = footer()

alpha.setup(dashboard.config)