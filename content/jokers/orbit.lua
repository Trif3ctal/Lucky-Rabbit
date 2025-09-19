SMODS.Joker {
	key = 'orbit',
	atlas = 'Jokers',
	pos = { x = 7, y = 2 },
	rarity = 1,
	cost = 4,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}}
        return { vars = { } }
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.cardarea == G.jokers and #G.consumeables.cards > 0 then
            for i = 1, #G.consumeables.cards do
                if G.consumeables.cards[i].ability.set == "Planet" and (not G.consumeables.cards[i].edition or G.consumeables.cards[i].edition.key ~= "e_negative") then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local _card = SMODS.add_card{
                                set = "Planet",
                                key_append = "orbit",
                                edition = "e_negative"
                            }
                            _card.ability.fmod_halve = true
                            _card:set_cost()
                            return true
                        end
                    }))
                    return {
                        message = localize("k_fmod_planet_orbit"),
                        colour = G.C.SECONDARY_SET.Planet
                    }
                end
            end
        end
    end
}

