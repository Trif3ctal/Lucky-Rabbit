SMODS.Joker {
	key = "master_of_disguise",
	atlas = "Jokers",
	pos = { x = 0, y = 10 },
	rarity = 2,
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	config = { extra = { } },
	loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.c_world
        info_queue[#info_queue+1] = G.P_CENTERS.c_sun
        info_queue[#info_queue+1] = G.P_CENTERS.c_moon
        info_queue[#info_queue+1] = G.P_CENTERS.c_star
	end,
	calculate = function(self, card, context)
		if context.joker_main and context.scoring_name == "High Card" and context.cardarea == G.jokers then
            if not SMODS.has_no_rank(context.scoring_hand[1]) and #G.consumeables.cards < G.consumeables.config.card_limit then
                for _, center in pairs(G.P_CENTER_POOLS.Consumeables) do
                    if center.config and center.config.suit_conv == context.scoring_hand[1].base.suit then
                        if not (center["hidden"] or (G.GAME and G.GAME["hidden"] and G.GAME["hidden"][center]) or false) then
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                delay = 0.3,
                                func = function()
                                    SMODS.add_card({ area = G.consumeables, soulable = false, key = center.key })
                                    G.GAME.consumeable_buffer = 0
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                    end
                end
            end
        end
	end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
                { text = ")" },
            },
            calc_function = function(card)
                card.joker_display_values.localized_text = localize('High Card', 'poker_hands')
            end
        }
    end
}
