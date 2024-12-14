nl.systems = {}

function nl.defineSystem(id, class)
    nl.systems[id] = class
end

---use for systems
---@param table table usually world
---@param component string
---@param func function calls back entity
function nl.onEntityWithComponent(table, component, func)
    for _, t in pairs(table) do
        if type(t) == "table" then
            if t[component] then
                func(t)
            end

            -- check for nested tables
            for _, sub in pairs(t) do
                if type(sub) == "table" then
                    nl.getEntityWithComponent(sub, component)
                end
            end
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