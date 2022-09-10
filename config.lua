Config = {}

Config.Debug = false -- for developer only

-- Notification Type -- 
-- Note: If you want to edit --> shared/cl_notify.lua and shared/sv_notify.lua
Config.NotificationType = { -- ['mythic_notify_default', 'mythic_notify_old', 'ox_lib', 't-notify', 'col_notify', 'Roda_Notifications' 'esx_notify', 'default-esx', 'col_notify_new', 'okokNotify', 'custom']
    client = 'ox_lib',
    server = 'ox_lib'
}

Config.DoorOption = {
    job = 'mechanic', 
    FixDoorCommand = 'fixdoor'
}

Config.MaxTenantSlot = 3
Config.MaxOwnedUnit = 3
Config.MaxCoOwnerKey = 2

Config.ChangeDoorLockPrice    = 1000
Config.DefaultRentPrice       = 150
Config.MinRentPrice           = 500
Config.MaxRentPrice           = 2500
Config.InitialRentPrice       = 1000

Config.MotelBlips = {
    ["PinkCage"] = {
        name = "Pink Cage Motel",
        mapBlip = {x = 316.59, y = -234.01, z = 53.97, color = 0, sprite = 475, size = 0.8}
    },
	
    ["PerreraBeach"] = {
        name = "Perrera Beach Motel",
        mapBlip = {x = -1499.34, y = -682.39, z = 27.75, color = 0, sprite = 475, size = 0.8}
    },    
	
	["PaletoForest"] = {
        name = "Paleto Forest Motel",
        mapBlip = {x = -713.65, y = 5781.21, z = 17.58, color = 0, sprite = 475, size = 0.8}
    }, 
	
	["Starlite"] = {
        name = "Starlite Motel",
        mapBlip = {x = 968.69, y = -187.63, z = 72.86, color = 0, sprite = 475, size = 0.8}
    }, 
	
	["SandyShore"] = {
        name = "Sandy Shore Motel",
        mapBlip = {x = 1124.51, y = 2674.83, z = 38.30, color = 0, sprite = 475, size = 0.8}
    },
	
	["Crastenburg"] = {
        name = "Crastenburg Motel",
        mapBlip = {x = 506.92, y = 214.33, z = 106.34, color = 0, sprite = 475, size = 0.8}
    }
	
}
 
