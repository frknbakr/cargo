ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1)
    end
end)

local urunAliyorMu = false
local paketAliyorMu = false
local paketliyorMu = false
local satiyorMu = false
local satmablip = false

local locations = { --SİPARİŞ NOKTALARI
    vector4(-212.88, -1618.16, 34.87, 183.45),
    vector4(-223.15, -1617.6, 34.87, 90.52),
    vector4(-223.15, -1601.2, 34.88, 89.98),
    vector4(-223.06, -1585.81, 34.87, 96.12),
    vector4(-219.32, -1579.92, 34.87, 56.45),
    vector4(-215.66, -1576.28, 34.87, 328.55),
	vector4(-160.08, -1636.25, 34.03, 319.31),
    vector4(-161.1, -1638.77, 34.03, 139.27),
    vector4(-161.66, -1638.4, 37.25, 142.38),
    vector4(159.96, -1636.3, 37.25, 326.86),
    vector4(-150.35, -1625.66, 33.66, 235.2),
	vector4(-733.45, -317.38, 36.55, 343.73),
    vector4(-1200.24, -156.96, 40.09, 193.64),
    vector4(-1440.64, -174.37, 47.7, 93.43),
    vector4(-336.23, 30.89, 47.86, 258.93),
    vector4(-338.85, 21.43, 47.86, 258.64),
    vector4(-345.18, 17.91, 47.86, 168.13),
    vector4(-360.45, 20.89, 47.86, 174.26),
    vector4(-371.42, 23.1, 47.86, 178.76),
    vector4(-362.25, 57.76, 54.43, 2.21),
    vector4(-350.59, 57.74, 54.43, 359.38),
    vector4(-344.57, 57.55, 54.43, 354.84),
    vector4(-333.07, 57.1, 54.43, 354.49),
    vector4(-483.53, -18.08, 45.09, 176.3),
    vector4(-492.97, -17.99, 45.06, 177.8),
    vector4(-500.47, -19.27, 45.13, 218.85),
    vector4(-569.88, 169.57, 66.57, 85.5),
    vector4(-476.72, 217.54, 83.7, 177.98),
	vector4(996.89, -729.58, 57.82, 128.54),
    vector4(1207.47, -620.29, 66.44, 268.16),
    vector4(1341.31, -597.31, 74.7, 48.81),
    vector4(1389.03, -569.57, 74.5, 293.76),
    vector4(1303.21, -527.36, 71.46, 340.6),
    vector4(213.08, -592.83, 43.87, 342.72),
}



