PlayerData, localhandling, invehicle, gtirehealth, turboconfig, ecu, indyno, efficiency, upgrade, stats, tune, ramp, engineswapper, winches, manual, zoffset, mode, lastdis, boostpergear, handlingcache, fInitialDriveMaxFlatVel, fDriveInertia, fInitialDriveForce, nInitialDriveGears, tiresave, vehiclestats, vehicletires, mileages, imagepath , tuning_inertia = {}, {}, false, nil, nil, nil, false, 1.0, {}, {}, {}, 0, nil, {}, false, 1, 'NORMAL', 0, {}, {}, nil, nil, nil, nil, 0, {}, {}, {}, 'nui://ox_inventory/web/images/', nil

if GetResourceState('es_extended') == 'started' then
	ESX = exports['es_extended']:getSharedObject()
	PlayerData = ESX.GetPlayerData()
	local access = not config.job or PlayerData?.job?.name == config.job
	if lib.addRadialItem and access then
		SetTimeout(100,function()
			return HasRadialMenu()
		end)
	end

	RegisterNetEvent('esx:playerLoaded', function(xPlayer)
		PlayerData = xPlayer
		return HasRadialMenu()
	end)

	RegisterNetEvent('esx:setJob', function(job)
		PlayerData.job = job
		HasRadialMenu()
	end)

elseif GetResourceState('qb-core') == 'started' then
	QBCore = exports['qb-core']:GetCoreObject()
	PlayerData = QBCore.Functions.GetPlayerData()
	local access = not config.job or PlayerData?.job?.name == config.job
	if lib.addRadialItem and access then
		SetTimeout(100,function()
			return HasRadialMenu()
		end)
	end
	RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
		PlayerData = QBCore.Functions.GetPlayerData()
		return HasRadialMenu()
	end)

	RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
		PlayerData.job = job
		HasRadialMenu()
	end)
	imagepath = 'nui://qb-inventory/html/images/'
else -- standalone ?
	PlayerData = {job = 'mechanic'}
	if lib.addRadialItem then HasRadialMenu() end
end