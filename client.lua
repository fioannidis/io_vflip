RegisterCommand(Config.CommandName, function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    if vehicle ~= 0 then
        local pitch, roll, yaw = table.unpack(GetEntityRotation(vehicle, 2))
        if roll > 90.0 or roll < -90.0 then
            SetEntityRotation(vehicle, pitch, 0.0, yaw, 2, true)
            TriggerEvent('chat:addMessage', { args = { "^2Vehicle flipped successfully." } })
        else
            TriggerEvent('chat:addMessage', { args = { "^1Your vehicle is not upside down." } })
        end
    else
        TriggerEvent('chat:addMessage', { args = { "^1You must be inside a vehicle to use this command." } })
    end
end, false)