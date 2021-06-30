local callbacks = fatality.callbacks;
local render = fatality.render;
local menu = fatality.menu;

local fonts = render:create_font("Visitor TT2 BRK", 9, 500, true);
local textColor = csgo.color(235, 235, 235, 255);

local function on_paint()
	local entity_list = csgo.interface_handler:get_entity_list();
	local add = 0;
	for i = 0, entity_list:get_max_entities(), 1 do
        local entity = entity_list:get_entity(i);
        
		if not entity or entity:is_player() then goto continue; end
		
		local entityId = entity:get_var_int("CBaseEntity->m_nModelIndex");
		
		local grenadeName = "";
		if entityId == 121 then
			grenadeName = "smoke";
		elseif entityId == 123 or entityId == 124 then
			grenadeName = "inferno";
		--elseif entityId == 126 then
		--	grenadeName = "he grenade";
		elseif entityId == 127 then
			grenadeName = "flash";
		elseif entityId == 128 then
			grenadeName = "decoy";
		else
			goto continue; 
		end
		
		entityPos = entity:get_var_vector("CBaseEntity->m_vecOrigin");
		entityPos:to_screen();
		
		local textSize = render:text_size(fonts, grenadeName);
		render:text(fonts, entityPos.x - textSize.x / 2, entityPos.y - textSize.y / 2, grenadeName, textColor);
		::continue::
    end
end

callbacks:add("paint", on_paint);