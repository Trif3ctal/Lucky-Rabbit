SMODS.Joker {
    key = "charity",
    atlas = "Jokers",
    pos = { x = 1, y = 10 },
    config = {
        extra = {
            odds = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = { key = "gold_seal", set = "Other" }
        local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'fmod_charity')
        return { vars = { num, denom } }
    end,
    rarity = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    cost = 5,
    calculate = function(self, card, context)
        if context.after and context.main_eval and not context.blueprint then
            for _, playingcard in ipairs(context.scoring_hand) do
                local cards = {}
                if playingcard.seal and playingcard.seal == "Gold" then
                    for _, card_ in ipairs(context.scoring_hand) do
                        if card_ ~= playingcard and not (card_.seal and card_.seal == "Gold") then
                            cards[#cards + 1] = card_
                        end
                    end
                end
                if #cards > 0 and SMODS.pseudorandom_probability(card, 'charity', 1, card.ability.extra.odds) then
                    local card_ = pseudorandom_element(cards, "charity")
                    if card_ then
                        G.E_MANAGER:add_event(Event({
                            delay = 0.4,
                            trigger = 'after',
                            func = function()
                                card_:set_seal('Gold', nil, true)
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                        delay(0.3)
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
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = lighten(G.C.GOLD, 0.35) },
            { text = ")" }
        },
		calc_function = function(card)
			card.joker_display_values.localized_text = localize{ type = "name_text", set = "Other", key = "gold_seal" }
		end
		}
	end
}