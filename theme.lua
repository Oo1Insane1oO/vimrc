------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------

local themes_path = require("gears.filesystem").get_themes_dir()

local orange1 =     "#FE8019"
local orange2 =     "#D65D0E"
local orange3 =     "#AD3900"
local yellow1 =     "#FABD2F"
local red1 =        "#FB4934"
local foreground1 = "#EBDBB2"
local foreground2 = "#FBF1C7"
local background1 = "#282828"
local background2 = "#32302F"
local background3 = "#3C3836"
local background4 = "#504945"

theme = {}
theme.wallpaper = "~/.config/awesome/steins-gate-0-numbers.jpeg"

theme.font              = "DejaVu Sans Mono 10"
theme.notification_font = "DejaVu Sans Mono 14"

theme.notification_icon_size    = 32
theme.notification_border_width = 2

theme.fg_normal  = foreground1 
theme.fg_focus   = foreground2 
theme.fg_urgent  = red1 
theme.bg_normal  = background1 .. "ea"
theme.bg_focus   = orange3 .. "ea"
theme.bg_urgent  = background1 .. "ea"
theme.bg_systray = background1 .. "ea"

theme.tasklist_bg_focus  = theme.bg_focus
theme.tasklist_bg_normal = theme.bg_normal 

theme.titlebar_bg_focus  = theme.bg_focus 
theme.titlebar_bg_normal = theme.bg_normal 

theme.notification_bg                    = background2 .. "df"
theme.notification_fg                    = theme.fg_tooltip
theme.notification_border_color          = background3
theme.notification_critical_bg           = orange2 .. "df"
theme.notification_critical_border_color = orange1

theme.systray_icon_spacing = 2
theme.main_height          = 26
theme.menu_height          = 20
theme.menu_width           = 250

theme.border_width  = 0
theme.border_normal = background1
theme.border_focus  = background1
theme.border_marked = background1

theme.taglist_squares_sel   = themes_path .. "zenburn/taglist/squarefz.png"
theme.taglist_squares_unsel = themes_path .. "zenburn/taglist/squarez.png"
theme.awesome_icon           = themes_path .. "zenburn/awesome-icon.png"
theme.menu_submenu_icon      = themes_path .. "default/submenu.png"

theme.layout_tile       = themes_path .. "zenburn/layouts/tile.png"
theme.layout_tileleft   = themes_path .. "zenburn/layouts/tileleft.png"
theme.layout_tilebottom = themes_path .. "zenburn/layouts/tilebottom.png"
theme.layout_tiletop    = themes_path .. "zenburn/layouts/tiletop.png"
theme.layout_fairv      = themes_path .. "zenburn/layouts/fairv.png"
theme.layout_fairh      = themes_path .. "zenburn/layouts/fairh.png"
theme.layout_spiral     = themes_path .. "zenburn/layouts/spiral.png"
theme.layout_dwindle    = themes_path .. "zenburn/layouts/dwindle.png"
theme.layout_max        = themes_path .. "zenburn/layouts/max.png"
theme.layout_fullscreen = themes_path .. "zenburn/layouts/fullscreen.png"
theme.layout_magnifier  = themes_path .. "zenburn/layouts/magnifier.png"
theme.layout_floating   = themes_path .. "zenburn/layouts/floating.png"

-- theme.layout_tile       = themes_path .. "zenburn/layouts/tile.png"
-- theme.layout_tileleft   = themes_path .. "zenburn/layouts/tileleft.png"
-- theme.layout_tilebottom = themes_path .. "zenburn/layouts/tilebottom.png"
-- theme.layout_tiletop    = themes_path .. "zenburn/layouts/tiletop.png"
-- theme.layout_fairv      = themes_path .. "zenburn/layouts/fairv.png"
-- theme.layout_fairh      = themes_path .. "zenburn/layouts/fairh.png"
-- theme.layout_spiral     = themes_path .. "zenburn/layouts/spiral.png"
-- theme.layout_dwindle    = themes_path .. "zenburn/layouts/dwindle.png"
-- theme.layout_max        = themes_path .. "zenburn/layouts/max.png"
-- theme.layout_fullscreen = themes_path .. "zenburn/layouts/fullscreen.png"
-- theme.layout_magnifier  = themes_path .. "zenburn/layouts/magnifier.png"
-- theme.layout_floating   = themes_path .. "zenburn/layouts/floating.png"
-- theme.layout_cornernw   = themes_path .. "zenburn/layouts/cornernw.png"
-- theme.layout_cornerne   = themes_path .. "zenburn/layouts/cornerne.png"
-- theme.layout_cornersw   = themes_path .. "zenburn/layouts/cornersw.png"
-- theme.layout_cornerse   = themes_path .. "zenburn/layouts/cornerse.png"
-- 
theme.titlebar_close_button_focus  = themes_path .. "zenburn/titlebar/close_focus.png"
theme.titlebar_close_button_normal = themes_path .. "zenburn/titlebar/close_normal.png"

theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path .. "default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_focus_active  = themes_path .. "zenburn/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "zenburn/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path .. "zenburn/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = themes_path .. "zenburn/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = themes_path .. "zenburn/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "zenburn/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path .. "zenburn/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = themes_path .. "zenburn/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = themes_path .. "zenburn/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = themes_path .. "zenburn/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = themes_path .. "zenburn/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = themes_path .. "zenburn/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = themes_path .. "zenburn/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "zenburn/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path .. "zenburn/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = themes_path .. "zenburn/titlebar/maximized_normal_inactive.png"

return theme
