ModTranslations = ModTranslations or {}

local function parseModJSON(jsonStr) -- rinky dink ass json thingy
    local data = {}
    for k, v in jsonStr:gmatch('"([^"]+)"%s*:%s*"([^"]+)"') do -- spaces are dumb
        v = v:gsub("\\n", "\n") -- I know, "don't reassign shit, it's bad oh noeees"
        data[k] = v
    end
    return data
end

function LoadModTranslations(modID, fileName)
    local lang = Translator.getLanguage():toString()
    local path = "media/lua/shared/ModTranslations/" .. lang .. "/" .. fileName .. ".json"

    local fileReader = getModFileReader(modID, path, false)
    if not fileReader and lang ~= "EN" then
        print("ModTranslations Error: No translation file found for " .. lang .. ". Defaulting to EN.")
        path = "media/lua/shared/ModTranslations/EN/" .. fileName .. ".json"
        fileReader = getModFileReader(modID, path, false)
    end

    if fileReader then
        local lines = {}
        local line = fileReader:readLine()
        while line ~= nil do
            table.insert(lines, line)
            line = fileReader:readLine()
        end
        fileReader:close()

        local content = table.concat(lines, " ")

        ModTranslations[modID] = ModTranslations[modID] or {}

        local parsedData = parseModJSON(content)
        for k, v in pairs(parsedData) do
            ModTranslations[modID][k] = v
        end
    else
        print("ModTranslations Error: Can't find jack shit at " .. path .. " for mod " .. modID)
    end
end

local function getModText(modID, key)
    if ModTranslations[modID] and ModTranslations[modID][key] then
        return ModTranslations[modID][key]
    end
    return key
end

local og_getText = getText
getText = function(arg1, arg2, ...)
    if arg2 ~= nil then
        return getModText(arg1, arg2)
    end
    return og_getText(arg1)
end
