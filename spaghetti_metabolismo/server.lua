--[[ local VorpCore = {}
local _source = source
local users = VORP.getCharacter(_source)
VORP = exports.vorp_core:vorpAPI()

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

--Server Side
RegisterCommand("heal", function(id)
  
local User = VorpCore.getUser(source) -- Return User with functions and all characters
local group = User.getGroup -- Return user group (not character group)

  if group == "admin" then
  TriggerEvent("boss:heal", id)
  else return false
  end

end)

RegisterNetEvent('boss:heal')
AddEventHandler('boss:heal', function(users)
    local health = GetAttributeCoreValue(users, 0)
    local newHealth = health + 50
    local stamina = GetAttributeCoreValue(users, 1)
    local newStamina = stamina + 50
    local health2 = GetEntityHealth(users)
    local newHealth2 = health2 + 50
    Citizen.InvokeNative(0xC6258F41D86676E0, users, 0, newHealth) --core
    Citizen.InvokeNative(0xC6258F41D86676E0, users, 1, newStamina) --core
    TriggerClientEvent("srp:drink", 100)
    TriggerClientEvent("srp:eat", 100)
    SetEntityHealth(users, newHealth2)
end) ]]