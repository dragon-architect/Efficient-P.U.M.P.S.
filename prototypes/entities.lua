------------------
---- data.lua ----
------------------

-- Settings specific to this mod-mod
local rescale_factor = settings.startup["efficient-pumps-rescale-power-factor"].value
local scale_fpump = settings.startup["efficient-pumps-rescale-fluid-pump"].value
local burn_more = settings.startup["efficient-pumps-inefficient-burner"].value

-- Settings borrowed from OSM's P-U-M-P-S
local power_enabled = settings.startup["osm-pumps-enable-power"].value
local water_pumpjack_enabled = settings.startup["osm-pumps-enable-ground-water-pumpjacks"].value
local burner_enabled = settings.startup["osm-pumps-burner-offshore-pump"].value

--	The player is given the option to scale the power requirement of the non-offshore fluid pump to match the arithmetic progression defined by OSM's Offshore P.U.M.P.S.
--	The knock-on effect of enabling this option is that the onshore pump now requires at minimum 84kW of power to operate, and at maximum 8.4MW to operate!
--	Better make sure you have some kind of reserve energy capacity for your onshore pumps at fluid load and unload stations ;)
if scale_fpump then
	------------------------------------------------------------
	--	Vanilla (Non-Offshore) Fluid Pump
	local fpump_energy = 8400
	
	data.raw["pump"]["pump"].energy_usage = (fpump_energy / rescale_factor) .. "kW"
	------------------------------------------------------------
end

if power_enabled then
	------------------------------------------------------------
	--	Offshore Pump Tier 0
	
	local offpump_0_energy = tonumber(string.match(data.raw["assembling-machine"]["offshore-pump-0"].energy_usage, "%d+"))
	
	--	Combustion engines of ANY type have been mathematically proven to ever be capable of thermodynamic efficiency of, at most, 50%
	--	Therefore, with the "Burn more" option enabled, the burner offshore pump now has a thermodynamic efficiency of 50% compared to its electric variant
	--	Want to burn fuel at the first pump tier instead of using electricity? You're gonna require twice as much energy in fuel~
	if burner_enabled and burn_more then
		offpump_0_energy = 800
	end
	
	data.raw["assembling-machine"]["offshore-pump-0"].energy_usage = (offpump_0_energy / rescale_factor) .. "kW"
	
	------------------------------------------------------------
	--	Offshore Pump Tier 1
	
	local offpump_1_energy = tonumber(string.match(data.raw["assembling-machine"]["offshore-pump-1"].energy_usage, "%d+"))
	
	data.raw["assembling-machine"]["offshore-pump-1"].energy_usage = (offpump_1_energy / rescale_factor) .. "kW"
	
	------------------------------------------------------------
	--	Offshore Pump Tier 2
	
	local offpump_2_energy = tonumber(string.match(data.raw["assembling-machine"]["offshore-pump-2"].energy_usage, "%d+"))
	
	data.raw["assembling-machine"]["offshore-pump-2"].energy_usage = (offpump_2_energy / rescale_factor) .. "kW"
	
	------------------------------------------------------------
	--	Offshore Pump Tier 3
	
	local offpump_3_energy = tonumber(string.match(data.raw["assembling-machine"]["offshore-pump-3"].energy_usage, "%d+"))
	
	data.raw["assembling-machine"]["offshore-pump-3"].energy_usage = (offpump_3_energy / rescale_factor) .. "kW"
	
	------------------------------------------------------------
	--	Offshore Pump Tier 4
	
	local offpump_4_energy = tonumber(string.match(data.raw["assembling-machine"]["offshore-pump-4"].energy_usage, "%d+"))
	
	data.raw["assembling-machine"]["offshore-pump-4"].energy_usage = (offpump_4_energy / rescale_factor) .. "kW"
	
	------------------------------------------------------------
end

if water_pumpjack_enabled then
	--	Unlike offshore pumps, which can work on water that's right at the surface, pumpjacks have to do a LOT of lifting against gravity
	--	Thus, this places a lower bound on the amount of energy they require to do their thing
	--	So unlike offshore pumps, which the player can make more efficient, pumpjacks can only be, at most, 10x more efficient than the original Offshore P.U.M.P.S. mod defines
	if rescale_factor > 10 then
		rescale_factor = 10
	end
	------------------------------------------------------------
	
	local water_pumpjack_1 = tonumber(string.match(data.raw["assembling-machine"]["water-pumpjack-1"].energy_usage, "%d+"))
	
	data.raw["assembling-machine"]["water-pumpjack-1"].energy_usage = (water_pumpjack_1 / rescale_factor) .. "kW"
	
	------------------------------------------------------------
	
	local water_pumpjack_2 = tonumber(string.match(data.raw["assembling-machine"]["water-pumpjack-2"].energy_usage, "%d+"))
	
	data.raw["assembling-machine"]["water-pumpjack-2"].energy_usage = (water_pumpjack_2 / rescale_factor) .. "kW"
	
	------------------------------------------------------------
	
	local water_pumpjack_3 = tonumber(string.match(data.raw["assembling-machine"]["water-pumpjack-3"].energy_usage, "%d+"))
	
	data.raw["assembling-machine"]["water-pumpjack-3"].energy_usage = (water_pumpjack_3 / rescale_factor) .. "kW"
	
	------------------------------------------------------------
	
	local water_pumpjack_4 = tonumber(string.match(data.raw["assembling-machine"]["water-pumpjack-4"].energy_usage, "%d+"))
	
	data.raw["assembling-machine"]["water-pumpjack-4"].energy_usage = (water_pumpjack_4 / rescale_factor) .. "kW"
	
	------------------------------------------------------------
	
	local water_pumpjack_5 = tonumber(string.match(data.raw["assembling-machine"]["water-pumpjack-5"].energy_usage, "%d+"))
	
	data.raw["assembling-machine"]["water-pumpjack-5"].energy_usage = (water_pumpjack_5 / rescale_factor) .. "kW"
	
	------------------------------------------------------------
end