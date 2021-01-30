-- Formspecs
function get_forge_active_formspec(energy_percent, item_percent)
	return "size[8,8.5]"..
		"list[context;input;2.75,0.5;1,1;]"..
		"list[context;energy;2.75,2.5;1,1;]"..
		"image[2.75,1.5;1,1;default_furnace_fire_bg.png^[lowpart:"..
		(energy_percent)..":default_furnace_fire_fg.png]"..
		"image[3.75,1.5;1,1;gui_furnace_arrow_bg.png^[lowpart:"..
		(item_percent)..":gui_furnace_arrow_fg.png^[transformR270]"..
		"list[context;output;4.75,0.96;2,2;]"..
		"list[current_player;main;0,4.25;8,1;]"..
		"list[current_player;main;0,5.5;8,3;8]"..
		"listring[context;output]"..
		"listring[current_player;main]"..
		"listring[context;input]"..
		"listring[current_player;main]"..
		"listring[context;energy]"..
		"listring[current_player;main]"..
		default.get_hotbar_bg(0, 4.25)
end
function get_forge_inactive_formspec()
	return "size[8,8.5]"..
		"list[context;input;2.75,0.5;1,1;]"..
		"list[context;energy;2.75,2.5;1,1;]"..
		"image[2.75,1.5;1,1;default_furnace_fire_bg.png]"..
		"image[3.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
		"list[context;output;4.75,0.96;2,2;]"..
		"list[current_player;main;0,4.25;8,1;]"..
		"list[current_player;main;0,5.5;8,3;8]"..
		"listring[context;output]"..
		"listring[current_player;main]"..
		"listring[context;input]"..
		"listring[current_player;main]"..
		"listring[context;energy]"..
		"listring[current_player;main]"..
		default.get_hotbar_bg(0, 4.25)
end

-- Local callbacks for active and inactive furnace

local function can_dig(pos, player) -- Check if forge can be dug
	local meta = minetest.get_meta(pos); -- Get forge metadata
	local inv = meta:get_inventory() -- Get forge inventory
	return inv:is_empty("input") and inv:is_empty("energy") and inv:is_empty("output")
end

local function allow_metadata_inventory_put(pos, listname, index, stack, player)
	-- Protection support
	if minetest.is_protected(pos, player:get_player_name()) then 
		return 0
	end
	
	-- Check each inventory and decide if putting items is allowed
	local meta = minetest.get_meta(pos) -- Get metadata
	local inv = meta:get_inventory() -- Get inventory
	if listname == "energy" then -- If trying to put items in 'energy' inventory
		if minetest.get_item_group(stack:get_name(), "energy") > 0 then -- Only allow items with the "energy" group
			if inv:is_empty("input") then -- If input is empty
				meta:set_string("infotext", "Forge is empty")
			end
			return stack:get_count() -- Allow putting energy items in energy slots
		else
			return 0 -- Do not allow non-energy items in energy slots
		end
	elseif listname == "input" then
		return stack:get_count() -- Allow putting items in input slots and remove them from player inventory
	elseif listname == "output" then
		return 0 -- Disallow putting items in output
	end
end

local function allow_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local stack = inv:get_stack(from_list, from_index)
	return allow_metadata_inventory_put(pos, to_list, to_index, stack, player)
end

