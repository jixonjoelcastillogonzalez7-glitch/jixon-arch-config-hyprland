-- ============================================================
-- CONFIGURACIÓN PERSONAL DE HYPRLAND
-- Arch Linux + Hyprland
-- ============================================================
--
-- Esta configuración está escrita en Lua.
-- Para consultar todas las opciones disponibles:
-- https://wiki.hypr.land/Configuring/Start/
--
-- La configuración puede dividirse en varios archivos Lua
-- si en el futuro quieres organizarla todavía más.
-- ============================================================


------------------
---- MONITORES ----
------------------

-- Configuración de la pantalla interna de la laptop.
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@60",
    position = "auto",
    scale    = "1",
})


---------------------
---- PROGRAMAS ----
---------------------

-- Programas principales utilizados en Hyprland.
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "fuzzel"


-------------------
---- AUTOINICIO ----
-------------------

-- Programas y configuraciones que se ejecutan
-- automáticamente cuando inicia Hyprland.
hl.on("hyprland.start", function ()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")

    -- Preferir tema oscuro para aplicaciones GTK.
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
end)


-------------------------------
---- VARIABLES DE ENTORNO ----
-------------------------------

-- Tamaño del cursor.
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


-----------------------
---- PERMISOS ----
-----------------------

-- Los cambios de permisos requieren reiniciar Hyprland.
-- Estas opciones están desactivadas actualmente.

-- hl.config({
--     ecosystem = {
--         enforce_permissions = true,
--     },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- APARIENCIA ----
-----------------------

hl.config({
    general = {
        -- Espacio entre ventanas.
        gaps_in  = 5,
        gaps_out = 20,

        -- Grosor del borde.
        border_size = 2,

        -- Colores de los bordes.
        col = {
            active_border   = {
                colors = {"rgba(33ccffee)", "rgba(00ff99ee)"},
                angle = 45
            },

            inactive_border = "rgba(595959aa)",
        },

        -- Permite cambiar el tamaño de las ventanas
        -- haciendo clic y arrastrando sus bordes.
        resize_on_border = true,

        -- Aumenta el área donde se puede agarrar el borde.
        extend_border_grab_area = 10,

        -- Muestra el cursor de redimensionamiento
        -- cuando se coloca sobre un borde.
        hover_icon_on_border = true,

        -- Desactiva el tearing.
        allow_tearing = false,

        -- Diseño de ventanas.
        layout = "dwindle",
    },


    decoration = {
        -- Esquinas redondeadas.
        rounding       = 10,
        rounding_power = 2,

        -- Opacidad general de las ventanas.
        -- Las ventanas específicas pueden tener
        -- una transparencia diferente mediante reglas.
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        -- Sombras.
        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        -- Desenfoque.
        blur = {
            enabled   = true,
            size      = 6,
            passes    = 2,
            vibrancy  = 0.1696,
        },
    },


    -- Animaciones generales.
    animations = {
        enabled = true,
    },
})


-----------------------
---- ANIMACIONES ----
-----------------------

-- Curvas de animación.
hl.curve("easeOutQuint", {
    type = "bezier",
    points = {
        {0.23, 1},
        {0.32, 1}
    }
})

hl.curve("easeInOutCubic", {
    type = "bezier",
    points = {
        {0.65, 0.05},
        {0.36, 1}
    }
})

hl.curve("linear", {
    type = "bezier",
    points = {
        {0, 0},
        {1, 1}
    }
})

hl.curve("almostLinear", {
    type = "bezier",
    points = {
        {0.5, 0.5},
        {0.75, 1}
    }
})

hl.curve("quick", {
    type = "bezier",
    points = {
        {0.15, 0},
        {0.1, 1}
    }
})


-- Animación tipo resorte.
hl.curve("easy", {
    type = "spring",
    mass = 1,
    stiffness = 238.1191,
    dampening = 24.21279333
})


-- Animaciones de Hyprland.
hl.animation({
    leaf = "global",
    enabled = true,
    speed = 10,
    bezier = "default"
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 5.39,
    bezier = "easeOutQuint"
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 4.79,
    spring = "easy"
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 4.1,
    spring = "easy",
    style = "popin 87%"
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 1.49,
    bezier = "linear",
    style = "popin 87%"
})

hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 1.73,
    bezier = "almostLinear"
})

hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 1.46,
    bezier = "almostLinear"
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3.03,
    bezier = "quick"
})

hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 3.81,
    bezier = "easeOutQuint"
})

hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuint",
    style = "fade"
})

hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 1.5,
    bezier = "linear",
    style = "fade"
})

hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 1.79,
    bezier = "almostLinear"
})

hl.animation({
    leaf = "fadeLayersOut",
    enabled = true,
    speed = 1.39,
    bezier = "almostLinear"
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 1.94,
    bezier = "almostLinear",
    style = "fade"
})

hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 1.21,
    bezier = "almostLinear",
    style = "fade"
})

hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 1.94,
    bezier = "almostLinear",
    style = "fade"
})

hl.animation({
    leaf = "zoomFactor",
    enabled = true,
    speed = 7,
    bezier = "quick"
})


-----------------------
---- DISEÑO DWINDLE ----
-----------------------

-- Mantiene la división de ventanas.
hl.config({
    dwindle = {
        preserve_split = true,
    },
})


-----------------------
---- DISEÑO MASTER ----
-----------------------

hl.config({
    master = {
        new_status = "master",
    },
})


--------------------------
---- DISEÑO SCROLLING ----
--------------------------

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})


----------------
---- VARIOS ----
----------------

hl.config({
    misc = {
        -- Mantiene el fondo de pantalla predeterminado de Hyprland.
        force_default_wallpaper = -1,

        -- Mantiene disponible el logo/fondo predeterminado.
        disable_hyprland_logo = false,
    },
})


---------------
---- ENTRADA ----
---------------

hl.config({
    input = {
        -- Teclado latinoamericano.
        kb_layout  = "latam",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        -- El cursor sigue al mouse.
        follow_mouse = 1,

        -- Sensibilidad normal.
        sensitivity = 0,

        -- Configuración del touchpad.
        touchpad = {
            natural_scroll = false,
        },
    },
})


-------------------------
---- GESTOS DEL TOUCHPAD ----
-------------------------

-- Tres dedos horizontalmente para cambiar de espacio de trabajo.
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})


-------------------------
---- DISPOSITIVOS ----
-------------------------

-- Ejemplo de configuración individual de un dispositivo.
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


---------------------
---- ATAJOS ----
---------------------

-- Tecla principal: SUPER / tecla Windows.
local mainMod = "SUPER"


-- Terminal.
hl.bind(
    mainMod .. " + Q",
    hl.dsp.exec_cmd(terminal)
)


-- Cerrar ventana.
local closeWindowBind = hl.bind(
    mainMod .. " + C",
    hl.dsp.window.close()
)


-- Reiniciar el equipo.
hl.bind(
    mainMod .. " + M",
    hl.dsp.exec_cmd("systemctl reboot")
)


-- Administrador de archivos.
hl.bind(
    mainMod .. " + E",
    hl.dsp.exec_cmd(fileManager)
)


-- Cambiar entre ventana flotante y normal.
hl.bind(
    mainMod .. " + V",
    hl.dsp.window.float({ action = "toggle" })
)


-- Lanzador de aplicaciones.
hl.bind(
    mainMod .. " + R",
    hl.dsp.exec_cmd(menu)
)


-- Pseudo ventana.
hl.bind(
    mainMod .. " + P",
    hl.dsp.window.pseudo()
)


-- Cambiar división de ventanas.
hl.bind(
    mainMod .. " + J",
    hl.dsp.layout("togglesplit")
)


-- Pantalla completa.
hl.bind(
    mainMod .. " + F",
    hl.dsp.window.fullscreen()
)


-- Bloquear pantalla.
hl.bind(
    mainMod .. " + L",
    hl.dsp.exec_cmd("hyprlock")
)


-- Apagar el equipo.
hl.bind(
    mainMod .. " + SHIFT + M",
    hl.dsp.exec_cmd("systemctl poweroff")
)


-------------------------
---- CAMBIO DE FOCO ----
-------------------------

-- Mover el foco con SUPER + flechas.
hl.bind(
    mainMod .. " + left",
    hl.dsp.focus({ direction = "left" })
)

hl.bind(
    mainMod .. " + right",
    hl.dsp.focus({ direction = "right" })
)

hl.bind(
    mainMod .. " + up",
    hl.dsp.focus({ direction = "up" })
)

hl.bind(
    mainMod .. " + down",
    hl.dsp.focus({ direction = "down" })
)


-------------------------
---- ESPACIOS DE TRABAJO ----
-------------------------

-- SUPER + número cambia de espacio.
-- SUPER + SHIFT + número mueve la ventana.
for i = 1, 10 do
    local key = i % 10

    hl.bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i })
    )

    hl.bind(
        mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i })
    )
