SMODS.Joker {
	key = "prodigy_child",
	atlas = "Jokers",
	pos = { x = 1, y = 8 },
	rarity = 2,
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	config = { extra = { mult = 25, odds = 3 } },
    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'fmod_prodigy')
        return { vars = { card.ability.extra.mult, num, denom } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
        if context.after and not context.blueprint then
            for i = 1, #context.scoring_hand do
                local valid_pairs = {}
                local _card = context.scoring_hand[i]
                if SMODS.pseudorandom_probability(card, "prodigy_child", 1, card.ability.extra.odds) then
                    -- card choosing
                    if not SMODS.has_no_rank(_card) then
                        table.insert(valid_pairs, "rank")
                    end
                    if not SMODS.has_no_suit(_card) then
                        table.insert(valid_pairs, "suit")
                    end
                    if next(SMODS.get_enhancements(_card)) then
                        table.insert(valid_pairs, "enhancement")
                    end
                    if _card.seal then
                        table.insert(valid_pairs, "seal")
                    end

                    if #valid_pairs > 0 then
                        -- card changing
                        local mod = pseudorandom_element(valid_pairs, 'prodigy_child_pair')
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.15,
                            func = function()
                                _card:flip()
                                play_sound('card1', 1)
                                _card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                        if mod == "seal" then
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    _card:set_seal(SMODS.poll_seal({ guaranteed = true, key = 'prodigy_child_seal' }))
                                    return true
                                end
                            }))
                        elseif mod == "enhancement" then
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    _card:set_ability(SMODS.poll_enhancement({
                                        guaranteed = true,
                                        key =
                                        'prodigy_child_enh'
                                    }), nil, true)
                                    card:juice_up()
                                    return true
                                end
                            }))
                        elseif mod == "rank" then
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    assert(SMODS.change_base(_card, nil,
                                        pseudorandom_element(SMODS.Ranks, 'prodigy_child_rank')
                                        .key))
                                    card:juice_up()
                                    return true
                                end
                            }))
                        elseif mod == "suit" then
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    assert(SMODS.change_base(_card,
                                        pseudorandom_element(SMODS.Suits, 'prodigy_child_suit').key))
                                    card:juice_up()
                                    return true
                                end
                            }))
                        end
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.15,
                            func = function()
                                _card:flip()
                                play_sound('tarot2', 0.85, 0.6)
                                _card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                end
            end
            delay(0.2)
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+" },
                { ref_table = "card.ability.extra", ref_value = "mult" }
            },
            extra = {
                {
                    { text = "(" },
                    { ref_table = "card.joker_display_values", ref_value = "probability" },
                    { text = ")" }
                }
            },
            text_config = { colour = G.C.MULT },
            extra_config = { colour = G.C.GREEN, scale = 0.3 },
            calc_function = function(card)
                local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'fmod_prodigy')
                card.joker_display_values.probability = localize { type = 'variable', key = "jdis_odds", vars = { num, denom } }
            end
        }
    end,
}
