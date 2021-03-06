function love.conf(t)
t.identity = nil
t.version = "0.10.2"
t.console = false
t.accelerometerjoystick = false
t.externalstorage = false
t.gammacorrect = false

t.window.title = "penguin game"
t.window.width = 800
t.window.height = 600
t.window.borderless = false
t.window.resizable = true
t.window.minwidth = 1
t.window.minheight = 1
t.window.fullscreen = false
t.window.fullscreentype = "desktop"
t.window.vsync = true
t.window.msaa = 1
t.window.display = 0
t.window.highdpi = false

t.modules.audio = true
t.modules.event = true
t.modules.graphics = true
t.modules.image = true
t.modules.joystick = true
t.modules.keyboard = true
t.modules.math = true
t.modules.mouse = true
t.modules.physics = true
t.modules.sound = true
t.modules.system = true
t.modules.timer = true
t.modules.touch = true
t.modules.video = true
t.modules.window = true
t.modules.thread = true


end