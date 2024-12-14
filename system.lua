nl.systems = {}

function nl.defineSystem(id, class)
    nl.systems[id] = class
end

---use for systems
---@param table table usually world
---@param component string
---@param func function calls back entity
function nl.onEntityWithComponent(tbl, component, func)
    for _, t in pairs(tbl) do
        if type(t) == "table" then
            if t[component] then
                func(t)
            end
            nl.onEntityWithComponent(t, component, func)
        end
    end
end

nl.on("@update", function ()
    for name, system in pairs(nl.systems) do
        if system.update then
            system:update()
        end
    end
end)