end


-------------------------
---- ESPACIO ESPECIAL ----
-------------------------

-- Scratchpad / espacio especial.
hl.bind(
    mainMod .. " + S",
    hl.dsp.workspace.toggle_special("magic")
)

hl.bind(
    mainMod .. " + SHIFT + S",
    hl.dsp.window.move({
        workspace = "special:magic"
    })
)


-------------------------
---- DESPLAZAMIENTO ----
-------------------------

-- Cambiar de espacio usando la rueda del mouse.
hl.bind(
    mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e+1" })
)

hl.bind(
    mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e-1" })
)


-------------------------
---- MOVER / REDIMENSIONAR ----
-------------------------

-- SUPER + clic izquierdo + arrastrar = mover ventana.
hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

-- SUPER + clic derecho + arrastrar = redimensionar.
hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)


-------------------------
---- TECLAS MULTIMEDIA ----
-------------------------

-- Subir volumen.
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
    ),
    {
        locked = true,
        repeating = true
    }
)


-- Bajar volumen.
hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ),
    {
        locked = true,
        repeating = true
    }
)


-- Silenciar / activar sonido.
hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ),
    {
        locked = true,
        repeating = true
    }
)


-- Silenciar / activar micrófono.
hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ),
    {
        locked = true,
        repeating = true
    }
)


-- Aumentar brillo.
hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd(
        "brightnessctl -e4 -n2 set 5%+"
    ),
    {
        locked = true,
        repeating = true
    }
)


-- Disminuir brillo.
hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd(
        "brightnessctl -e4 -n2 set 5%-"
    ),
    {
        locked = true,
        repeating = true
    }
)


-------------------------
---- CONTROL MULTIMEDIA ----
-------------------------

-- Siguiente canción.
hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    {
        locked = true
    }
)


-- Pausar / reproducir.
hl.bind(
    "XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"),
    {
        locked = true
    }
)


-- Reproducir / pausar.
hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    {
        locked = true
    }
)


-- Canción anterior.
hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    {
        locked = true
    }
)


--------------------------------
---- REGLAS DE VENTANAS ----
--------------------------------

-- Reglas generales de ventanas.


-- Evita que las aplicaciones puedan cambiar
-- automáticamente el estado maximizado.
local suppressMaximizeRule = hl.window_rule({
    name = "suppress-maximize-events",

    match = {
        class = ".*"
    },

    suppress_event = "maximize",
})


--------------------------------
---- CORRECCIÓN XWAYLAND ----
--------------------------------

-- Corrige algunos problemas de arrastre
-- relacionados con aplicaciones XWayland.
hl.window_rule({
    name = "fix-xwayland-drags",

    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})


--------------------------------
---- HYPRLAND-RUN ----
--------------------------------

-- Coloca Hyprland-run como ventana flotante.
hl.window_rule({
    name = "move-hyprland-run",

    match = {
        class = "hyprland-run"
    },

    move  = "20 monitor_h-120",
    float = true,
})


--------------------------------
---- TRANSPARENCIA DOLPHIN ----
--------------------------------

-- Dolphin con transparencia.
hl.window_rule({
    name = "dolphin-transparency",

    match = {
        class = "org.kde.dolphin"
    },

    opacity = "0.75 override 0.75 override",
})


--------------------------------
---- TRANSPARENCIA FIREFOX ----
--------------------------------

-- Firefox con transparencia.
hl.window_rule({
    name = "firefox-transparency",

    match = {
        class = "firefox"
    },

    opacity = "0.75 override 0.75 override 0.97 override",
})


--------------------------------
---- WI-FI ----
--------------------------------

-- Ventana gráfica de Network Manager.
--
-- La clase real de nmgui en este sistema es:
-- com.network.manager
--
-- Se fuerza como ventana flotante y con transparencia.
hl.window_rule({
    name = "wifi-transparency",

    match = {
        class = "com.network.manager"
    },

    opacity = "0.90 override 0.90 override",
    float = true,
})


--------------------------------
---- BLUETOOTH ----
--------------------------------

-- Administrador gráfico de Bluetooth.
--
-- La clase real de Blueman es:
-- blueman-manager
--
-- Se fuerza como ventana flotante y con transparencia.
hl.window_rule({
    name = "bluetooth-transparency",

    match = {
        class = "blueman-manager"
    },

    opacity = "0.90 override 0.90 override",
    float = true,
})
