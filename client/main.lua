local QBCore = exports['qb-core']:GetCoreObject()

local amount = 1

--spawn the ped
CreateThread(function()
	while true do
		Wait(1000)
		for k, v in pairs(Config.PedLocations) do
			local pos = GetEntityCoords(PlayerPedId())	
			local dist = #(pos - vector3(v.coords.x, v.coords.y, v.coords.z))
			
			if dist < 40 and not pedspawned then
				TriggerEvent('denali-gym:spawn:ped', v.coords)
				pedspawned = true
			end
			if dist >= 35 then
				pedspawned = false
				DeletePed(GymPed)
			end
		end
	end
end)

RegisterNetEvent('denali-gym:spawn:ped')
AddEventHandler('denali-gym:spawn:ped',function(coords)
	local hash = `a_m_y_musclbeac_01`

	RequestModel(hash)
	while not HasModelLoaded(hash) do 
		Wait(10)
	end

        pedspawned = true
        GymPed = CreatePed(5, hash, coords.x, coords.y, coords.z - 1.0, coords.w, false, false)
        FreezeEntityPosition(GymPed, true)
        SetBlockingOfNonTemporaryEvents(GymPed, true)
        TaskStartScenarioInPlace(GymPed, "WORLD_HUMAN_STAND_MOBILE_UPRIGHT", 0, true) 
end)

--- qb-target --- correct call
exports['qb-target']:AddTargetModel(`a_m_y_musclbeac_01`, {
	options = {
		{
			event = "denali-gym:shop",
			icon = "fab fa-speakap",
			label = "Open Front Desk",
		},
	},
distance = 2.5 
})

exports['qb-target']:AddBoxZone("pump", vector3(-1264.8, -354.76, 36.96), 6.45, 3.35, {
	name = "pump",
	heading = 300.0,
	debugPoly = false,
	minZ = 30.77834,
	maxZ = 40.87834,
}, {
	options = {
		{
            type = "client",
            event = "denali-gym:free",
			icon = "fas fa-sign-in-alt",
			label = "Pump Weights",
		},
	},
	distance = 2.5
})

exports['qb-target']:AddBoxZone("hang", vector3(-1271.4, -359.38, 36.96), 3.45, 3.35, {
	name = "hang",
	heading = 85,
	debugPoly = false,
	minZ = 30.77834,
	maxZ = 40.87834,
}, {
	options = {
		{
            type = "client",
            event = "denali-gym:bars",
			icon = "fas fa-sign-in-alt",
			label = "Do Pullups",
		},
	},
	distance = 2.5
})

exports['qb-target']:AddBoxZone("weights", vector3(-1268.78, -364.09, 36.96), 6.45, 4.35, {
	name = "weights",
	heading = 30.0,
	debugPoly = false,
	minZ = 30.77834,
	maxZ = 40.87834,
}, {
	options = {
		{
            type = "client",
            event = "denali-gym:rack",
			icon = "fas fa-sign-in-alt",
			label = "Lift Weights",
		},
	},
	distance = 2.5
})

exports['qb-target']:AddBoxZone("treadmill", vector3(-1260.7, -368.82, 36.99), 10.45, 3.35, {
	name = "treadmill",
	heading = 300.0,
	debugPoly = false,
	minZ = 30.77834,
	maxZ = 40.87834,
}, {
	options = {
		{
            type = "client",
            event = "denali-gym:run",
			icon = "fas fa-sign-in-alt",
			label = "Run on Treadmill",
		},
	},
	distance = 2.5
})

exports['qb-target']:AddBoxZone("yoga", vector3(-1262.47, -361.08, 36.96), 5.45, 5.35, {
	name = "yoga",
	heading = 30.0,
	debugPoly = false,
	minZ = 30.77834,
	maxZ = 40.87834,
}, {
	options = {
		{
            type = "client",
            event = "denali-gym:mat",
			icon = "fas fa-sign-in-alt",
			label = "Do Yoga",
		},
	},
	distance = 2.5
})