Citizen.CreateThread(function()
    while true do 
       local sleep = 2000
       Citizen.Wait(1)
       
       for k in pairs(Config.MarkerZones) do 
        local ped = PlayerPedId()
        local pedcoords = GetEntityCoords(ped)
        local UrunAlmaDistance = GetDistanceBetweenCoords(pedcoords, Config.UrunAlmaDistance.x, Config.UrunAlmaDistance.y, Config.UrunAlmaDistance.z, true)
        local PaketAlmaDistance = GetDistanceBetweenCoords(pedcoords, Config.PaketAlmaDistance.x, Config.PaketAlmaDistance.y, Config.PaketAlmaDistance.z, true)
        local PaketlemeDistance = GetDistanceBetweenCoords(pedcoords, Config.PaketlemeDistance.x, Config.PaketlemeDistance.y, Config.PaketlemeDistance.z, true)    
        local SatisDistance = GetDistanceBetweenCoords(pedcoords, Config.SatisDistance.x, Config.SatisDistance.y, Config.SatisDistance.z, true)  
        local coords = GetBlipInfoIdCoord(satmablip)  
        local distance5 = GetDistanceBetweenCoords(pedcoords, coords[1], coords[2], coords[3], true)

        if UrunAlmaDistance < 10 then
            sleep = 7
            DrawMarker(2, Config.UrunAlmaDistance.x, Config.UrunAlmaDistance.y, Config.UrunAlmaDistance.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.4, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
            if UrunAlmaDistance < 1 then
                DrawText3D(Config.UrunAlmaDistance.x, Config.UrunAlmaDistance.y, Config.UrunAlmaDistance.z + 0.4, '~g~E~s~ - Urunleri Al')
                if IsControlJustReleased(0, 38) then
                    UrunAlma()
                end
            end
        end



        if PaketAlmaDistance < 10 then
            sleep = 7
            DrawMarker(2, Config.PaketAlmaDistance.x, Config.PaketAlmaDistance.y, Config.PaketAlmaDistance.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.4, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
            if PaketAlmaDistance < 1 then
                DrawText3D(Config.PaketAlmaDistance.x, Config.PaketAlmaDistance.y, Config.PaketAlmaDistance.z + 0.4, '~g~E~s~ - Paket Al')
                if IsControlJustReleased(0, 38) then
                    PaketAlma()
                end
            end
        end

        if PaketlemeDistance < 20 then
            sleep = 7
            DrawMarker(2, Config.PaketlemeDistance.x, Config.PaketlemeDistance.y, Config.PaketlemeDistance.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.4, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
            if PaketlemeDistance < 1 then
                DrawText3D(Config.PaketlemeDistance.x, Config.PaketlemeDistance.y, Config.PaketlemeDistance.z + 0.4, '~g~E~s~ - Paketle')
                if IsControlJustReleased(0, 38) then
                    Paketleme()
                end
            end
        end

        if SatisDistance < 20 then
            sleep = 7
            DrawMarker(2, Config.SatisDistance.x, Config.SatisDistance.y, Config.SatisDistance.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.4, 255, 255, 0, 255, 0, 0, 0, 1, 0, 0, 0)       
			if SatisDistance <1 then 
				DrawText3D(Config.SatisDistance.x, Config.SatisDistance.y, Config.SatisDistance.z + 0.4, 'Teslimat icin ~g~E~s~ bas')
				if IsControlJustReleased(0, 38) then
					TriggerServerEvent('m4-kargo:teslimkontrol')
				end
			end
        end
		
											       
        if satiyorMu == true and satisCoords ~= false and distance5 < 10 then
            sleep = 7
            DrawMarker(2, coords[1], coords[2], coords[3], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
            if distance5 < 2 then
                DrawText3D(coords[1], coords[2], coords[3] + 0.4, '~g~E~s~ - Teslimatı Yap')
                if IsControlJustReleased(0, 38) then
                    TeslimatSat()
                end
            end
        end


       end
    end
end)


function UrunAlma()
    if not urunAliyorMu then 
            urunAliyorMu = true 
            exports['mythic_progbar']:Progress({
                name = "urunal",
                duration = 1200,
                label = 'Urun Alıyorsun...',
                useWhileDead = false,
                canCancel = false,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
            },           
            animation = {
                animDict = "mp_arresting",
                anim = "a_uncuff",
                flags = 49,
            },
            Citizen.Wait(3000)
        }, function(status)
            if not status then
                TriggerServerEvent('m4-kargo:urunal')
                urunAliyorMu = false
            end
        end)
    end
end


function PaketAlma()
    if not paketAliyorMu then 
            paketAliyorMu = true 
            exports['mythic_progbar']:Progress({
                name = "paketver",
                duration = 1500,
                label = 'Paket Alıyorsun...',
                useWhileDead = false,
                canCancel = false,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                },
                animation = {
                    animDict = "mp_arresting",
                    anim = "a_uncuff",
                    flags = 49,
                },
                Citizen.Wait(3000)
            }, function(status)
                if not status then
                    TriggerServerEvent('m4-kargo:paketver')
                    paketAliyorMu = false
                end
            end)
    end
end


function Paketleme()
    if not paketliyorMu then 
        --ESX.TriggerServerCallback('m4-kargo:kontrol', function()
            paketliyorMu = true 
            exports['mythic_progbar']:Progress({
                name = "paketle",
                duration = 2000,
                label = 'Paketliyorsun...',
                useWhileDead = false,
                canCancel = false,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                },
                animation = {
                    animDict = "creatures@rottweiler@tricks@",
                    anim = "petting_franklin",
                    flags = 49,
                },
                Citizen.Wait(3000)
            }, function(status)
                if not status then
                    TriggerServerEvent('m4-kargo:paketle')
                    paketliyorMu = false
                end
            end)
        --end,"urun",1)
    end
end

RegisterNetEvent('m4-kargo:teslimnoktasibelirle')
AddEventHandler('m4-kargo:teslimnoktasibelirle', function()
	if not satiyorMu then
		local random = math.random(1,#locations)
		satmablip = true
		satisCoords = {
			x = locations[random][1],
			y = locations[random][2],
			z = locations[random][3],
			h = locations[random][4]
		}
		satmablip = SatisBlipOlustur(satisCoords.x, satisCoords.y, satisCoords.z)
		satiyorMu = true
		local hash = GetHashKey('a_m_m_bevhills_01')
		while not HasModelLoaded(hash) do
		RequestModel(hash)
		Wait(20)
		end
		npc = CreatePed("PED_TYPE_CIVFEMALE", 'a_m_m_bevhills_01', satisCoords.x, satisCoords.y, satisCoords.z, satisCoords.h, false, true)
		PlaceObjectOnGroundProperly(npc)
		SetEntityAsMissionEntity(npc)
		SetBlockingOfNonTemporaryEvents(npc, true)
		FreezeEntityPosition(npc, true)
		SetEntityInvincible(npc, true)
		TaskStartScenarioAtPosition(npc, "CODE_HUMAN_CROSS_ROAD_WAIT", satisCoords.x, satisCoords.y, satisCoords.z, satisCoords.h, -1, false, false)
	else
        exports['mythic_notify']:SendAlert('error', 'Zaten dağıtımdasın!', 2500, { ['background-color'] = '#FF0000', ['color'] = '#FFFFFF' })
	end
end)



Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        if satiyorMu == false and satmablip ~= false then
            sleep = 7
			RemoveBlip(satmablip)
			satmablip = false
        end
        Citizen.Wait(sleep)
    end
end)

function TeslimatSat(item)
    exports['mythic_progbar']:Progress({
        name = "teslimat",
        duration = 3000,
        label = 'Teslimatı Yapıyorsun...',
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
		animation = {
			animDict = "anim@heists@box_carry@",
            anim = "idle",
            flags = 49,
        },
		rop = {
            model = "hei_prop_heist_box",
            bone = 60309,
            coords = { x = 0.12, y = 0.0, z = 0.001 },
            rotation = { x = -150.0, y = 0.0, z = 0.0 },
        },
    }, function(cancelled)
        if not cancelled then 
            TriggerServerEvent('m4-kargo:teslimat')
            satisCoords = false 
            satiyorMu = false 
			RemoveBlip(satmablip)
            ESX.ShowNotification('Teslimatı başarıyla Gerçekleştirdin !')
			TriggerServerEvent('m4-kargo:tekrarbaslat')
        end
    end)
end

function SatisBlipOlustur(x,y,z)
	local blip = AddBlipForCoord(x,y,z)
	SetBlipSprite(blip, 514)
	SetBlipColour(blip, 4)
	AddTextEntry('MYBLIP', "Teslimat noktası")
	BeginTextCommandSetBlipName('MYBLIP')
	AddTextComponentSubstringPlayerName(name)
	EndTextCommandSetBlipName(blip)
	return blip
end



Citizen.CreateThread(function()
	if not Config.EnableBlips then return end
        for _, v in pairs(Config.Blip) do
            v.blip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(v.blip, v.id)
            SetBlipDisplay(v.blip, 4)
            SetBlipScale(v.blip, 0.8)
            SetBlipColour(v.blip, v.colour)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.title)
            EndTextCommandSetBlipName(v.blip)
		end
end)



function helptext(text)
	SetTextComponentFormat('STRING')
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end


function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end