local wezterm = require 'wezterm'
local config = {}

-- Aplicar aqui configuraciones

-- Cambiar shell por defecto a powershell en Windows
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = { 'powershell.exe', '-NoLogo' }
end

-- Cambiar color scheme:
config.color_scheme = 'Kanagawa Dragon (Gogh)'
-- Cambiar fuente:
config.font = wezterm.font 'Iosevka Nerd Font'
-- Transparencia fondo:
config.window_background_opacity = 0.9
--Deshabilitar scrollbar
config.enable_scroll_bar = false

-- Retornar la configuracion
return config