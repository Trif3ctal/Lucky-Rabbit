SMODS.Joker {
	key = "commission",
	atlas = "Jokers",
	pos = { x = 0, y = 9 },
	rarity = 2,
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	config = { extra = { max = 15 } },
	loc_vars = function(self, info_queue, card)
        local main_end = {}
        if G.jokers and G.jokers.cards then
            for _, joker in ipairs(G.jokers.cards) do
                if joker.edition and joker.edition.negative then
                    localize { type = 'other', key = 'remove_negative', nodes = main_end, vars = {} }
                    break
                end
            end
        end
        return { vars = { card.ability.extra.max }, main_end = main_end[1] }
	end,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            if my_pos and G.jokers.cards[my_pos - 1] and not SMODS.is_eternal(G.jokers.cards[my_pos - 1], card) and not G.jokers.cards[my_pos - 1].getting_sliced then
                local sliced_card = G.jokers.cards[my_pos - 1]
                sliced_card.getting_sliced = true -- Make sure to do this on destruction effects
                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                card.sell_cost = card.sell_cost + sliced_card.sell_cost
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.joker_buffer = 0
                        card:juice_up(0.8, 0.8)
                        sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
                        play_sound('slice1', 0.96 + math.random() * 0.08)
                        return true
                    end
                }))
                SMODS.calculate_effect({
                    message = localize { type = 'variable', key = 'a_fmod_money', vars = { sliced_card.sell_cost } },
                    colour = G.C.MONEY,
                }, card)
            end
            if card.sell_cost >= card.ability.extra.max and not context.blueprint then
                local jokers = {}
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] ~= card then
                        jokers[#jokers + 1] = G.jokers.cards[i]
                    end
                end
                if #jokers > 0 then
                    if #G.jokers.cards <= G.jokers.config.card_limit then
                        if G.jokers.cards[my_pos + 1] then
                            local chosen_joker = G.jokers.cards[my_pos + 1]
                            local copied_joker = copy_card(chosen_joker, nil, nil, nil,
                                chosen_joker.edition and chosen_joker.edition.negative)
                            if copied_joker.ability.invis_rounds then copied_joker.ability.invis_rounds = 0 end
                            if type(copied_joker.ability.extra) == "table" and copied_joker.ability.extra.invis_rounds then copied_joker.ability.extra.invis_rounds = 0 end
                            copied_joker:add_to_deck()
                            G.jokers:emplace(copied_joker)
                            return {
                                message = localize('k_duplicated_ex'),
                                func = function()
                                    G.E_MANAGER:add_event(Event({
                                        trigger = 'before',
                                        delay = 0.75,
                                        func = function()
                                            card:start_dissolve()
                                            return true
                                        end
                                    }))
                                end
                            }
                        else
                            return { message = localize('k_no_other_jokers') }
                        end
                    else
                        return { message = localize('k_no_room_ex') }
                    end
                else
                    return { message = localize('k_no_other_jokers') }
                end
            end
        end
	end,
	joker_display_def = function(JokerDisplay)
		---@type JDJokerDefinition
		return {
            reminder_text = {
                { text = "(" },
                { text = "$",         colour = G.C.GOLD },
                { ref_table = "card", ref_value = "sell_cost", colour = G.C.GOLD },
                { text = ")" },
            },
            reminder_text_config = { scale = 0.35 },
        }
	end
}