exports['qb-target']:AddBoxZone("core", vector3(-1258.46, -357.53, 36.99), 3.45, 3.35, {
	name = "core",
	heading = 25.0,
	debugPoly = false,
	minZ = 30.77834,
	maxZ = 40.87834,
}, {
	options = {
		{
            type = "client",
            event = "denali-gym:work",
			icon = "fas fa-sign-in-alt",
			label = "Do Chinups",
		},
	},
	distance = 2.5
})

-----new, completely new
QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('denali-gym:yoga')
AddEventHandler('denali-gym:yoga',function() 
	QBCore.Functions.TriggerCallback("QBCore:HasItem", function(data) 
		if data then 
			Yoga()
		else 
			QBCore.Functions.Notify("You dont have a membership pass", "error")
		end 
	end, "gym_membership")
end)

RegisterNetEvent('denali-gym:treadmill')
AddEventHandler('denali-gym:treadmill',function() 
	QBCore.Functions.TriggerCallback("QBCore:HasItem", function(data) 
		if data then 
			Treadmill()
		else 
			QBCore.Functions.Notify("You dont have a membership pass", "error")
		end 
	end, "gym_membership")
end)

RegisterNetEvent('denali-gym:weights')
AddEventHandler('denali-gym:weights',function() 
	QBCore.Functions.TriggerCallback("QBCore:HasItem", function(data) 
		if data then 
			Weights()
		else 
			QBCore.Functions.Notify("You dont have a membership pass", "error")
		end 
	end, "gym_membership")
end)

RegisterNetEvent('denali-gym:core')
AddEventHandler('denali-gym:core',function() 
	QBCore.Functions.TriggerCallback("QBCore:HasItem", function(data) 
		if data then 
			Core()
		else 
			QBCore.Functions.Notify("You dont have a membership pass", "error")
		end 
	end, "gym_membership")
end)

RegisterNetEvent('denali-gym:hang')
AddEventHandler('denali-gym:hang',function() 
	QBCore.Functions.TriggerCallback("QBCore:HasItem", function(data) 
		if data then 
			Hang()
		else 
			QBCore.Functions.Notify("You dont have a membership pass", "error")
		end 
	end, "gym_membership")
end)

RegisterNetEvent('denali-gym:pump')
AddEventHandler('denali-gym:pump',function() 
	QBCore.Functions.TriggerCallback("QBCore:HasItem", function(data) 
		if data then 
			Pump()
		else 
			QBCore.Functions.Notify("You dont have a membership pass", "error")
		end 
	end, "gym_membership")
end)

----shop
RegisterNetEvent('denali-gym:shop')
AddEventHandler('denali-gym:shop',function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "gym", Config.Items)
end)

Citizen.CreateThread(function()
    local label = 'Gym'
    blip = AddBlipForCoord(Config.Location.x, Config.Location.y, Config.Location.z)
    SetBlipSprite(blip, 311)
    SetBlipAsShortRange(blip, true)
    SetBlipScale(blip, 0.8)
    SetBlipColour(blip, 7)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(label)
    EndTextCommandSetBlipName(blip)
end)


-----functions
function Yoga()
    QBCore.Functions.Progressbar('doing_yoga', 'Doing Yoga', 10000, false, false, {
        disableMovement = true, --
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "missfam5_yoga",
        anim = "i_yogapose_a",
        flag = 8,
    }, {}, {}, function() 
        QBCore.Functions.Notify("Work out completed", "success")  
        ClearPedTasks(PlayerPedId())
		exports['ps-buffs']:StaminaBuffEffect(100000, 1.2)
		exports['ps-buffs']:AddStressBuff(40000, 5)
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        QBCore.Functions.Notify("Just Breathe First..", "error") 
    end)
end

function Treadmill()
    QBCore.Functions.Progressbar('doing_running', 'Running on Treadmill', 10000, false, false, {
        disableMovement = true, --
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@triathlon",
        anim = "jog_idle_e",
        flags = 8,
    }, {}, {}, function() 
        QBCore.Functions.Notify("Work out completed", "success") 
        ClearPedTasks(PlayerPedId())
		exports['ps-buffs']:StaminaBuffEffect(300000, 1.2)
		exports['ps-buffs']:AddStressBuff(40000, 5)
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        QBCore.Functions.Notify("Just Breathe First..", "error") 
    end)
