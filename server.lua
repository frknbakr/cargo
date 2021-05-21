ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('m4-kargo:urunal')
AddEventHandler('m4-kargo:urunal',function()
    local src = source
    local player = ESX.GetPlayerFromId(src)
    if player.canCarryItem('urun', 1) then
        player.addInventoryItem('urun', 1)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'Üzerinde yer yok', style = { ['background-color'] = '#FF0000', ['color'] = '#FFFFFF' } })

    end

end)


RegisterServerEvent('m4-kargo:paketver')
AddEventHandler('m4-kargo:paketver',function()
    local src = source
    local player = ESX.GetPlayerFromId(src)
    if player.canCarryItem('paket', 1) then 
        player.addInventoryItem('paket', 1)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'Üzerinde yer yok', style = { ['background-color'] = '#FF0000', ['color'] = '#FFFFFF' } })
    end
end)

RegisterServerEvent('m4-kargo:paketle')
AddEventHandler('m4-kargo:paketle',function()
    local src = source
    local player = ESX.GetPlayerFromId(src)
    if player.getInventoryItem('urun', 1).count >= 1 then
        if player.getInventoryItem('paket', 1).count >= 1 then 
            if player.canCarryItem('kargopaketi', 1) then 
                player.removeInventoryItem('urun', 1)
                Citizen.Wait(250)
                player.removeInventoryItem('paket', 1)
                Citizen.Wait(500)
                player.addInventoryItem('kargopaketi', 1 )
            else 
                TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'Üzerinde yer yok', style = { ['background-color'] = '#FF0000', ['color'] = '#FFFFFF' } })
            end
        else 
            TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'Üzerinde yeterli paket yok!', style = { ['background-color'] = '#FF0000', ['color'] = '#FFFFFF' } })
        end
    else 
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'Üzerinde yeterli ürün yok!', style = { ['background-color'] = '#FF0000', ['color'] = '#FFFFFF' } })
    end
end)


RegisterServerEvent('m4-kargo:teslimat')
AddEventHandler('m4-kargo:teslimat',function(item)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src) 
    local money = math.random(Config.MinPara , Config.MaxPara)
        if xPlayer.getInventoryItem('kargopaketi').count ~= 0  then 
            xPlayer.removeInventoryItem('kargopaketi' , 1)
            Citizen.Wait(500)
            xPlayer.addMoney(money)
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Üzerinde yeterli '..name..' yok!', style = { ['background-color'] = '#FF0000', ['color'] = '#FFFFFF' } })

        end
end)

RegisterServerEvent('m4-kargo:teslimkontrol')
AddEventHandler('m4-kargo:teslimkontrol', function()
	local xPlayer = ESX.GetPlayerFromId(source)

		if xPlayer.getInventoryItem('kargopaketi').count >= 1 then
			TriggerClientEvent('m4-kargo:teslimnoktasibelirle',source)
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'succes', text = 'Dağıtıma çıktın!', style = { ['background-color'] = '#FF0000', ['color'] = '#FFFFFF' } })
		else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Üzerinde kargo paketi yok!', style = { ['background-color'] = '#FF0000', ['color'] = '#FFFFFF' } })

		end
end)


RegisterServerEvent('m4-kargo:tekrarbaslat')
AddEventHandler('m4-kargo:tekrarbaslat', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getInventoryItem('kargopaketi').count >= 1 then
		TriggerClientEvent('m4-kargo:teslimnoktasibelirle', source)
	else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'succes', text = 'Üzerinde kargo paketi kalmadı , satış bitti !', style = { ['background-color'] = '#FF0000', ['color'] = '#FFFFFF' } })
	end
end)


ESX.RegisterServerCallback('m4-kargo:kontrol',function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local count = xPlayer.getInventoryItem(item).count
    local name = xPlayer.getInventoryItem(item).label
	
    if xPlayer.getInventoryItem('kargopaketi').count >= 1 then
			TriggerClientEvent('m4-kargo:teslimnoktasibelirle',source)
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'succes', text = 'Teslimata çıktın!', style = { ['background-color'] = '#FF0000', ['color'] = '#FFFFFF' } })
		else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'succes', text = 'Üzerinde kargo paketi yok', style = { ['background-color'] = '#FF0000', ['color'] = '#FFFFFF' } })
		end
end)