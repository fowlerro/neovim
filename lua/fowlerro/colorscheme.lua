local colorscheme = "darkplus"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then vim.notify("colorscheme " .. colorscheme .. " not found!", 3) return end