end

function Weights()
    QBCore.Functions.Progressbar('doing_weights', 'Lifting Weights', 10000, false, false, {
        disableMovement = true, --
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, 
    {
        animDict = "amb@world_human_muscle_free_weights@male@barbell@base",
        anim = "base",
        flags = 8,
    }, {}, {}, function() 
        QBCore.Functions.Notify("Work out completed", "success")  
        ClearPedTasks(PlayerPedId())
		exports['ps-buffs']:AddHealthBuff(20000, 10)
		exports['ps-buffs']:AddStressBuff(60000, 5)
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        QBCore.Functions.Notify("Just Breathe First..", "error")  
    end)
end

function Core()
    QBCore.Functions.Progressbar('doing_core', 'Doing Chin-ups', 10000, false, false, {
        disableMovement = true, --
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "amb@prop_human_muscle_chin_ups@male@base",
        anim = "base",
        flags = 8,
    }, {}, {}, function()  
		QBCore.Functions.Notify("Work out completed", "success") 
        ClearPedTasks(PlayerPedId())
		exports['ps-buffs']:AddHealthBuff(40000, 10)
		exports['ps-buffs']:StaminaBuffEffect(60000, 1.2)
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        QBCore.Functions.Notify("Just Breathe First..", "error")  
    end)
end

function Hang()
    QBCore.Functions.Progressbar('doing_hang', 'Doing Pullups', 10000, false, false, {
        disableMovement = true, --
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "amb@prop_human_muscle_chin_ups@male@base",
        anim = "base",
        flags = 8,
    }, {}, {}, function()  
        QBCore.Functions.Notify("Work out completed", "success")  
        ClearPedTasks(PlayerPedId())
		exports['ps-buffs']:AddArmorBuff(60000, 5)
		exports['ps-buffs']:StaminaBuffEffect(80000, 1.2)
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        QBCore.Functions.Notify("Just Breathe First..", "error")  
    end)
end

function Pump()
    QBCore.Functions.Progressbar('doing_pump', 'Pumping Weights', 10000, false, false, {
        disableMovement = true, --
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "amb@world_human_muscle_free_weights@male@barbell@base",
        anim = "base",
        flags = 8,
    }, {}, {}, function()  
		QBCore.Functions.Notify("Work out completed", "success")
		ClearPedTasks(PlayerPedId()) 
		exports['ps-buffs']:AddHealthBuff(20000, 5)
		exports['ps-buffs']:StaminaBuffEffect(80000, 1.2)
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        QBCore.Functions.Notify("Just Breathe First..", "error") 
    end)
end


---menu/utils
RegisterNetEvent('denali-gym:mat', function()
    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Mat Work",
            txt = "Work Out",
            params = {
				type = "client", 
                event = "denali-gym:yoga",
                args = {
                    number = 1,
                    id = 1
                }
            }
        },
    })
end)

RegisterNetEvent('denali-gym:run', function()
    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Treadmill",
            txt = "Work Out",
            params = {
				type = "client",
                event = "denali-gym:treadmill",
                args = {
                    number = 1,
                    id = 1
                }
            }
        },
    })
end)

RegisterNetEvent('denali-gym:rack', function()
    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Pump Iron",
            txt = "Work Out",
            params = {
				type = "client",
                event = "denali-gym:weights",
                args = {
                    number = 1,
                    id = 1
                }
            }
        },
    })
end)

RegisterNetEvent('denali-gym:work', function()
    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Chin Ups",
            txt = "Work Out",
            params = {
				type = "client",
                event = "denali-gym:core",
                args = {
                    number = 1,
                    id = 1
                }
            }
        },
    })
end)

RegisterNetEvent('denali-gym:bars', function()
    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Pull Ups",
            txt = "Work Out",
            params = {
				type = "client",
                event = "denali-gym:hang",
                args = {
                    number = 1,
                    id = 1
                }
            }
        },
    })
end)

RegisterNetEvent('denali-gym:free', function()
    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Free Weights",
            txt = "Work Out",
            params = {
				type = "client",
                event = "denali-gym:pump",
                args = {
                    number = 1,
                    id = 1
                }
            }
        },
    })
end)

