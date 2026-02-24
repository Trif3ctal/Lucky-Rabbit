SMODS.Joker {
    key = "patience",
    atlas = "Jokers",
    pos = { x = 4, y = 10 },
    config = {
        extra = {
            amt = 3,
            amt_remaining = 3
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = { key = "blue_seal", set = "Other" }
        return { vars = { card.ability.extra.amt, card.ability.extra.amt_remaining } }
    end,
    rarity = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    cost = 5,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card.seal and context.other_card.seal == "Blue" then
            if card.ability.extra.amt_remaining <= 1 then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    if not context.blueprint then
                        card.ability.extra.amt_remaining = card.ability.extra.amt
                    end
                    return {
                        extra = {
                            message = localize('k_plus_planet'),
                            message_card = card,
                            colour = G.C.SECONDARY_SET.Planet,
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        if G.GAME.current_round.most_played_poker_hand then
                                            local _planet = nil
                                            for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                                                if v.config.hand_type == G.GAME.current_round.most_played_poker_hand then
                                                    _planet = v.key
                                                end
                                            end
                                            if _planet then
                                                SMODS.add_card({ key = _planet, area = G.consumeables })
                                                G.GAME.consumeable_buffer = 0
                                            end
                                        end
                                        return true
                                    end
                                }))
                                return true
                            end
                        }
                    }
                end
            elseif not context.blueprint then
                card.ability.extra.amt_remaining = card.ability.extra.amt_remaining - 1
                return nil, true
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
		---@type JDJokerDefinition
		return {
			reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = lighten(G.C.BLUE, 0.35) },
            { text = ")" }
        },
		calc_function = function(card)
			card.joker_display_values.localized_text = localize{ type = "name_text", set = "Other", key = "blue_seal" }
		end
		}
	end
}