Config = {}

Config.Location = vector4(-1251.83, -355.61, 36.96, 293.84) --Blip Location
Config.PedLocations = {{coords = vector4(-1255.53, -354.77, 36.96, 293.84)}} --Where the ped is

Config.Items = {
    label = "Gym Membership",
    slots = 20,
    items = { 
        [1] = {
            name = 'gym_membership',
            price = 500, 
            amount = 100,
            info = {},
            type = 'item',
            slot = 1,
        },
        [2] = {
            name = "water_bottle",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
    },
}
