SMODS.Joker {
    key = 'litterbug',
    config = {
        extra = {
            mult = 1,
            base = 0.01,
            mult_gain = 0.01,
            discard = 1
        }
    },
    rarity = 2,
    atlas = 'Jokers',
    pos = { x = 8, y = 3 },
    discovered = false,
    blueprint_compat = true,
    perishable_compat = false,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.base, card.ability.extra.discard } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.mult > 1 then
            return {
                xmult = card.ability.extra.mult,
                card = card
            }
        end
        if context.press_play and #G.hand.cards - #G.hand.highlighted > 0 then
            local selected_card = nil
            local cards = {}
            G.E_MANAGER:add_event(Event({
                func = function()
                    for i = 1, #G.hand.cards do
                        if not G.hand.cards[i].highlighted then
                            table.insert(cards, G.hand.cards[i])
                        end
                    end
                    selected_card = pseudorandom_element(cards, 'litterbug')
                    if selected_card then
                        if not selected_card.highlighted then
                            G.hand:add_to_highlighted(selected_card, true)
                        end
                        play_sound('card1', 1)
                        if not selected_card.debuff and not SMODS.has_no_rank(selected_card) then
                            card.ability.extra.mult_gain = (0.01 * selected_card.base.nominal)
                            SMODS.scale_card(card, {
                                ref_table = card.ability.extra,
                                ref_value = 'mult',
                                scalar_value = 'mult_gain',
                                message_key = 'a_xmult',
                            })
                        end
                    end
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            if card == SMODS.find_card('j_fmod_litterbug')[#SMODS.find_card('j_fmod_litterbug')] then G.FUNCS.discard_cards_from_highlighted(nil, true) end
                            return true
                        end
                    }))
                    return true
                end
            }))
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "exp" }
                    }
                }
            },
        }
    end,
}
