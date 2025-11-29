SMODS.Joker {
    key = "skee_ball",
    config = {
        extra = {
        }
    },
    atlas = "Jokers",
    pos = { x = 8, y = 6 },
    rarity = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_fmod_raffle_card
        return {}
    end,
    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            local diamonds = 0
            local clubs = 0
            for i = 1, #context.full_hand do
                -- Debuffed cards are ok
                if context.full_hand[i]:is_suit("Diamonds", false, true) then
                    diamonds = diamonds + 1
                elseif context.full_hand[i]:is_suit("Clubs", false, true) then
                    clubs = clubs + 1
                end
            end
            if #context.full_hand >= 5 and (diamonds == #context.full_hand or clubs == #context.full_hand) then
                for i = 1, #context.full_hand do
                    local card_ = context.full_hand[i]
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                            card_:flip()
                            play_sound('card1', 1)
                            card_:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                    card_:set_ability("m_fmod_raffle_card", nil, true)
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                            card_:flip()
                            play_sound('tarot2', 0.85, 0.6)
                            card_:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end
                return {
                    message = localize{type="variable", key="a_fmod_skee", vars={#context.full_hand}},
                    colour = G.C.PURPLE
                }
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
		---@type JDJokerDefinition
		return {
			reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text1", colour = lighten(G.C.SUITS["Diamonds"], 0.35) },
            { text = ", " },
            { ref_table = "card.joker_display_values", ref_value = "localized_text2", colour = lighten(G.C.SUITS["Clubs"], 0.35) },
            { text = ")" }
        },
		calc_function = function(card)
			card.joker_display_values.localized_text1 = localize("Diamonds", 'suits_plural')
            card.joker_display_values.localized_text2 = localize("Clubs", 'suits_plural')
		end
		}
	end
}