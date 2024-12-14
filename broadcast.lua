unpack = table.unpack or unpack

nl.events = {}
nl.storage = {}

---calls all event
---@param event string
---@param ... any
function nl.call(event, ...)
    if nl.events[event] then
        for i, func in ipairs(nl.events[event]) do
            func(...)
        end
    end
end

---gets called by event
---@param event string
---@param func function
function nl.on(event, func)
    if not nl.events[event] then
        nl.events[event] = {}
    end
    table.insert(nl.events[event], func)
end

---gets from nl.storage
---@param name string
---@return unknown
function nl.get(name)
    return nl.storage[name]
end

---updates nl.storage
---@param name string
---@param newVar any
function nl.updateStorage(name, newVar)
    nl.storage[name] = newVar
end