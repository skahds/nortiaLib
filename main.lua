nl = {}

require('broadcast')
require('class')
require('component')
require('system')
require('entity')
require('modLoading')

function love.load()
    nl.call("@load")

end

function love.update(dt)
    nl.call("@update")
    nl.updateStorage("dt", dt)
end

function love.draw()
    nl.call("@renderer:render")
    --later on will be used:
    nl.call("@renderer:renderOutsideCamera")
end

function love.keyreleased(key)
    nl.call("@keyreleased", key)
end

function love.mousereleased(x, y, button)
    nl.call("@mouse:released", button)
end