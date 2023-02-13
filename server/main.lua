-- Bandage
ESX.RegisterUsableItem('bandage', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:bandage', source)
	if Config.Removeables.Bandage then
		xPlayer.removeInventoryItem('bandage', 1)
		xPlayer.showNotification(_U('used_bandage'))
	end
end)

RegisterServerEvent('esx_extraitems:givebandages')
AddEventHandler('esx_extraitems:givebandages', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.canCarryItem('bandage', Config.HealthKits.HealGive) then
		xPlayer.removeInventoryItem('firstaidkit', 1)
		xPlayer.showNotification(_U('used_firstaidkit'))
		xPlayer.addInventoryItem('bandage', Config.HealthKits.HealGive)
	else
		xPlayer.showNotification(_U('player_cannot_hold', 'Bandages'))
	end
end)