Config.Motels = {
    -- Pink Cage Motels
    ["pcunit1"] = {
        unit_price = 500000,
        unit_name = 'PC Motel Unit #1',
        menu_pos = vec3(307.63, -213.36, 54.22),
        menu_text = '[H] Pinkcage Unit #1',
        unit_stash = vec3(306.86, -208.54, 54.23),
        unit_bedstash = vec3(309.05, -204.85, 54.23),
        unit_closet = vec3(302.57, -207.33, 54.23)
    },

    ["pcunit2"] = {
        unit_price = 500000,
        unit_name = 'PC Motel Unit #2',
        menu_pos = vec3(311.36, -203.38, 54.22),
        menu_text = '[H] Pinkcage Unit #2',
        unit_stash = vec3(310.65, -198.66, 54.23),
        unit_bedstash = vec3(312.78, -194.82, 54.23),
        unit_closet = vec3(306.26, -197.38, 54.23)
    },

    ["pcunit3"] = {
        unit_price = 500000,
        unit_name = 'PC Motel Unit #3',
        menu_pos = vec3(315.77, -194.91, 54.23),
        menu_text = '[H] Pinkcage Unit #3',
        unit_stash = vec3(320.52, -194.18, 54.23),
        unit_bedstash = vec3(324.26, -196.35, 54.23),
        unit_closet = vec3(321.75, -189.78, 54.23)
    },

    ["pcunit4"] = {
        unit_price = 500000,
        unit_name = 'PC Motel Unit #4',
        menu_pos = vec3(314.87, -219.59, 58.02),
        menu_text = '[H] Pinkcage Unit #4',
        unit_stash = vec3(310.19, -220.31, 58.02),
        unit_bedstash = vec3(306.38, -218.16, 58.02),
        unit_closet = vec3(308.84, -224.69, 58.02)
    },

    ["pcunit5"] = {
        unit_price = 500000,
        unit_name = 'PC Motel Unit #5',
        menu_pos = vec3(307.52, -213.30, 58.02),
        menu_text = '[H] Pinkcage Unit #5',
        unit_stash = vec3(306.78, -208.54, 58.02),
        unit_bedstash = vec3(309.10, -204.84, 58.02),
        unit_closet = vec3(302.52, -207.39, 58.02)
    }, 

    ["pcunit6"] = {
        unit_price = 500000,
        unit_name = 'PC Motel Unit #6',
        menu_pos = vec3(311.29, -203.40, 58.02),
        menu_text = '[H] Pinkcage Unit #6',
        unit_stash = vec3(310.55, -198.69, 58.02),
        unit_bedstash = vec3(312.88, -194.91, 58.02),
        unit_closet = vec3(306.38, -197.53, 58.02)
    },

    ["pcunit7"] = {
        unit_price = 500000,
        unit_name = 'PC Motel Unit #7',
        menu_pos = vec3(315.74, -194.91, 58.02),
        menu_text = '[H] Pinkcage Unit #7',
        unit_stash = vec3(320.48, -194.04, 58.02),
        unit_bedstash = vec3(324.26, -196.34, 58.02),
        unit_closet = vec3(321.84, -189.66, 58.02)
    },     

    ["pcunit8"] = {
        unit_price = 500000,
        unit_name = 'PC Motel Unit #8',
        menu_pos = vec3(339.11, -219.52, 54.22),
        menu_text = '[H] Pinkcage Unit #8',
        unit_stash = vec3(339.88, -224.17, 54.23),
        unit_bedstash = vec3(337.60, -227.94, 54.23),
        unit_closet = vec3(344.11, -225.44, 54.23)
    },  

    ["pcunit9"] = {
        unit_price = 500000,
        unit_name = 'PC Motel Unit #9',
        menu_pos = vec3(342.90, -209.61, 54.22),
        menu_text = '[H] Pinkcage Unit #9',
        unit_stash = vec3(343.66, -214.33, 54.23),
        unit_bedstash = vec3(341.46, -218.15, 54.23),
        unit_closet = vec3(347.93, -215.50, 54.23)
    },     

    ["pcunit10"] = {
        unit_price = 500000,
        unit_name = 'PC Motel Unit #10',
        menu_pos = vec3(346.78, -199.71, 54.22),
        menu_text = '[H] Pinkcage Unit #10',
        unit_stash = vec3(347.52, -204.43, 54.23),
        unit_bedstash = vec3(345.24, -208.22, 54.23),
        unit_closet = vec3(351.67, -205.70, 54.23)
    },      

    ["pcunit11"] = {
        unit_price = 500000,
        unit_name = 'PC Motel Unit #11',
        menu_pos = vec3(334.98, -227.15, 58.02),
        menu_text = '[H] Pinkcage Unit #11',
        unit_stash = vec3(330.25, -228.08, 58.02),
        unit_bedstash = vec3(326.45, -225.83, 58.02),
        unit_closet = vec3(329.05, -232.32, 58.02)
    },    

    ["pcunit12"] = {
        unit_price = 500000,
        unit_name = 'PC Motel Unit #12',
        menu_pos = vec3(339.12, -219.47, 58.02),
        menu_text = '[H] Pinkcage Unit #12',
        unit_stash = vec3(339.97, -224.21, 58.02),
        unit_bedstash = vec3(337.62, -227.96, 58.02),
        unit_closet = vec3(344.19, -225.44, 58.02)
    }, 

    ["pcunit13"] = {
        unit_price = 500000,
        unit_name = 'PC Motel Unit #13',
        menu_pos = vec3(342.81, -209.55, 58.02),
        menu_text = '[H] Pinkcage Unit #13',
        unit_stash = vec3(343.70, -214.31, 58.02),
        unit_bedstash = vec3(341.42, -218.12, 58.02),
        unit_closet = vec3(347.93, -215.52, 58.02)
    },  

    ["pcunit14"] = {
        unit_price = 500000,
        unit_name = 'PC Motel Unit #14',
        menu_pos = vec3(346.67, -199.71, 58.02),
        menu_text = '[H] Pinkcage Unit #14',
        unit_stash = vec3(347.40, -204.47, 58.02),
        unit_bedstash = vec3(345.24, -208.25, 58.02),
        unit_closet = vec3(351.77, -205.64, 58.02)
    },   

	-- Sandy Shore Motels      

    ["ssunit1"] = {
        unit_price = 500000,
        unit_name = 'SS Motel Unit #1',
        menu_pos = vec3(1142.31, 2663.77, 38.16),
        menu_text = '[H] SS Motel #1',
        unit_stash = vec3(1148.01, 2664.07, 38.15),
        unit_bedstash = vec3(1145.38, 2660.56, 38.15),
        unit_closet = vec3(1149.83, 2663.64, 38.15)
    },

    ["ssunit2"] = {
        unit_price = 500000,
        unit_name = 'SS Motel Unit #2',
        menu_pos = vec3(1142.42, 2651.06, 38.14),
        menu_text = '[H] SS Motel #2',
        unit_stash = vec3(1147.98, 2651.25, 38.14),
        unit_bedstash = vec3(1145.35, 2647.90, 38.14),
        unit_closet = vec3(1149.83, 2650.72, 38.14)
    },  

    ["ssunit3"] = {
        unit_price = 500000,
        unit_name = 'SS Motel Unit #3',
        menu_pos = vec3(1142.27, 2643.51, 38.14),
        menu_text = '[H] SS Motel #3',
        unit_stash = vec3(1148.06, 2643.70, 38.14),
        unit_bedstash = vec3(1145.35, 2640.34, 38.14),
        unit_closet = vec3(1149.81, 2643.24, 38.14)
    },

    ["ssunit4"] = {
        unit_price = 500000,
        unit_name = 'SS Motel Unit #4',
        menu_pos = vec3(1141.05, 2641.76, 38.14),
        menu_text = '[H] SS Motel #4',
        unit_stash = vec3(1141.28, 2636.01, 38.14),
        unit_bedstash = vec3(1137.83, 2638.74, 38.14),
        unit_closet = vec3(1140.83, 2634.27, 38.14)
    },

    ["ssunit5"] = {
        unit_price = 500000,
        unit_name = 'SS Motel Unit #5',
        menu_pos = vec3(1132.68, 2641.61, 38.14),
        menu_text = '[H] SS Motel #5',
        unit_stash = vec3(1132.80, 2635.99, 38.15),
        unit_bedstash = vec3(1129.48, 2638.70, 38.15),
        unit_closet = vec3(1132.41, 2634.22, 38.15)
    },

    ["ssunit6"] = {
        unit_price = 500000,
        unit_name = 'SS Motel Unit #6',
        menu_pos = vec3(1121.42, 2641.62, 38.14),
        menu_text = '[H] SS Motel #6',
        unit_stash = vec3(1121.57, 2635.95, 38.15),
        unit_bedstash = vec3(1118.14, 2638.69, 38.15),
        unit_closet = vec3(1121.08, 2634.17, 38.15)
    },

    ["ssunit7"] = {
        unit_price = 500000,
        unit_name = 'SS Motel Unit #7',
        menu_pos = vec3(1114.75, 2641.54, 38.14),
        menu_text = '[H] SS Motel #7',
        unit_stash = vec3(1114.86, 2636.02, 38.14),
        unit_bedstash = vec3(1111.48, 2638.69, 38.14),
        unit_closet = vec3(1114.38, 2634.15, 38.14)
    },

    ["ssunit8"] = {
        unit_price = 500000,
        unit_name = 'SS Motel Unit #8',
        menu_pos = vec3(1107.14, 2641.60, 38.14),
        menu_text = '[H] SS Motel #8',
        unit_stash = vec3(1107.31, 2636.03, 38.16),
        unit_bedstash = vec3(1103.93, 2638.69, 38.16),
        unit_closet = vec3(1106.78, 2634.19, 38.16)
    },

    ["ssunit9"] = {
        unit_price = 500000,
        unit_name = 'SS Motel Unit #9',
        menu_pos = vec3(1106.08, 2649.11, 38.14),
        menu_text = '[H] SS Motel #9',
        unit_stash = vec3(1100.49, 2648.99, 38.14),
        unit_bedstash = vec3(1103.21, 2652.29, 38.14),
        unit_closet = vec3(1098.69, 2649.44, 38.14)
    },

    -- Perrera Beach Motels    

    ["pbunit1"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #1',
        menu_pos = vec3(-1493.68, -668.27, 29.03),
        menu_text = '[H] Beach Motel Unit #1',
        unit_stash = vec3(-1496.87, -672.29, 29.03),
        unit_bedstash = vec3(-1497.94, -668.88, 29.03),
        unit_closet = vec3(-1495.88, -670.77, 29.03)
    },

    ["pbunit2"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #2',
        menu_pos = vec3(-1498.08, -664.61, 29.03),
        menu_text = '[H] Beach Motel Unit #2',
        unit_stash = vec3(-1501.28, -668.71, 29.04),
        unit_bedstash = vec3(-1502.26, -665.38, 29.04),
        unit_closet = vec3(-1500.18, -667.22, 29.04)
    }, 

    ["pbunit3"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #3',
        menu_pos = vec3(-1495.28, -661.68, 29.03),
        menu_text = '[H] Beach Motel Unit #3',
        unit_stash = vec3(-1498.49, -657.58, 29.17),
        unit_bedstash = vec3(-1494.88, -657.41, 29.03),
        unit_closet = vec3(-1497.33, -658.98, 29.03)
    },  

    ["pbunit4"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #4',
        menu_pos = vec3(-1490.64, -658.36, 29.03),
        menu_text = '[H] Beach Motel Unit #4',
        unit_stash = vec3(-1493.88, -654.19, 28.99),
        unit_bedstash = vec3(-1490.43, -654.15, 28.99),
        unit_closet = vec3(-1492.70, -655.60, 28.99)
    }, 

    ["pbunit5"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #5',
        menu_pos = vec3(-1486.71, -655.48, 29.58),
        menu_text = '[H] Beach Motel Unit #5',
        unit_stash = vec3(-1489.88, -651.31, 29.60),
        unit_bedstash = vec3(-1486.26, -651.16, 29.60),
        unit_closet = vec3(-1488.69, -652.71, 29.60)
    },

    ["pbunit6"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #6',
        menu_pos = vec3(-1482.05, -652.17, 29.58),
        menu_text = '[H] Beach Motel Unit #6',
        unit_stash = vec3(-1485.25, -648.06, 29.60),
        unit_bedstash = vec3(-1481.68, -647.85, 29.60),
        unit_closet = vec3(-1484.05, -649.44, 29.60)
    }, 

    ["pbunit7"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #7',
        menu_pos = vec3(-1478.11, -649.31, 29.58),
        menu_text = '[H] Beach Motel Unit #7',
        unit_stash = vec3(-1481.33, -645.08, 29.60),
        unit_bedstash = vec3(-1477.78, -644.93, 29.60),
        unit_closet = vec3(-1480.15, -646.48, 29.60)
    },

    ["pbunit8"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #8',
        menu_pos = vec3(-1473.57, -645.95, 29.58),
        menu_text = '[H] Beach Motel Unit #8',
        unit_stash = vec3(-1476.81, -641.79, 29.60),
        unit_bedstash = vec3(-1473.19, -641.61, 29.60),
        unit_closet = vec3(-1475.64, -643.17, 29.60)
    },  

    ["pbunit9"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #9',
        menu_pos = vec3(-1469.58, -643.05, 29.58),
        menu_text = '[H] Beach Motel Unit #9',
        unit_stash = vec3(-1472.78, -638.86, 29.60),
        unit_bedstash = vec3(-1469.16, -638.73, 29.60),
        unit_closet = vec3(-1471.60, -640.37, 29.60)
    },  

    ["pbunit10"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #10',
        menu_pos = vec3(-1464.96, -639.77, 29.58),
        menu_text = '[H] Beach Motel Unit #10',
        unit_stash = vec3(-1468.18, -635.53, 29.59),
        unit_bedstash = vec3(-1464.65, -635.43, 29.59),
        unit_closet = vec3(-1466.96, -636.97, 29.59)
    },

    ["pbunit11"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #11',
        menu_pos = vec3(-1461.38, -641.04, 29.58),
        menu_text = '[H] Beach Motel Unit #11',
        unit_stash = vec3(-1457.16, -637.76, 29.59),
        unit_bedstash = vec3(-1457.04, -641.41, 29.59),
        unit_closet = vec3(-1458.61, -638.98, 29.59)
    },  

    ["pbunit12"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #12',
        menu_pos = vec3(-1452.33, -653.22, 29.58),
        menu_text = '[H] Beach Motel Unit #12',
        unit_stash = vec3(-1448.31, -650.10, 29.59),
        unit_bedstash = vec3(-1448.13, -653.70, 29.59),
        unit_closet = vec3(-1449.66, -651.25, 29.59)
    },  

    ["pbunit13"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #13',
        menu_pos = vec3(-1454.52, -655.80, 29.58),
        menu_text = '[H] Beach Motel Unit #13',
        unit_stash = vec3(-1451.24, -659.94, 29.60),
        unit_bedstash = vec3(-1454.66, -660.04, 29.60),
        unit_closet = vec3(-1452.44, -658.55, 29.60)
    }, 

    ["pbunit14"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #14',
        menu_pos = vec3(-1459.12, -659.26, 29.58),
        menu_text = '[H] Beach Motel Unit #14',
        unit_stash = vec3(-1455.86, -663.40, 29.60),
        unit_bedstash = vec3(-1459.51, -663.56, 29.60),
        unit_closet = vec3(-1457.09, -661.92, 29.60)
    },  

    ["pbunit15"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #15',
        menu_pos = vec3(-1463.02, -662.08, 29.58),
        menu_text = '[H] Beach Motel Unit #15',
        unit_stash = vec3(-1459.83, -666.27, 29.59),
        unit_bedstash = vec3(-1463.46, -666.37, 29.59),
        unit_closet = vec3(-1461.03, -664.82, 29.59)
    },

    ["pbunit16"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #16',
        menu_pos = vec3(-1467.63, -665.45, 29.58),
        menu_text = '[H] Beach Motel Unit #16',
        unit_stash = vec3(-1464.39, -669.58, 29.61),
        unit_bedstash = vec3(-1468.07, -669.69, 29.59),
        unit_closet = vec3(-1465.72, -668.11, 29.61)
    },

    ["pbunit17"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #17',
        menu_pos = vec3(-1471.71, -668.16, 29.58),
        menu_text = '[H] Beach Motel Unit #17',
        unit_stash = vec3(-1468.34, -672.44, 29.59),
        unit_bedstash = vec3(-1472.07, -672.64, 29.59),
        unit_closet = vec3(-1469.58, -671.05, 29.59)
    }, 

    ["pbunit18"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #18',
        menu_pos = vec3(-1489.85, -671.24, 33.38),
        menu_text = '[H] Beach Motel Unit #18',
        unit_stash = vec3(-1493.11, -675.53, 33.39),
        unit_bedstash = vec3(-1494.16, -672.00, 33.39),
        unit_closet = vec3(-1492.04, -673.95, 33.39)
    }, 

    ["pbunit19"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #19',
        menu_pos = vec3(-1493.63, -668.15, 33.38),
        menu_text = '[H] Beach Motel Unit #19',
        unit_stash = vec3(-1496.95, -672.37, 33.38),
        unit_bedstash = vec3(-1498.00, -668.90, 33.38),
        unit_closet = vec3(-1495.81, -670.83, 33.38)
    },

    ["pbunit20"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #20',
        menu_pos = vec3(-1498.06, -664.58, 33.38),
        menu_text = '[H] Beach Motel Unit #20',
        unit_stash = vec3(-1501.33, -668.76, 33.38),
        unit_bedstash = vec3(-1502.33, -665.28, 33.38),
        unit_closet = vec3(-1500.19, -667.19, 33.38)
    }, 

    ["pbunit21"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #21',
        menu_pos = vec3(-1495.33, -661.74, 33.38),
        menu_text = '[H] Beach Motel Unit #21',
        unit_stash = vec3(-1498.47, -657.53, 33.38),
        unit_bedstash = vec3(-1494.85, -657.41, 33.38),
        unit_closet = vec3(-1497.24, -659.00, 33.38)
    },  

    ["pbunit22"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #22',
        menu_pos = vec3(-1490.69, -658.34, 33.38),
        menu_text = '[H] Beach Motel Unit #22',
        unit_stash = vec3(-1493.88, -654.28, 33.38),
        unit_bedstash = vec3(-1490.22, -654.05, 33.38),
        unit_closet = vec3(-1492.67, -655.66, 33.38)
    },

    ["pbunit23"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #23',
        menu_pos = vec3(-1486.64, -655.56, 33.38),
        menu_text = '[H] Beach Motel Unit #23',
        unit_stash = vec3(-1489.89, -651.29, 33.38),
        unit_bedstash = vec3(-1486.28, -651.20, 33.38),
        unit_closet = vec3(-1488.64, -652.78, 33.38)
    }, 

    ["pbunit24"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #24',
        menu_pos = vec3(-1482.18, -652.17, 33.38),
        menu_text = '[H] Beach Motel Unit #24',
        unit_stash = vec3(-1485.30, -647.96, 33.38),
        unit_bedstash = vec3(-1481.67, -647.84, 33.38),
        unit_closet = vec3(-1484.12, -649.46, 33.38)
    },

    ["pbunit25"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #25',
        menu_pos = vec3(-1478.22, -649.23, 33.38),
        menu_text = '[H] Beach Motel Unit #25',
        unit_stash = vec3(-1481.34, -645.08, 33.38),
        unit_bedstash = vec3(-1477.75, -644.96, 33.38),
        unit_closet = vec3(-1480.15, -646.59, 33.38)
    }, 

    ["pbunit26"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #26',
        menu_pos = vec3(-1473.53, -645.94, 33.38),
        menu_text = '[H] Beach Motel Unit #26',
        unit_stash = vec3(-1476.74, -641.74, 33.38),
        unit_bedstash = vec3(-1473.11, -641.63, 33.38),
        unit_closet = vec3(-1475.53, -643.26, 33.38)
    }, 

    ["pbunit27"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #27',
        menu_pos = vec3(-1469.53, -643.04, 33.38),
        menu_text = '[H] Beach Motel Unit #27',
        unit_stash = vec3(-1472.78, -638.86, 33.38),
        unit_bedstash = vec3(-1469.15, -638.73, 33.38),
        unit_closet = vec3(-1471.62, -640.30, 33.38)
    },

    ["pbunit28"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #28',
        menu_pos = vec3(-1464.89, -639.79, 33.38),
        menu_text = '[H] Beach Motel Unit #28',
        unit_stash = vec3(-1468.19, -635.54, 33.39),
        unit_bedstash = vec3(-1464.56, -635.39, 33.39),
        unit_closet = vec3(-1466.99, -636.98, 33.39)
    }, 

    ["pbunit29"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #29',
        menu_pos = vec3(-1461.35, -641.03, 33.38),
        menu_text = '[H] Beach Motel Unit #29',
        unit_stash = vec3(-1457.16, -637.77, 33.38),
        unit_bedstash = vec3(-1457.03, -641.40, 33.38),
        unit_closet = vec3(-1458.66, -638.91, 33.38)
    }, 

    ["pbunit30"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #30',
        menu_pos = vec3(-1452.47, -653.31, 33.38),
        menu_text = '[H] Beach Motel Unit #30',
        unit_stash = vec3(-1448.24, -650.06, 33.38),
        unit_bedstash = vec3(-1448.12, -653.69, 33.38),
        unit_closet = vec3(-1449.68, -651.26, 33.38)
    }, 

    ["pbunit31"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #31',
        menu_pos = vec3(-1454.51, -655.77, 33.38),
        menu_text = '[H] Beach Motel Unit #31',
        unit_stash = vec3(-1451.13, -660.00, 33.38),
        unit_bedstash = vec3(-1454.81, -660.28, 33.38),
        unit_closet = vec3(-1452.40, -658.51, 33.38)
    },

    ["pbunit32"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #32',
        menu_pos = vec3(-1459.10, -659.18, 33.38),
        menu_text = '[H] Beach Motel Unit #32',
        unit_stash = vec3(-1455.77, -663.39, 33.39),
        unit_bedstash = vec3(-1459.50, -663.49, 33.39),
        unit_closet = vec3(-1457.05, -661.88, 33.39)
    },

    ["pbunit33"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #33',
        menu_pos = vec3(-1463.06, -662.06, 33.38),
        menu_text = '[H] Beach Motel Unit #33',
        unit_stash = vec3(-1459.75, -666.26, 33.38),
        unit_bedstash = vec3(-1463.47, -666.44, 33.38),
        unit_closet = vec3(-1461.05, -664.77, 33.38)
    }, 

    ["pbunit34"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #34',
        menu_pos = vec3(-1467.71, -665.33, 33.38),
        menu_text = '[H] Beach Motel Unit #34',
        unit_stash = vec3(-1464.43, -669.62, 33.38),
        unit_bedstash = vec3(-1468.06, -669.72, 33.38),
        unit_closet = vec3(-1465.58, -668.11, 33.38)
    }, 

    ["pbunit35"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #35',
        menu_pos = vec3(-1471.66, -668.25, 33.38),
        menu_text = '[H] Beach Motel Unit #35',
        unit_stash = vec3(-1468.35, -672.48, 33.38),
        unit_bedstash = vec3(-1472.02, -672.60, 33.38),
        unit_closet = vec3(-1469.59, -671.02, 33.38)
    },

    ["pbunit36"] = {
        unit_price = 500000,
        unit_name = 'PB Motel Unit #36',
        menu_pos = vec3(-1476.23, -671.55, 33.38),
        menu_text = '[H] Beach Motel Unit #36',
        unit_stash = vec3(-1473.00, -675.82, 33.38),
        unit_bedstash = vec3(-1476.63, -675.93, 33.38),
        unit_closet = vec3(-1474.22, -674.37, 33.38)
    },
	
	 --   Paleto Forest Motel

    ["pfunit1"] = {
        unit_price = 500000,
        unit_name = 'PF Motel Unit #1',
        menu_pos = vec3(-681.94, 5770.75, 17.51),
        menu_text = '[H] Paleto Unit #1',
        unit_stash = vec3(-679.19, 5771.93, 17.54),
        unit_bedstash = vec3(-677.23, 5770.81, 17.54),
        unit_closet = vec3(-675.79, 5769.40, 17.54)
    },

    ["pfunit2"] = {
        unit_price = 500000,
        unit_name = 'PF Motel Unit #2',
        menu_pos = vec3(-683.76, 5766.79, 17.51),
        menu_text = '[H] Paleto Unit #2',
        unit_stash = vec3(-681.00, 5768.09, 17.54),
        unit_bedstash = vec3(-679.17, 5766.76, 17.56),
        unit_closet = vec3(-677.51, 5765.48, 17.54)
    },

    ["pfunit3"] = {
        unit_price = 500000,
        unit_name = 'PF Motel Unit #3',
        menu_pos = vec3(-685.63, 5762.88, 17.51),
        menu_text = '[H] Paleto Unit #3',
        unit_stash = vec3(-682.92, 5764.16, 17.54),
        unit_bedstash = vec3(-681.02, 5762.67, 17.54),
        unit_closet = vec3(-679.31, 5761.58, 17.54)
    },

    ["pfunit4"] = {
        unit_price = 500000,
        unit_name = 'PF Motel Unit #4',
        menu_pos = vec3(-687.46, 5758.92, 17.51),
        menu_text = '[H] Paleto Unit #4',
        unit_stash = vec3(-684.79, 5760.15, 17.54),
        unit_bedstash = vec3(-682.90, 5758.74, 17.57),
        unit_closet = vec3(-681.14, 5757.62, 17.54)
    }, 

    ["pfunit5"] = {
        unit_price = 500000,
        unit_name = 'PF Motel Unit #5',
        menu_pos = vec3(-690.32, 5759.53, 17.51),
        menu_text = '[H] Paleto Unit #5',
        unit_stash = vec3(-689.05, 5756.81, 17.54),
        unit_bedstash = vec3(-690.60, 5754.96, 17.54),
        unit_closet = vec3(-691.59, 5753.25, 17.55)
    },

    ["pfunit6"] = {
        unit_price = 500000,
        unit_name = 'PF Motel Unit #6',
        menu_pos = vec3(-694.23, 5761.41, 17.51),
        menu_text = '[H] Paleto Unit #6',
        unit_stash = vec3(-692.95, 5758.68, 17.54),
        unit_bedstash = vec3(-694.47, 5756.80, 17.54),
        unit_closet = vec3(-695.52, 5755.03, 17.54)
    },

    ["pfunit7"] = {
        unit_price = 500000,
        unit_name = 'PF Motel Unit #7',
        menu_pos = vec3(-698.13, 5763.26, 17.51),
        menu_text = '[H] Paleto Unit #7',
        unit_stash = vec3(-696.94, 5760.53, 17.54),
        unit_bedstash = vec3(-698.43, 5758.69, 17.54),
        unit_closet = vec3(-699.45, 5756.89, 17.54)
    },

    ["pfunit8"] = {
        unit_price = 500000,
        unit_name = 'PF Motel Unit #8',
        menu_pos = vec3(-702.11, 5765.01, 17.51),
        menu_text = '[H] Paleto Unit #8',
        unit_stash = vec3(-700.82, 5762.28, 17.54),
        unit_bedstash = vec3(-702.30, 5760.49, 17.54),
        unit_closet = vec3(-703.38, 5758.74, 17.54)
    },

    ["pfunit9"] = {
        unit_price = 500000,
        unit_name = 'PF Motel Unit #9',
        menu_pos = vec3(-705.98, 5766.92, 17.51),
        menu_text = '[H] Paleto Unit #9',
        unit_stash = vec3(-704.72, 5764.08, 17.54),
        unit_bedstash = vec3(-706.18, 5762.32, 17.57),
        unit_closet = vec3(-707.26, 5760.59, 17.54)
    },                                 

    ["pfunit10"] = {
        unit_price = 500000,
        unit_name = 'PF Motel Unit #10',
        menu_pos = vec3(-709.90, 5768.71, 17.51),
        menu_text = '[H] Paleto Unit #10',
        unit_stash = vec3(-708.66, 5765.97, 17.54),
        unit_bedstash = vec3(-710.14, 5764.13, 17.54),
        unit_closet = vec3(-711.22, 5762.37, 17.54)
    }, 
	
	-- Starlite Motels
	["slunit1"] = {
        unit_price = 500000,
        unit_name = 'Starlite Motel Unit #1',
        menu_pos = vec3(970.79, -199.44, 73.21),
        menu_text = '[H] Starlite Unit #1',
        unit_stash = vec3(974.87, -202.47, 73.17),
        unit_bedstash = vec3(971.69, -201.62, 73.15),
        unit_closet = vec3(974.12, -199.14, 73.12)
    }, 
	
	["slunit2"] = {
        unit_price = 500000,
        unit_name = 'Starlite Motel Unit #2',
        menu_pos = vec3(967.19, -205.03, 73.21),
        menu_text = '[H] Starlite Unit #2',
        unit_stash = vec3(971.53, -208.15, 73.18),
        unit_bedstash = vec3(968.35, -207.27, 73.17),
        unit_closet = vec3(970.68, -204.87, 73.22)
    }, 
	
	["slunit6"] = {
        unit_price = 500000,
        unit_name = 'Starlite Motel Unit #6',
        menu_pos = vec3(951.83, -210.65, 73.21),
        menu_text = '[H] Starlite Unit #6',
        unit_stash = vec3(948.76, -214.81, 73.17),
        unit_bedstash = vec3(949.58, -211.67, 73.16),
        unit_closet = vec3(952.04, -214.01, 73.16)
    }, 
	
	["slunit8"] = {
        unit_price = 500000,
        unit_name = 'Starlite Motel Unit #8',
        menu_pos = vec3(947.7, -205.9, 73.21),
        menu_text = '[H] Starlite Unit #8',
        unit_stash = vec3(943.47, -202.81, 73.26),
        unit_bedstash = vec3(946.66, -203.7, 73.19),
        unit_closet = vec3(944.32, -206.11, 73.21)
    }, 
	
	["slunit9"] = {
        unit_price = 500000,
        unit_name = 'Starlite Motel Unit #9',
        menu_pos = vec3(950.47, -201.26, 73.21),
        menu_text = '[H] Starlite Unit #9',
        unit_stash = vec3(946.27, -198.13, 73.26),
        unit_bedstash = vec3(949.44, -199.04, 73.2),
        unit_closet = vec3(947.03, -201.51, 73.22)
    }, 
	
	["slunit10"] = {
        unit_price = 500000,
        unit_name = 'Starlite Motel Unit #10',
        menu_pos = vec3(953.15, -196.56, 73.21),
        menu_text = '[H] Starlite Unit #10',
        unit_stash = vec3(949.24, -193.61, 73.27),
        unit_bedstash = vec3(952.24, -194.42, 73.21),
        unit_closet = vec3(949.89, -196.9, 73.23)
    }, 
	
	["slunit11"] = {
        unit_price = 500000,
        unit_name = 'Starlite Motel Unit #11',
        menu_pos = vec3(970.8, -199.49, 76.26),
        menu_text = '[H] Starlite Unit #11',
        unit_stash = vec3(974.9, -202.41, 76.21),
        unit_bedstash = vec3(971.72, -201.61, 76.19),
        unit_closet = vec3(974.09, -199.13, 76.25)
    }, 
	
	["slunit12"] = {
        unit_price = 500000,
        unit_name = 'Starlite Motel Unit #12',
        menu_pos = vec3(967.32, -205.11, 76.26),
        menu_text = '[H] Starlite Unit #12',
        unit_stash = vec3(971.32, -208.1, 76.23),
        unit_bedstash = vec3(968.32, -207.26, 76.21),
        unit_closet = vec3(970.67, -204.88, 76.27)
    }, 
	
	["slunit13"] = {
        unit_price = 500000,
        unit_name = 'Starlite Motel Unit #13',
        menu_pos = vec3(964.57, -209.82, 76.26),
        menu_text = '[H] Starlite Unit #13',
        unit_stash = vec3(968.67, -212.75, 76.21),
        unit_bedstash = vec3(965.5, -211.96, 76.2),
        unit_closet = vec3(967.89, -209.54, 76.25)
    }, 
	
	["slunit14"] = {
        unit_price = 500000,
        unit_name = 'Starlite Motel Unit #14',
        menu_pos = vec3(961.75, -214.36, 76.26),
        menu_text = '[H] Starlite Unit #14',
        unit_stash = vec3(965.75, -217.34, 76.21),
        unit_bedstash = vec3(962.71, -216.54, 76.19),
        unit_closet = vec3(965.13, -214.19, 76.25)
    }, 
	
	["slunit15"] = {
        unit_price = 500000,
        unit_name = 'Starlite Motel Unit #15',
        menu_pos = vec3(957.66, -214.2, 76.26),
        menu_text = '[H] Starlite Unit #15',
        unit_stash = vec3(954.62, -218.38, 76.23),
        unit_bedstash = vec3(955.43, -215.18, 76.22),
        unit_closet = vec3(957.94, -217.47, 76.22)
    }, 
	
	["slunit17"] = {
        unit_price = 500000,
        unit_name = 'Starlite Motel Unit #17',
        menu_pos = vec3(948.73, -208.86, 76.26),
        menu_text = '[H] Starlite Unit #17',
        unit_stash = vec3(945.77, -212.99, 76.23),
        unit_bedstash = vec3(946.53, -209.87, 76.21),
        unit_closet = vec3(948.96, -212.28, 76.25)
    }, 
	
	["slunit18"] = {
        unit_price = 500000,
        unit_name = 'Starlite Motel Unit #18',
        menu_pos = vec3(947.57, -205.84, 76.26),
        menu_text = '[H] Starlite Unit #18',
        unit_stash = vec3(943.54, -202.84, 76.32),
        unit_bedstash = vec3(946.67, -203.71, 76.25),
        unit_closet = vec3(944.3, -206.14, 76.28)
    }, 
	
	["slunit19"] = {
        unit_price = 500000,
        unit_name = 'Starlite Motel Unit #19',
        menu_pos = vec3(950.35, -201.2, 76.26),
        menu_text = '[H] Starlite Unit #19',
        unit_stash = vec3(946.28, -198.17, 76.31),
        unit_bedstash = vec3(949.43, -199.02, 76.24),
        unit_closet = vec3(947.04, -201.46, 76.27)
    }, 
	
	["slunit21"] = {
        unit_price = 500000,
        unit_name = 'Starlite Motel Unit #21',
        menu_pos = vec3(970.77, -199.44, 79.3),
        menu_text = '[H] Starlite Unit #21',
        unit_stash = vec3(974.85, -202.37, 79.26),
        unit_bedstash = vec3(971.7, -201.69, 79.24),
        unit_closet = vec3(974.04, -199.08, 79.3)
    }, 
	
	["slunit22"] = {
        unit_price = 500000,
        unit_name = 'Starlite Motel Unit #22',
        menu_pos = vec3(967.41, -205.15, 79.3),
        menu_text = '[H] Starlite Unit #22',
        unit_stash = vec3(971.41, -208.06, 79.26),
        unit_bedstash = vec3(968.36, -207.29, 79.24),
        unit_closet = vec3(970.7, -204.85, 79.3)
    }, 
	
	["slunit23"] = {
        unit_price = 500000,
        unit_name = 'Starlite Motel Unit #23',
        menu_pos = vec3(964.5, -209.79, 79.3),
        menu_text = '[H] Starlite Unit #23',
        unit_stash = vec3(968.71, -212.85, 79.24),
        unit_bedstash = vec3(965.55, -211.98, 79.23),
        unit_closet = vec3(967.94, -209.46, 79.28)
    }, 
	
	["slunit24"] = {
        unit_price = 500000,
        unit_name = 'Starlite Motel Unit #24',
        menu_pos = vec3(961.8, -214.44, 79.3),
        menu_text = '[H] Starlite Unit #24',
        unit_stash = vec3(965.92, -217.44, 79.24),
        unit_bedstash = vec3(962.77, -216.58, 79.23),
        unit_closet = vec3(965.18, -214.17, 79.28)
    }, 
	
	["slunit25"] = {
        unit_price = 500000,
        unit_name = 'Starlite Motel Unit #25',
        menu_pos = vec3(957.61, -214.28, 79.3),
        menu_text = '[H] Starlite Unit #25',
        unit_stash = vec3(954.65, -218.31, 79.29),
        unit_bedstash = vec3(955.47, -215.25, 79.28),
        unit_closet = vec3(957.94, -217.58, 79.28)
    }, 
	
	["slunit27"] = {
        unit_price = 500000,
        unit_name = 'Starlite Motel Unit #27',
        menu_pos = vec3(948.65, -208.9, 79.3),
        menu_text = '[H] Starlite Unit #27',
        unit_stash = vec3(945.71, -213.01, 79.28),
        unit_bedstash = vec3(946.56, -209.92, 79.28),
        unit_closet = vec3(948.91, -212.22, 79.28)
    }, 
	
	["slunit28"] = {
        unit_price = 500000,
        unit_name = 'Starlite Motel Unit #28',
        menu_pos = vec3(947.48, -205.81, 79.3),
        menu_text = '[H] Starlite Unit #28',
        unit_stash = vec3(943.55, -202.86, 79.35),
        unit_bedstash = vec3(946.65, -203.67, 79.28),
        unit_closet = vec3(944.29, -206.13, 79.28)
    }, 
	
	["slunit29"] = {
        unit_price = 500000,
        unit_name = 'Starlite Motel Unit #29',
        menu_pos = vec3(950.34, -201.17, 79.3),
        menu_text = '[H] Starlite Unit #29',
        unit_stash = vec3(946.24, -198.21, 79.36),
        unit_bedstash = vec3(949.45, -199.05, 79.28),
        unit_closet = vec3(947.08, -201.43, 79.32)
    }, 
	
	["slunit30"] = {
        unit_price = 500000,
        unit_name = 'Starlite Motel Unit #30',
        menu_pos = vec3(953.22, -196.52, 79.3),
        menu_text = '[H] Starlite Unit #30',
        unit_stash = vec3(949.09, -193.59, 79.35),
        unit_bedstash = vec3(952.23, -194.41, 79.28),
        unit_closet = vec3(949.82, -196.86, 79.31)
    }, 
	["cbunit1"] = {
        unit_price = 500000,
        unit_name = 'Crastenburg Unit #1',
        menu_pos = vec3(488.42, 223.55, 104.75),
        menu_text = '[H] Crastenburg Unit #1',
        unit_stash = vec3(490.87, 233.15, 104.75),
        unit_bedstash = vec3(487.89, 234.32, 104.75),
        unit_closet = vec3(485.95, 234.38, 104.75)
    }, 
	
	["cbunit2"] = {
        unit_price = 500000,
        unit_name = 'Crastenburg Unit #2',
        menu_pos = vec3(496.42, 237.5, 104.75),
        menu_text = '[H] Crastenburg Unit #2',
        unit_stash = vec3(507.22, 237.94, 104.75),
        unit_bedstash = vec3(506.02, 234.92, 104.75),
        unit_closet = vec3(507.3, 239.58, 104.75)
    }, 
	
	["cbunit3"] = {
        unit_price = 500000,
        unit_name = 'Crastenburg Unit #3',
        menu_pos = vec3(508.65, 233.03, 104.75),
        menu_text = '[H] Crastenburg Unit #3',
        unit_stash = vec3(519.4, 233.5, 104.75),
        unit_bedstash = vec3(518.16, 230.4, 104.75),
        unit_closet = vec3(519.29, 235.12, 104.75)
    }, 
	
	["cbunit4"] = {
        unit_price = 500000,
        unit_name = 'Crastenburg Unit #4',
        menu_pos = vec3(520.85, 228.55, 104.75),
        menu_text = '[H] Crastenburg Unit #4',
        unit_stash = vec3(531.57, 229.06, 104.75),
        unit_bedstash = vec3(530.23, 226.06, 104.75),
        unit_closet = vec3(531.64, 230.71, 104.75)
    }, 
	
	["cbunit5"] = {
        unit_price = 500000,
        unit_name = 'Crastenburg Unit #5',
        menu_pos = vec3(531.57, 222.61, 104.75),
        menu_text = '[H] Crastenburg Unit #5',
        unit_stash = vec3(532.09, 211.83, 104.75),
        unit_bedstash = vec3(529.04, 212.89, 104.75),
        unit_closet = vec3(533.72, 211.81, 104.75)
    }, 
	
	["cbunit6"] = {
        unit_price = 500000,
        unit_name = 'Crastenburg Unit #6',
        menu_pos = vec3(527.39, 211.21, 104.75),
        menu_text = '[H] Crastenburg Unit #6',
        unit_stash = vec3(527.85, 200.49, 104.75),
        unit_bedstash = vec3(524.91, 201.67, 104.75),
        unit_closet = vec3(529.63, 200.52, 104.75)
    }, 
	
	["cbunit7"] = {
        unit_price = 500000,
        unit_name = 'Crastenburg Unit #7',
        menu_pos = vec3(523.32, 199.84, 104.75),
        menu_text = '[H] Crastenburg Unit #7',
        unit_stash = vec3(523.76, 189.21, 104.75),
        unit_bedstash = vec3(520.73, 190.31, 104.75),
        unit_closet = vec3(525.32, 188.95, 104.75)
    }, 
	
	["cbunit8"] = {
        unit_price = 500000,
        unit_name = 'Crastenburg Unit #8',
        menu_pos = vec3(517.24, 190.23, 104.75),
        menu_text = '[H] Crastenburg Unit #8',
        unit_stash = vec3(506.65, 189.7, 104.75),
        unit_bedstash = vec3(507.81, 192.67, 104.75),
        unit_closet = vec3(506.52, 188.1, 104.75)
    }, 
	
	["cbunit9"] = {
        unit_price = 500000,
        unit_name = 'Crastenburg Unit #9',
        menu_pos = vec3(491.32, 199.6, 104.75),
        menu_text = '[H] Crastenburg Unit #9',
        unit_stash = vec3(480.64, 199.13, 104.75),
        unit_bedstash = vec3(481.83, 202.23, 104.75),
        unit_closet = vec3(480.5, 197.39, 104.75)
    }, 
	
	["cbunit10"] = {
        unit_price = 500000,
        unit_name = 'Crastenburg Unit #10',
        menu_pos = vec3(481.8, 205.22, 104.75),
        menu_text = '[H] Crastenburg Unit #10',
        unit_stash = vec3(481.36, 215.93, 104.75),
        unit_bedstash = vec3(484.34, 214.67, 104.75),
        unit_closet = vec3(479.75, 216.02, 104.75)
    }, 
	
	["cbunit11"] = {
        unit_price = 500000,
        unit_name = 'Crastenburg Unit #11',
        menu_pos = vec3(491.29, 199.58, 108.31),
        menu_text = '[H] Crastenburg Unit #11',
        unit_stash = vec3(480.69, 199.06, 108.31),
        unit_bedstash = vec3(481.74, 202.2, 108.31),
        unit_closet = vec3(480.63, 197.54, 108.31)
    }, 
	
	["cbunit12"] = {
        unit_price = 500000,
        unit_name = 'Crastenburg Unit #12',
        menu_pos = vec3(481.72, 205.27, 108.31),
        menu_text = '[H] Crastenburg Unit #12',
        unit_stash = vec3(481.31, 215.99, 108.31),
        unit_bedstash = vec3(484.45, 214.84, 108.31),
        unit_closet = vec3(479.77, 215.98, 108.31)
    }, 
	
	["cbunit13"] = {
        unit_price = 500000,
        unit_name = 'Crastenburg Unit #13',
        menu_pos = vec3(485.91, 216.53, 108.31),
        menu_text = '[H] Crastenburg Unit #13',
        unit_stash = vec3(485.42, 227.29, 108.31),
        unit_bedstash = vec3(488.58, 226.11, 108.31),
        unit_closet = vec3(483.84, 227.16, 108.31)
    }, 
	
	["cbunit14"] = {
        unit_price = 500000,
        unit_name = 'Crastenburg Unit #14',
        menu_pos = vec3(490.02, 228.05, 108.31),
        menu_text = '[H] Crastenburg Unit #14',
        unit_stash = vec3(489.62, 238.73, 108.32),
        unit_bedstash = vec3(492.71, 237.54, 108.32),
        unit_closet = vec3(488.09, 239.9, 108.32)
    }, 
	
	["cbunit15"] = {
        unit_price = 500000,
        unit_name = 'Crastenburg Unit #15',
        menu_pos = vec3(496.48, 237.42, 108.31),
        menu_text = '[H] Crastenburg Unit #15',
        unit_stash = vec3(507.23, 237.91, 108.32),
        unit_bedstash = vec3(506.02, 234.85, 108.32),
        unit_closet = vec3(507.32, 239.51, 108.32)
    }, 
	
	["cbunit16"] = {
        unit_price = 500000,
        unit_name = 'Crastenburg Unit #16',
        menu_pos = vec3(508.64, 233.04, 108.31),
        menu_text = '[H] Crastenburg Unit #16',
        unit_stash = vec3(519.33, 233.41, 108.31),
        unit_bedstash = vec3(518.16, 230.32, 108.31),
        unit_closet = vec3(519.45, 235.1, 108.31)
    }, 
	
	["cbunit17"] = {
        unit_price = 500000,
        unit_name = 'Crastenburg Unit #17',
        menu_pos = vec3(520.86, 228.65, 108.31),
        menu_text = '[H] Crastenburg Unit #17',
        unit_stash = vec3(531.58, 229.02, 108.32),
        unit_bedstash = vec3(530.35, 225.95, 108.32),
        unit_closet = vec3(531.47, 230.71, 108.32)
    }, 
	
	["cbunit18"] = {
        unit_price = 500000,
        unit_name = 'Crastenburg Unit #18',
        menu_pos = vec3(531.57, 222.48, 108.31),
        menu_text = '[H] Crastenburg Unit #18',
        unit_stash = vec3(532.17, 211.84, 108.32),
        unit_bedstash = vec3(528.93, 212.97, 108.32),
        unit_closet = vec3(533.66, 211.68, 108.32)
    }, 
	
	["cbunit19"] = {
        unit_price = 500000,
        unit_name = 'Crastenburg Unit #19',
        menu_pos = vec3(527.48, 211.21, 108.31),
        menu_text = '[H] Crastenburg Unit #19',
        unit_stash = vec3(528.0, 200.67, 108.31),
        unit_bedstash = vec3(524.91, 201.71, 108.31),
        unit_closet = vec3(529.51, 200.34, 108.31)
    }, 
	
	["cbunit20"] = {
        unit_price = 500000,
        unit_name = 'Crastenburg Unit #20',
        menu_pos = vec3(523.31, 199.81, 108.31),
        menu_text = '[H] Crastenburg Unit #20',
        unit_stash = vec3(523.83, 189.15, 108.31),
        unit_bedstash = vec3(520.9, 190.25, 108.31),
        unit_closet = vec3(525.37, 189.12, 108.31)
    }, 
	
	["cbunit21"] = {
        unit_price = 500000,
        unit_name = 'Crastenburg Unit #21',
        menu_pos = vec3(517.37, 190.1, 108.31),
        menu_text = '[H] Crastenburg Unit #21',
        unit_stash = vec3(506.68, 189.72, 108.31),
        unit_bedstash = vec3(507.86, 192.75, 108.31),
        unit_closet = vec3(506.42, 188.16, 108.31)
    }
}