local function allow_metadata_inventory_take(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	return stack:get_count()
end

local function swap_node(pos, name) -- Function to swap forge between active and inactive
	local node = minetest.get_node(pos)
	if node.name == name then
		return
	end
	node.name = name
	minetest.swap_node(pos, node)
end

--
-- NODE TIMER
--

local function forge_node_timer(pos, elapsed)
	-- Initialize metadata
	local meta = minetest.get_meta(pos)
	local energy_time = meta:get_float("energy_time") or 0 -- Get current energy time, default 0
	local input_time = meta:get_float("input_time") or 0 -- Get input cook time, default 0
	local energy_totaltime = meta:get_float("energy_totaltime") or 0 -- Get energy total time, default 0

	local inv = meta:get_inventory() -- Get inventory lists
	local inputlist, energylist
	local output_full = false

	local timer_elapsed = meta:get_int("timer_elapsed") or 0 -- Get elapsed time
	meta:set_int("timer_elapsed", timer_elapsed + 1) -- Add one to elapsed time

	local cookable, cooktime
	local energy

	local update = true
	while elapsed > 0 and update do
		update = false

		inputlist = inv:get_list("input")
		energylist = inv:get_list("energy")
		
		-- COOKING / ENERGIZING / FORGING
		-- Check if we have cookable content
		
		--local aftercooked
		--cooked, aftercooked = minetest.get_craft_result({method = "cooking", width = 1, items = inputlist})
		--cookable = cooked.time ~= 0
		
		local cooktime = minetest.get_item_group(inv:get_stack("energy", 1):get_name(), "energy") -- Get first item from first slot in energy list with the energy group (redundant, I know)
		local cookable = cooktime ~= 0 -- cookable is true if cooked.time (cooktime) is not 0
		
		local el = math.min(elapsed, energy_totaltime - energy_time)
		if cookable then -- energy lasts long enough, adjust el to cooking duration
			el = math.min(el, cooktime - input_time)
		end

		-- Check if we have enough energy
		if energy_time < energy_totaltime then
			-- If the forge is currently active and has enough energy
			energy_time = energy_time + el
			if cookable then
			-- If there is a cookable item then check if it is ready yet
				input_time = input_time + el
				if input_time >= cooktime then
					-- Place result in dst list if possible
					if inv:room_for_item("output", cooked.item) then
						inv:add_item("output", cooked.item)
						--inv:set_stack("input", 1, aftercooked.items[1])
						inv:remove_item("input", inv:get_stack("input", 1):get_name())
						input_time = input_time - cooktime
						update = true
					else
						output_full = true
						--swap_node(pos, "froager2:forge")
					end
					-- Play cooling sound
					minetest.sound_play("default_cool_lava",
						{pos = pos, max_hear_distance = 16, gain = 0.1}, true)
				else
					-- Item could not be cooked: probably missing energy
					update = true
				end
			end
		else
			-- Forge ran out of energy
			if cookable then
				-- We need to get new energy
				--local afterfuel
				--energy, afterfuel = minetest.get_craft_result({method = "fuel", width = 1, items = energylist})
				local energytime = minetest.get_item_group(inv:get_stack("energy", 1):get_name(), "energy")
				
				if energytime == 0 then
					-- No valid energy in energy list
					energy_totaltime = 0
					input_time = 0
				else
					-- Take energy from energy list
					inv:remove_item("energy", inv:get_stack("energy", 1):get_name())
					update = true
					energy_totaltime = energytime + (energy_totaltime - energy_time)
				end
			else
				-- We don't need to get new energy since there is no cookable item
				energy_totaltime = 0
				input_time = 0
			end
			energy_time = 0
		end

		elapsed = elapsed - el
	end

	if energy and energy_totaltime > energytime then
		energy_totaltime = energytime
	end
	if inputlist and inputlist[1]:is_empty() then
		input_time = 0
	end

	--
	-- Update formspec, infotext and node
	--
	local formspec
	local item_state
	local item_percent = 0
	if cookable then
		item_percent = math.floor(input_time / cooktime * 100)
		if output_full then
			item_state = "100% (output full)"
		else
			item_state = "@1%", item_percent
		end
	else
		if inputlist and not inputlist[1]:is_empty() then
			item_state = "Not valid"
		else
			item_state = "Empty"
		end
	end

	local energy_state = "Empty"
	local active = false
	local result = false

	if energy_totaltime ~= 0 then
		active = true
		local energy_percent = 100 - math.floor(energy_time / energy_totaltime * 100)
		energy_state = energy_percent.."%"
		formspec = get_forge_active_formspec(energy_percent, item_percent) --FORMSPEC
		swap_node(pos, "froager2:forge_active")
		-- make sure timer restarts automatically
		result = true

		-- Play sound every 5 seconds while the furnace is active
		if timer_elapsed == 0 or (timer_elapsed+1) % 5 == 0 then
			minetest.sound_play("default_furnace_active",
				{pos = pos, max_hear_distance = 16, gain = 0.5}, true)
		end
	else
		if energylist and not energylist[1]:is_empty() then
			energy_state = "@1%", 0
		end
		formspec = get_forge_inactive_formspec() --FORMSPEC
		swap_node(pos, "froager2:forge")
		-- stop timer on the inactive furnace
		minetest.get_node_timer(pos):stop()
		meta:set_int("timer_elapsed", 0)
	end


	local infotext
	if active then
		infotext = "Forge active"
	else
		infotext = "Forge inactive"
	end
	infotext = infotext .. "\n" .. "(Item: "..item_state.."; Energy: "..energy_state..")"

	--
	-- Set meta values
	--
	meta:set_float("energy_totaltime", energy_totaltime)
	meta:set_float("energy_time", energy_time)
	meta:set_float("input_time", input_time)
	meta:set_string("formspec", formspec)
	meta:set_string("infotext", infotext)

	return result
end



-- Node definitions: froager2:forge, froager2:forge_active
minetest.register_node("froager2:forge", {
	description = "Forge",
	tiles = {
		"froager2_forge_top.png", "froager2_forge_bottom.png",
		"froager2_forge_side.png", "froager2_forge_side.png",
		"froager2_forge_side.png", "froager2_forge_front.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	legacy_facedir_simple = true,
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 2},
	stack_max = 1,
	
	can_dig = can_dig,

	on_timer = forge_node_timer,
	
	-- Initialize inventories and node timer on construction
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size('input', 1)
		inv:set_size('energy', 4)
		inv:set_size('output', 4)
		forge_node_timer(pos, 0)
	end,
	
	-- Handling of node timer
		on_metadata_inventory_move = function(pos)
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_metadata_inventory_put = function(pos)
		-- start timer function, it will sort out whether furnace can burn or not.
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_metadata_inventory_take = function(pos)
		-- check whether the furnace is empty or not.
		minetest.get_node_timer(pos):start(1.0)
	end,
	
	-- On rightclick
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		minetest.show_formspec( player:get_player_name(), "froager2:forge", minetest.get_meta(pos):get_string("formspec"))
	end,
	
	-- Inventory interaction
	allow_metadata_inventory_put = allow_metadata_inventory_put,
	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
})

minetest.register_node("froager2:forge_active", {
	description = "Forge",
	tiles = {
		"froager2_forge_top.png", "froager2_forge_bottom.png",
		"froager2_forge_side.png", "froager2_forge_side.png",
		"froager2_forge_side.png", { -- Forge front:
			image = "froager2_forge_front_active.png^froager2_forge_front_active_flame.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1.5
				},
			},
		}, -- Tiles
		
	paramtype2 = "facedir",	
	light_source = 8,
	drop = "froager2:forge",
	is_ground_content = false,
	legacy_facedir_simple = true,
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 2,  not_in_creative_inventory=1},
	
	can_dig = can_dig,

	-- on_timer = forge_node_timer,
	
	-- Initialize inventories and node timer on construction
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size('input', 1)
		inv:set_size('energy', 4)
		inv:set_size('output', 4)
		-- forge_node_timer(pos, 0) -- not yet implemented
	end,
	
	-- On rightclick
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		minetest.show_formspec( player:get_player_name(),	"froager2:forge", minetest.get_meta(pos):get_string("formspec"))
	end,
	
	-- Inventory interaction
	allow_metadata_inventory_put = allow_metadata_inventory_put,
	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
})

