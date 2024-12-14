nl.entities = {}

function nl.defineEntity(name, entityType)
    for name, component in pairs(entityType) do
        if nl.components[name] then
            -- group them??
        end
    end
    nl.entities[name] = entityType
end


--should this be handled here?

function nl.spawnEntity(list, entity, components)
    components = components or {}
    for key, component in pairs(components) do
        entity[key] = component
    end
    table.insert(list, entity)
end