Config.MotelDoors = {
    -- Pink Cage Motel Doors
    {
        motel_id = 'pcunit1',
        objName = 'gabz_pinkcage_doors_front',
        objYaw = 69.0,
        objCoords  = vec3(307.54, -213.33, 54.22),
        textCoords = vec3(307.54, -213.33, 54.22),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'pcunit2',
        objName = 'gabz_pinkcage_doors_front',
        objYaw = 69.0,
        objCoords  = vec3(311.36, -203.43, 54.22),
        textCoords = vec3(311.36, -203.43, 54.22),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'pcunit3',
        objName = 'gabz_pinkcage_doors_front',
        objYaw = 339.0,
        objCoords  = vec3(315.79, -194.93, 54.23),
        textCoords = vec3(315.79, -194.93, 54.23),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'pcunit4',
        objName = 'gabz_pinkcage_doors_front',
        objYaw = 159.0,
        objCoords  = vec3(314.92, -219.55, 58.02),
        textCoords = vec3(314.92, -219.55, 58.02),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'pcunit5',
        objName = 'gabz_pinkcage_doors_front',
        objYaw = 69.0,
        objCoords  = vec3(307.53, -213.36, 58.02),
        textCoords = vec3(307.53, -213.36, 58.02),
        locked = true,
        destroyed = false
    },   

    {
        motel_id = 'pcunit6',
        objName = 'gabz_pinkcage_doors_front',
        objYaw = 69.0,
        objCoords  = vec3(311.38, -203.45, 58.02),
        textCoords = vec3(311.38, -203.45, 58.02),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'pcunit7',
        objName = 'gabz_pinkcage_doors_front',
        objYaw = 339.0,
        objCoords  = vec3(315.70, -194.85, 58.02),
        textCoords = vec3(315.70, -194.85, 58.02),
        locked = true,
        destroyed = false
    },         

    {
        motel_id = 'pcunit8',
        objName = 'gabz_pinkcage_doors_front',
        objYaw = 249.0,
        objCoords  = vec3(339.11, -219.52, 54.22),
        textCoords = vec3(339.11, -219.52, 54.22),
        locked = true,
        destroyed = false
    },         

    {
        motel_id = 'pcunit9',
        objName = 'gabz_pinkcage_doors_front',
        objYaw = 249.0,
        objCoords  = vec3(342.94, -209.59, 54.22),
        textCoords = vec3(342.94, -209.59, 54.22),
        locked = true,
        destroyed = false
    }, 

    {
        motel_id = 'pcunit10',
        objName = 'gabz_pinkcage_doors_front',
        objYaw = 249.0,
        objCoords  = vec3(346.66, -199.74, 54.22),
        textCoords = vec3(346.66, -199.74, 54.22),
        locked = true,
        destroyed = false
    },     

    {
        motel_id = 'pcunit11',
        objName = 'gabz_pinkcage_doors_front',
        objYaw = 159.0,
        objCoords  = vec3(334.93, -227.30, 58.02),
        textCoords = vec3(334.93, -227.30, 58.02),
        locked = true,
        destroyed = false
    },  

    {
        motel_id = 'pcunit12',
        objName = 'gabz_pinkcage_doors_front',
        objYaw = 249.0,
        objCoords  = vec3(339.12, -219.47, 58.02),
        textCoords = vec3(339.12, -219.47, 58.02),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'pcunit13',
        objName = 'gabz_pinkcage_doors_front',
        objYaw = 249.0,
        objCoords  = vec3(342.81, -209.55, 58.02),
        textCoords = vec3(342.81, -209.55, 58.02),
        locked = true,
        destroyed = false
    },    

    {
        motel_id = 'pcunit14',
        objName = 'gabz_pinkcage_doors_front',
        objYaw = 249.0,
        objCoords  = vec3(346.71, -199.74, 58.02),
        textCoords = vec3(346.71, -199.74, 58.02),
        locked = true,
        destroyed = false
    },     
	-- Sandy Shore Motel Doors                                                     
    {
        motel_id = 'ssunit1',
        objName = 'prop_bs_map_door_01',
        objYaw = 90.0,
        objCoords  = vec3(1142.54, 2663.79, 38.16),
        textCoords = vec3(1142.54, 2663.79, 38.16),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'ssunit2',
        objName = 'prop_bs_map_door_01',
        objYaw = 90.0,
        objCoords  = vec3(1142.67, 2651.01, 38.14),
        textCoords = vec3(1142.67, 2651.01, 38.14),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'ssunit3',
        objName = 'prop_bs_map_door_01',
        objYaw = 90.0,
        objCoords  = vec3(1142.72, 2643.53, 38.14),
        textCoords = vec3(1142.72, 2643.53, 38.14),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'ssunit4',
        objName = 'prop_bs_map_door_01',
        objYaw = 0.0,
        objCoords  = vec3(1141.10, 2641.23, 38.14),
        textCoords = vec3(1141.10, 2641.23, 38.14),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'ssunit5',
        objName = 'prop_bs_map_door_01',
        objYaw = 0.0,
        objCoords  = vec3(1132.71, 2641.19, 38.15),
        textCoords = vec3(1132.71, 2641.19, 38.15),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'ssunit6',
        objName = 'prop_bs_map_door_01',
        objYaw = 0.0,
        objCoords  = vec3(1121.42, 2641.28, 38.15),
        textCoords = vec3(1121.42, 2641.28, 38.15),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'ssunit7',
        objName = 'prop_bs_map_door_01',
        objYaw = 0.0,
        objCoords  = vec3(1114.61, 2641.29, 38.14),
        textCoords = vec3(1114.61, 2641.29, 38.14),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'ssunit8',
        objName = 'prop_bs_map_door_01',
        objYaw = 0.0,
        objCoords  = vec3(1107.03, 2641.20, 38.16),
        textCoords = vec3(1107.03, 2641.20, 38.16),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'ssunit9',
        objName = 'prop_bs_map_door_01',
        objYaw = -90.0,
        objCoords  = vec3(1105.82, 2649.08, 38.14),
        textCoords = vec3(1105.82, 2649.08, 38.14),
        locked = true,
        destroyed = false
    },
   
    -- Perrera Beach Motel Doors

    {
        motel_id = 'pbunit1',
        objName = 'motels_door_r',
        objYaw = 140.0,
        objCoords  = vec3(-1493.73, -668.41, 29.03),
        textCoords = vec3(-1493.73, -668.41, 29.03),
        locked = true,
        destroyed = false
    },   

    {
        motel_id = 'pbunit2',
        objName = 'motels_door_r',
        objYaw = 140.0,
        objCoords  = vec3(-1498.15, -664.78, 29.03),
        textCoords = vec3(-1498.15, -664.78, 29.03),
        locked = true,
        destroyed = false
    },   

    {
        motel_id = 'pbunit3',
        objName = 'motels_door_r',
        objYaw = 37.0,
        objCoords  = vec3(-1495.38, -661.54, 29.03),
        textCoords = vec3(-1495.38, -661.54, 29.03),
        locked = true,
        destroyed = false
    },     

    {
        motel_id = 'pbunit4',
        objName = 'motels_door_r',
        objYaw = 37.0,
        objCoords  = vec3(-1490.81, -658.21, 29.03),
        textCoords = vec3(-1490.81, -658.21, 29.03),
        locked = true,
        destroyed = false
    }, 

    {
        motel_id = 'pbunit5',
        objName = 'motels_door_r',
        objYaw = 37.0,
        objCoords  = vec3(-1486.96, -655.34, 29.58),
        textCoords = vec3(-1486.96, -655.34, 29.58),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'pbunit6',
        objName = 'motels_door_r',
        objYaw = 37.0,
        objCoords  = vec3(-1482.21, -652.02, 29.59),
        textCoords = vec3(-1482.21, -652.02, 29.59),
        locked = true,
        destroyed = false
    },      

    {
        motel_id = 'pbunit7',
        objName = 'motels_door_r',
        objYaw = 37.0,
        objCoords  = vec3(-1478.42, -649.12, 29.58),
        textCoords = vec3(-1478.42, -649.12, 29.58),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'pbunit8',
        objName = 'motels_door_r',
        objYaw = 37.0,
        objCoords  = vec3(-1473.76, -645.84, 29.58),
        textCoords = vec3(-1473.76, -645.84, 29.58),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'pbunit9',
        objName = 'motels_door_r',
        objYaw = 37.0,
        objCoords  = vec3(-1469.85, -642.94, 29.58),
        textCoords = vec3(-1469.85, -642.94, 29.58),
        locked = true,
        destroyed = false
    }, 

    {
        motel_id = 'pbunit10',
        objName = 'motels_door_r',
        objYaw = 37.0,
        objCoords  = vec3(-1465.21, -639.56, 29.58),
        textCoords = vec3(-1465.21, -639.56, 29.58),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'pbunit11',
        objName = 'motels_door_r',
        objYaw = -52.0,
        objCoords  = vec3(-1461.18, -640.78, 29.58),
        textCoords = vec3(-1461.18, -640.78, 29.58),
        locked = true,
        destroyed = false
    },                      

    {
        motel_id = 'pbunit12',
        objName = 'motels_door_r',
        objYaw = -52.0,
        objCoords  = vec3(-1452.31, -653.12, 29.58),
        textCoords = vec3(-1452.31, -653.12, 29.58),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'pbunit13',
        objName = 'motels_door_r',
        objYaw = -143.0,
        objCoords  = vec3(-1454.26, -656.00, 29.58),
        textCoords = vec3(-1454.26, -656.00, 29.58),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'pbunit14',
        objName = 'motels_door_r',
        objYaw = -143.0,
        objCoords  = vec3(-1458.79, -659.34, 29.58),
        textCoords = vec3(-1458.79, -659.34, 29.58),
        locked = true,
        destroyed = false
    }, 

    {
        motel_id = 'pbunit15',
        objName = 'motels_door_r',
        objYaw = -143.0,
        objCoords  = vec3(-1462.77, -662.21, 29.58),
        textCoords = vec3(-1462.77, -662.21, 29.58),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'pbunit16',
        objName = 'motels_door_r',
        objYaw = -143.0,
        objCoords  = vec3(-1467.23, -665.67, 29.60),
        textCoords = vec3(-1467.23, -665.67, 29.60),
        locked = true,
        destroyed = false
    }, 

    {
        motel_id = 'pbunit17',
        objName = 'motels_door_r',
        objYaw = -143.0,
        objCoords  = vec3(-1471.20, -668.52, 29.58),
        textCoords = vec3(-1471.20, -668.52, 29.58),
        locked = true,
        destroyed = false
    }, 

    {
        motel_id = 'pbunit18',
        objName = 'motels_door_r',
        objYaw = 140.0,
        objCoords  = vec3(-1490.11, -671.72, 33.38),
        textCoords = vec3(-1490.11, -671.72, 33.38),
        locked = true,
        destroyed = false
    },                         
       
    {
        motel_id = 'pbunit19',
        objName = 'motels_door_r',
        objYaw = 140.0,
        objCoords  = vec3(-1493.81, -668.36, 33.38),
        textCoords = vec3(-1493.81, -668.36, 33.38),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'pbunit20',
        objName = 'motels_door_r',
        objYaw = 140.0,
        objCoords  = vec3(-1498.20, -664.80, 33.38),
        textCoords = vec3(-1498.20, -664.80, 33.38),
        locked = true,
        destroyed = false
    }, 

    {
        motel_id = 'pbunit21',
        objName = 'motels_door_r',
        objYaw = 37.0,
        objCoords  = vec3(-1495.43, -661.59, 33.38),
        textCoords = vec3(-1495.43, -661.59, 33.38),
        locked = true,
        destroyed = false
    }, 

    {
        motel_id = 'pbunit22',
        objName = 'motels_door_r',
        objYaw = 37.0,
        objCoords  = vec3(-1491.01, -658.23, 33.38),
        textCoords = vec3(-1491.01, -658.23, 33.38),
        locked = true,
        destroyed = false
    }, 

   {
        motel_id = 'pbunit23',
        objName = 'motels_door_r',
        objYaw = 37.0,
        objCoords  = vec3(-1487.02, -655.16, 33.38),
        textCoords = vec3(-1487.02, -655.16, 33.38),
        locked = true,
        destroyed = false
    },  

   {
        motel_id = 'pbunit24',
        objName = 'motels_door_r',
        objYaw = 37.0,
        objCoords  = vec3(-1482.48, -651.90, 33.38),
        textCoords = vec3(-1482.48, -651.90, 33.38),
        locked = true,
        destroyed = false
    },

   {
        motel_id = 'pbunit25',
        objName = 'motels_door_r',
        objYaw = 37.0,
        objCoords  = vec3(-1478.44, -649.02, 33.38),
        textCoords = vec3(-1478.44, -649.02, 33.38),
        locked = true,
        destroyed = false
    },  

   {
        motel_id = 'pbunit26',
        objName = 'motels_door_r',
        objYaw = 37.0,
        objCoords  = vec3(-1473.84, -645.63, 33.38),
        textCoords = vec3(-1473.84, -645.63, 33.38),
        locked = true,
        destroyed = false
    },  

   {
        motel_id = 'pbunit27',
        objName = 'motels_door_r',
        objYaw = 37.0,
        objCoords  = vec3(-1469.88, -642.74, 33.38),
        textCoords = vec3(-1469.88, -642.74, 33.38),
        locked = true,
        destroyed = false
    },

   {
        motel_id = 'pbunit28',
        objName = 'motels_door_r',
        objYaw = 37.0,
        objCoords  = vec3(-1465.24, -639.59, 33.38),
        textCoords = vec3(-1465.24, -639.59, 33.38),
        locked = true,
        destroyed = false
    },  

   {
        motel_id = 'pbunit29',
        objName = 'motels_door_r',
        objYaw = -52.0,
        objCoords  = vec3(-1461.16, -640.59, 33.38),
        textCoords = vec3(-1461.16, -640.59, 33.38),
        locked = true,
        destroyed = false
    }, 

   {
        motel_id = 'bugged',
        objName = 'motels_door_r',
        objYaw = -52.0,
        objCoords  = vec3(-1455.62, -648.61, 33.38),
        textCoords = vec3(-1455.62, -648.61, 33.38),
        locked = true,
        destroyed = false
    },     

   {
        motel_id = 'pbunit30',
        objName = 'motels_door_r',
        objYaw = -52.0,
        objCoords  = vec3(-1452.30, -653.08, 33.38),
        textCoords = vec3(-1452.30, -653.08, 33.38),
        locked = true,
        destroyed = false
    },

   {
        motel_id = 'pbunit31',
        objName = 'motels_door_r',
        objYaw = -143.0,
        objCoords  = vec3(-1454.29, -655.98, 33.38),
        textCoords = vec3(-1454.29, -655.98, 33.38),
        locked = true,
        destroyed = false
    }, 

   {
        motel_id = 'pbunit32',
        objName = 'motels_door_r',
        objYaw = -143.0,
        objCoords  = vec3(-1458.83, -659.37, 33.38),
        textCoords = vec3(-1458.83, -659.37, 33.38),
        locked = true,
        destroyed = false
    }, 

   {
        motel_id = 'pbunit33',
        objName = 'motels_door_r',
        objYaw = -143.0,
        objCoords  = vec3(-1462.91, -662.20, 33.38),
        textCoords = vec3(-1462.91, -662.20, 33.38),
        locked = true,
        destroyed = false
    }, 

   {
        motel_id = 'pbunit34',
        objName = 'motels_door_r',
        objYaw = -143.0,
        objCoords  = vec3(-1467.28, -665.44, 33.38),
        textCoords = vec3(-1467.28, -665.44, 33.38),
        locked = true,
        destroyed = false
    },

   {
        motel_id = 'pbunit35',
        objName = 'motels_door_r',
        objYaw = -143.0,
        objCoords  = vec3(-1471.29, -668.51, 33.38),
        textCoords = vec3(-1471.29, -668.51, 33.38),
        locked = true,
        destroyed = false
    },

   {
        motel_id = 'pbunit36',
        objName = 'motels_door_r',
        objYaw = -143.0,
        objCoords  = vec3(-1475.81, -671.91, 33.38),
        textCoords = vec3(-1475.81, -671.91, 33.38),
        locked = true,
        destroyed = false
    },
	
	-- Paleto Forest    
    {
        motel_id = 'pfunit1',
        objName = 'v_ilev_mm_door',
        objYaw = 65.0,
        objCoords  = vec3(-681.74, 5770.64, 17.51),
        textCoords = vec3(-681.74, 5770.64, 17.51),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'pfunit2',
        objName = 'v_ilev_mm_door',
        objYaw = 65.0,
        objCoords  = vec3(-683.75, 5766.73, 17.51),
        textCoords = vec3(-683.75, 5766.73, 17.51),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'pfunit3',
        objName = 'v_ilev_mm_door',
        objYaw = 65.0,
        objCoords  = vec3(-685.66, 5762.86, 17.51),
        textCoords = vec3(-685.66, 5762.86, 17.51),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'pfunit4',
        objName = 'v_ilev_mm_door',
        objYaw = 65.0,
        objCoords  = vec3(-687.46, 5758.92, 17.51),
        textCoords = vec3(-687.46, 5758.92, 17.51),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'pfunit5',
        objName = 'v_ilev_mm_door',
        objYaw = 335.0,
        objCoords  = vec3(-690.34, 5759.53, 17.51),
        textCoords = vec3(-690.34, 5759.53, 17.51),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'pfunit6',
        objName = 'v_ilev_mm_door',
        objYaw = 335.0,
        objCoords  = vec3(-694.23, 5761.41, 17.51),
        textCoords = vec3(-694.23, 5761.41, 17.51),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'pfunit7',
        objName = 'v_ilev_mm_door',
        objYaw = 335.0,
        objCoords  = vec3(-698.22, 5763.23, 17.51),
        textCoords = vec3(-698.22, 5763.23, 17.51),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'pfunit8',
        objName = 'v_ilev_mm_door',
        objYaw = 335.0,
        objCoords  = vec3(-702.11, 5765.01, 17.51),
        textCoords = vec3(-702.11, 5765.01, 17.51),
        locked = true,
        destroyed = false
    },                                                                                                                

    {
        motel_id = 'pfunit9',
        objName = 'v_ilev_mm_door',
        objYaw = 335.0,
        objCoords  = vec3(-705.99, 5766.86, 17.51),
        textCoords = vec3(-705.99, 5766.86, 17.51),
        locked = true,
        destroyed = false
    },

    {
        motel_id = 'pfunit10',
        objName = 'v_ilev_mm_door',
        objYaw = 335.0,
        objCoords  = vec3(-709.90, 5768.71, 17.51),
        textCoords = vec3(-709.90, 5768.71, 17.51),
        locked = true,
        destroyed = false
    },    
	
	-- Starlite Motel Doors
	{
        motel_id = 'slunit1',
        objName = 'smokey_motel_dvere',
        objYaw = 60.0,
        objCoords  = vec3(970.86759, -200.1985, 73.5298),
        textCoords = vec3(970.86759, -200.1985, 73.5298),
        locked = true,
        destroyed = false
    },  
	
	{
        motel_id = 'slunit2',
        objName = 'smokey_motel_dvere',
        objYaw = 60.0,
        objCoords  = vec3(967.48, -205.85, 73.54),
        textCoords = vec3(967.48, -205.85, 73.54),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'slunit6',
        objName = 'smokey_motel_dvere',
        objYaw = 329.43,
        objCoords  = vec3(951.0, -210.80, 73.52),
        textCoords = vec3(951.0, -210.80, 73.52),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'slunit8',
        objName = 'smokey_motel_dvere',
        objYaw = 239.45,
        objCoords  = vec3(947.54, -205.13, 73.52),
        textCoords = vec3(951.0, -210.80, 73.52),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'slunit9',
        objName = 'smokey_motel_dvere',
        objYaw = 239.47,
        objCoords  = vec3(950.32, -200.47, 73.53),
        textCoords = vec3(950.32, -200.47, 73.53),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'slunit10',
        objName = 'smokey_motel_dvere',
        objYaw = 239.53,
        objCoords  = vec3(953.1212, -195.84, 73.54),
        textCoords = vec3(953.1212, -195.84, 73.54),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'slunit11',
        objName = 'smokey_motel_dvere',
        objYaw = 59.45,
        objCoords  = vec3(970.86, -200.20, 76.57),
        textCoords = vec3(970.86, -200.20, 76.57),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'slunit12',
        objName = 'smokey_motel_dvere',
        objYaw = 59.63,
        objCoords  = vec3(967.45, -205.85, 76.59),
        textCoords = vec3(967.45, -205.85, 76.59),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'slunit13',
        objName = 'smokey_motel_dvere',
        objYaw = 59.67,
        objCoords  = vec3(964.64, -210.51, 76.57),
        textCoords = vec3(964.64, -210.51, 76.57),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'slunit14',
        objName = 'smokey_motel_dvere',
        objYaw = 59.46,
        objCoords  = vec3(961.84, -215.13, 76.57),
        textCoords = vec3(961.84, -215.13, 76.57),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'slunit15',
        objName = 'smokey_motel_dvere',
        objYaw = 329.44,
        objCoords  = vec3(956.92, -214.33, 76.58),
        textCoords = vec3(956.92, -214.33, 76.58),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'slunit17',
        objName = 'smokey_motel_dvere',
        objYaw = 329.47,
        objCoords  = vec3(947.96, -208.99, 76.58),
        textCoords = vec3(947.96, -208.99, 76.58),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'slunit18',
        objName = 'smokey_motel_dvere',
        objYaw = 239.52,
        objCoords  = vec3(947.55, -205.14, 76.59),
        textCoords = vec3(947.55, -205.14, 76.59),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'slunit19',
        objName = 'smokey_motel_dvere',
        objYaw = 239.47,
        objCoords  = vec3(950.31, -200.47, 76.58),
        textCoords = vec3(950.31, -200.47, 76.58),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'slunit21',
        objName = 'smokey_motel_dvere',
        objYaw = 59.68,
        objCoords  = vec3(970.82, -200.17, 79.62),
        textCoords = vec3(970.82, -200.17, 79.62),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'slunit22',
        objName = 'smokey_motel_dvere',
        objYaw = 59.44,
        objCoords  = vec3(967.46, -205.87, 79.62),
        textCoords = vec3(967.46, -205.87, 79.62),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'slunit23',
        objName = 'smokey_motel_dvere',
        objYaw = 59.10,
        objCoords  = vec3(964.67, -210.51, 79.60),
        textCoords = vec3(964.67, -210.51, 79.60),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'slunit24',
        objName = 'smokey_motel_dvere',
        objYaw = 59.46,
        objCoords  = vec3(961.89, -215.16, 79.60),
        textCoords = vec3(961.89, -215.16, 79.60),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'slunit25',
        objName = 'smokey_motel_dvere',
        objYaw = 329.36,
        objCoords  = vec3(956.89, -214.35, 79.60),
        textCoords = vec3(956.89, -214.35, 79.60),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'slunit27',
        objName = 'smokey_motel_dvere',
        objYaw = 329.48,
        objCoords  = vec3(947.97, -208.97, 79.63),
        textCoords = vec3(947.97, -208.97, 79.63),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'slunit28',
        objName = 'smokey_motel_dvere',
        objYaw = 239.30,
        objCoords  = vec3(947.52, -205.11, 79.61),
        textCoords = vec3(947.52, -205.11, 79.61),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'slunit29',
        objName = 'smokey_motel_dvere',
        objYaw = 239.76,
        objCoords  = vec3(950.32, -200.48, 79.63),
        textCoords = vec3(950.32, -200.48, 79.62),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'slunit30',
        objName = 'smokey_motel_dvere',
        objYaw = 239.47,
        objCoords  = vec3(953.13, -195.84, 79.616),
        textCoords = vec3(953.13, -195.84, 79.616),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'lpunit1',
        objName = 'apa_p_mp_door_stilt_doorfrnt',
        objYaw = 20.23,
        objCoords  = vec3(-867.8, -1286.727, 6.3),
        textCoords = vec3(-867.8, -1286.727, 6.3),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'lpunit2',
        objName = 'apa_p_mp_door_stilt_doorfrnt',
        objYaw = 19.76,
        objCoords  = vec3(-901.63, -1299.02, 6.3),
        textCoords = vec3(-901.63, -1299.02, 6.3),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'lpunit3',
        objName = 'apa_p_mp_door_stilt_doorfrnt',
        objYaw = 19.78,
        objCoords  = vec3(-935.44, -1311.32, 6.3),
        textCoords = vec3(-935.44, -1311.32, 6.3),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'lpunit4',
        objName = 'apa_p_mp_door_stilt_doorfrnt',
        objYaw = 20.17,
        objCoords  = vec3(-867.81, -1286.72, 9.9),
        textCoords = vec3(-867.81, -1286.72, 9.9),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'lpunit5',
        objName = 'apa_p_mp_door_stilt_doorfrnt',
        objYaw = 20.0,
        objCoords  = vec3(-901.67, -1299.02, 9.9),
        textCoords = vec3(-901.67, -1299.02, 9.9),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'lpunit6',
        objName = 'apa_p_mp_door_stilt_doorfrnt',
        objYaw = 20.0,
        objCoords  = vec3(-935.45, -1311.32, 9.9),
        textCoords = vec3(-935.45, -1311.32, 9.9),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'lpunit7',
        objName = 'apa_p_mp_door_stilt_doorfrnt',
        objYaw = 20.14,
        objCoords  = vec3(-867.84, -1286.62, 13.4),
        textCoords = vec3(-867.84, -1286.62, 13.4),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'lpunit8',
        objName = 'apa_p_mp_door_stilt_doorfrnt',
        objYaw = 20.14,
        objCoords  = vec3(-901.67, -1298.92, 13.4),
        textCoords = vec3(-901.67, -1298.92, 13.4),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'lpunit9',
        objName = 'apa_p_mp_door_stilt_doorfrnt',
        objYaw = 20.13,
        objCoords  = vec3(-935.48, -1311.21, 13.4),
        textCoords = vec3(-935.48, -1311.21, 13.4),
        locked = true,
        destroyed = false
    }, 
	
	-- Crastenburg
	
	{
        motel_id = 'cbunit1',
        objName = -711771128,
        objYaw = 250.407,
        objCoords  = vec3(487.88, 223.07, 104.88),
        textCoords = vec3(487.88, 223.07, 104.88),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'cbunit2',
        objName = -711771128,
        objYaw = 159.9,
        objCoords  = vec3(495.97, 238.02, 104.88),
        textCoords = vec3(495.97, 238.02, 104.88),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'cbunit3',
        objName = -711771128,
        objYaw = 159.93,
        objCoords  = vec3(508.15, 233.58, 104.88),
        textCoords = vec3(508.15, 233.58, 104.88),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'cbunit4',
        objName = -711771128,
        objYaw = 159.93,
        objCoords  = vec3(520.33, 229.16, 104.88),
        textCoords = vec3(520.33, 229.16, 104.88),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'cbunit5',
        objName = -711771128,
        objYaw = 70.10,
        objCoords  = vec3(532.13, 223.01, 104.88),
        textCoords = vec3(532.13, 223.01, 104.88),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'cbunit6',
        objName = -711771128,
        objYaw = 70.10,
        objCoords  = vec3(528.01, 211.69, 104.88),
        textCoords = vec3(528.01, 211.69, 104.88),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'cbunit7',
        objName = -711771128,
        objYaw = 70.10,
        objCoords  = vec3(523.85, 200.33, 104.88),
        textCoords = vec3(523.85, 200.33, 104.88),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'cbunit8',
        objName = -711771128,
        objYaw = 340.09,
        objCoords  = vec3(517.86, 189.60, 104.88),
        textCoords = vec3(517.86, 189.60, 104.88),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'cbunit9',
        objName = -711771128,
        objYaw = 340.09,
        objCoords  = vec3(491.84, 199.07, 104.88),
        textCoords = vec3(491.84, 199.07, 104.88),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'cbunit10',
        objName = -711771128,
        objYaw = 249.95,
        objCoords  = vec3(481.21, 204.72, 104.88),
        textCoords = vec3(481.21, 204.72, 104.88),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'cbunit11',
        objName = -711771128,
        objYaw = 340.09,
        objCoords  = vec3(491.84, 199.07, 108.44),
        textCoords = vec3(491.84, 199.07, 108.44),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'cbunit12',
        objName = -711771128,
        objYaw = 249.95,
        objCoords  = vec3(481.22, 204.76, 108.44),
        textCoords = vec3(481.22, 204.76, 108.44),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'cbunit13',
        objName = -711771128,
        objYaw = 249.95,
        objCoords  = vec3(485.34, 216.04, 108.44),
        textCoords = vec3(485.34, 216.04, 108.44),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'cbunit14',
        objName = -711771128,
        objYaw = 249.95,
        objCoords  = vec3(489.52, 227.53, 108.45),
        textCoords = vec3(489.52, 227.53, 108.44),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'cbunit15',
        objName = -711771128,
        objYaw = 159.93,
        objCoords  = vec3(495.98, 238.02, 108.45),
        textCoords = vec3(495.98, 238.02, 108.45),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'cbunit16',
        objName = -711771128,
        objYaw = 159.93,
        objCoords  = vec3(508.15, 233.58, 108.44),
        textCoords = vec3(508.15, 233.58, 108.44),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'cbunit17',
        objName = -711771128,
        objYaw = 159.93,
        objCoords  = vec3(520.35, 229.13, 108.45),
        textCoords = vec3(520.35, 229.13, 108.45),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'cbunit18',
        objName = -711771128,
        objYaw = 70.10,
        objCoords  = vec3(532.12, 223.00, 108.44),
        textCoords = vec3(532.12, 223.00, 108.44),
        locked = true,
        destroyed = false
    },
	
	{
        motel_id = 'cbunit19',
        objName = -711771128,
        objYaw = 70.10,
        objCoords  = vec3(528.01, 211.73, 108.44),
        textCoords = vec3(528.01, 211.73, 108.44),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'cbunit20',
        objName = -711771128,
        objYaw = 70.10,
        objCoords  = vec3(523.86, 200.34, 108.44),
        textCoords = vec3(523.86, 200.34, 108.44),
        locked = true,
        destroyed = false
    }, 
	
	{
        motel_id = 'cbunit21',
        objName = -711771128,
        objYaw = 340.09,
        objCoords  = vec3(517.87, 189.59, 108.44),
        textCoords = vec3(517.87, 189.59, 108.44),
        locked = true,
        destroyed = false
    }
}