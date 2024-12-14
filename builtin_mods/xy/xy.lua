local xy = class()
function xy:update()
    nl.onEntityWithComponent(nl.world.main, "x", function (ent)
        print(ent.x)
    end)
end

nl.defineSystem("xy", xy)

nl.defineComponent("x", 0)
nl.defineComponent("y", 0)