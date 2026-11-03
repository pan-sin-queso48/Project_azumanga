-- ##################################################
-- Variables
-- ##################################################

local mainMod = "SUPER"

local terminal = "kitty"

local fileManager = "dolphin"

local browser = "zen-browser"

local home = os.getenv("HOME")
local menu = home .. "/.config/hypr/scripts/rofi_launcher.sh"

-- hola XD
-- ##################################################
-- Entrada (Teclado, Ratón y Touchpad)
-- ##################################################

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 1,
        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

-- configuracion de mi teclado español de españa
hl.device({
    name = "sigmachip-usb-keyboard",
    kb_layout = "es",
})

-- otras cosas que ya venian por defecto en el archivo original

-- See https://wiki.hypr.land/Configuring/Gestures
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Keywords/#per-device-input-configs for more
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

-- ##################################################
-- Configuración General
-- ##################################################

hl.config({
    general = {
        gaps_in = 6,
        gaps_out = 12,
        border_size = 2,

        col = {
            active_border = {
                colors = { "rgba(f7c8d9ff)", "rgba(d6c7ffff)" },
                angle = 45,
            },
            inactive_border = {
                colors = { "rgba(a2c4ecff)", "rgba(5c5470aa)" },
                angle = 10,
            },
        },

        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },
})

-- hola, mucho gusto, bienvenido a la casa de los sustos
-- ##################################################
-- Decoración
-- ##################################################

hl.config({
    decoration = {
        rounding = 15,

        active_opacity = 1.00,
        inactive_opacity = 0.96,
        fullscreen_opacity = 1.00,

        shadow = {
            enabled = true,
            range = 18,
            -- Hyprland currently accepts render_power from 1 to 4.
            render_power = 4,
            color = {
                colors = { "rgba(f7c8d9ff)", "rgba(d6c7ffff)" },
                angle = 45,
            },
        },

        blur = {
            enabled = true,
            size = 5,
            passes = 2,
            noise = 0.01,
            vibrancy = 0.15,
        },
    },
})

-- ##################################################
-- Animaciones
-- ##################################################

hl.config({
    animations = {
        enabled = true,
    },
})

-- Curva elástica: conserva el rebote de la configuración original,
-- pero hace que las ventanas terminen el movimiento de forma más suave.
hl.curve("azumanga_rebote", {
    type = "bezier",
    points = { { 0.34, 1.40 }, { 0.64, 1.00 } },
})

-- Aceleración suave para transiciones y cambios de escritorio.
hl.curve("azumanga_suave", {
    type = "bezier",
    points = { { 0.22, 1.00 }, { 0.36, 1.00 } },
})

-- Salida rápida: las ventanas desaparecen sin quedarse flotando demasiado.
hl.curve("azumanga_rapido", {
    type = "bezier",
    points = { { 0.70, 0.00 }, { 0.84, 0.00 } },
})

-- Valores globales y animaciones de ventanas.
hl.animation({
    leaf = "global",
    enabled = true,
    speed = 10,
    bezier = "azumanga_suave",
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 5.0,
    bezier = "azumanga_rebote",
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 5.5,
    bezier = "azumanga_rebote",
    style = "popin 85%",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 3.2,
    bezier = "azumanga_rapido",
    style = "popin 85%",
})

-- Bordes y transparencias con transiciones más discretas.
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 2.8,
    bezier = "azumanga_suave",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 2.5,
    bezier = "azumanga_suave",
})

hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 2.8,
    bezier = "azumanga_suave",
})

hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 2.0,
    bezier = "azumanga_rapido",
})

-- Los escritorios mantienen el desplazamiento vertical de tu configuración,
-- con un pequeño fundido para que el cambio no sea tan brusco.
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 6.0,
    bezier = "azumanga_suave",
    style = "slidefadevert 18%",
})

-- Animaciones para capas como menús y paneles.
hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 4.0,
    bezier = "azumanga_suave",
})

hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 3.8,
    bezier = "azumanga_rebote",
    style = "fade",
})

hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 2.5,
    bezier = "azumanga_rapido",
    style = "fade",
})

-- Ahora sí están más flipantes
-- asi esta mejor
-- ##################################################
-- Layouts
-- ##################################################

hl.config({
    dwindle = {
        -- pseudotile = true -- ya no funciona para las versiones nuevas
        preserve_split = true,
        smart_split = false,
        smart_resizing = true,
    },

    master = {
        new_status = "master",
        mfact = 0.55,
    },
})

-- ni idea que sea esto pero solo puse lo que ya estaba en el archivo original XD
-- ##################################################
-- Atajos de teclado
-- ##################################################

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("steam"))

-- cerrar ventana
hl.bind(mainMod .. " + C", hl.dsp.window.close())

-- pantalla completa
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))

-- ventana flotante
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

-- menu de apagado o powermenu
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/p.sh"))
-- hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/rofi_powermenu.sh"))

-- salir de Hyprland
-- hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exit())

-- un menu mejor que hyprlauncher
-- hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/rofi_launcher.sh"))

-- menu para multimedia
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/m.sh"))

-- recargar configuración
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))

-- tomar capturas
hl.bind("Print", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/para_tomar_capturas_con_grim.sh"))

-- para abrir dolphin en HOME
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("dolphin ~"))

-- alternar las ventanas a horizontal o vertical
-- Para Hyprland 0.55+: layoutmsg se expresa mediante hl.dsp.layout().
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- para apagar
-- hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("systemctl poweroff")) -- queda comentada porque ya le hice un menu con rofi

-- para abrir kate. kate >>> nano
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("kate"))

-- para reproducir musica de mi playlist
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("playlist.sh"))

-- para la otra playlist
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd("algo.sh"))

-- para ver azumanga daioh
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("azu.sh"))

-- para la siguiente cancion
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("playerctl --player=mpv next"))

-- para la anterior cancion
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("playerctl --player=mpv previous"))

-- para ponerle play o pausa
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("playerctl --player=mpv play-pause"))

-- para matar mpv
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("pkill mpv"))

-- menu de swaync
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t"))

-- seleccionar colores
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("hyprpicker -n -a"))

-- para los escritorios
for i = 1, 10 do
    local key = tostring(i % 10) -- 10 maps to 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
end

-- para mover ventanas a los escritorios
for i = 1, 10 do
    local key = tostring(i % 10) -- 10 maps to 0
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- mover el foco de las ventanas
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- cosas para mover o cambiar de tamaño
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- ##################################################
-- Autostart
-- ##################################################

-- aplicaciones que se inicien al entrar a Hyprland
hl.on("hyprland.start", function()
    hl.exec_cmd("kdeconnectd")
    hl.exec_cmd("/usr/libexec/xdg-desktop-portal-hyprland")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("bash " .. home .. "/.config/hypr/cambiar_fondo.sh")
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
end)

-- ##################################################
-- Variables de entorno
-- ##################################################

-- tampoco se para que es esto
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("QT_QPA_PLATFORM", "wayland")

-- Wayland para Firefox/Zen
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- Chromium y derivados
hl.env("OZONE_PLATFORM", "wayland")

-- Cursor
hl.env("XCURSOR_SIZE", "24")
