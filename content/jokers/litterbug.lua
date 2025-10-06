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
            G.E_MANAGER:add_event(Event({
                func = function()
                    local text = nil
                    selected_card = pseudorandom_element(G.hand.cards, pseudoseed('litterbug'))
                    G.hand:add_to_highlighted(selected_card, true)
                    play_sound('card1', 1)
                    if not selected_card.debuff and not SMODS.has_no_rank(selected_card) then
                        card.ability.extra.mult_gain = (0.01 * selected_card.base.nominal)
                        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                        text = true
                    end
                    if text then
                        SMODS.calculate_effect({
                            message = localize { type = "variable", key = "a_xmult", vars = { card.ability.extra.mult } },
                            card = card,
                            colour = G.C.MULT
                        }, card)
                    end
                    G.FUNCS.discard_cards_from_highlighted(nil, true)
                    return true
                end
            }))
        end
    end
}
