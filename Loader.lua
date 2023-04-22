repeat wait() until game:IsLoaded() 
local function betterisfile(path)
    local suc, err = pcall(function()
        readfile(path)
    end)
    return suc
end
local function getfile(path)
    if betterisfile("azura/"..path) then
        return readfile("azura/"..path)
    else
        return ""
    end
end

key = "";

if not _G.wl_key then
    warn("Key not found, please enter key")
else
    key = _G.wl_key
end

if not isfolder("azura") then
    makefolder("azura")
end
   if not isfolder("azura/Config") then
        makefolder("azura/Config")
    end
if not isfolder("azura/Scripts") then
    makefolder("azura/Scripts")
end

queueontp = queue_on_teleport or syn.queue_on_teleport or fluxus.queue_on_teleport or print("no teleport func")

local azura = {}
azura["betterisfile"] = betterisfile
azura["getfile"] = getfile
azura["version"] = "v1.0"
shared["azura"] = azura
local suc, err = pcall(function()
    local gameids = {6872274481, 8560631822, 8444591321}
    local GameSave = ""
    local PlaceId = game.PlaceId
    if table.find(gameids, PlaceId) then
        GameSave = "BedWarsGame"
    elseif PlaceId == 6872265039 then
        GameSave = "BedWarsLobby"
    elseif PlaceId == 606849621 then
        GameSave = "Jailbreak"
    elseif PlaceId == 142823291 then
        GameSave = "mm2"
    end
       if not isfolder("azura/Config/"..GameSave) then
        makefolder("azura/Config/"..GameSave)
    end
    if not isfolder("azura/Scripts/"..GameSave) then
        makefolder("azura/Scripts/"..GameSave)
    end
    shared["azuragame"] = GameSave    
    queueontp([[
        _G.wl_key = "]]..key..[["
        repeat wait() until game:IsLoaded() 

        loadstring(game:HttpGet("https://raw.githubusercontent.com/409080586020275198131518482925150672705/jfewiuf8euf03ur89uwe8rufuw3yhfujeu3h8f/main/Loader.lua"))()
    ]])
    loadstring(game:HttpGet("https://raw.githubusercontent.com/409080586020275198131518482925150672705/jfewiuf8euf03ur89uwe8rufuw3yhfujeu3h8f/main/Modules/"..GameSave..".lua"))()
    end)
