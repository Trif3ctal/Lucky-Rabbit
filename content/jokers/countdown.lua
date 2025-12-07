SMODS.Joker {
    key = "countdown",
    config = {
        extra = {
            rank = 13,
            mult = 15,
            xmult = 3
        }
    },
    loc_vars = function(self, info_queue, card)
        local rank = nil
        if card.ability.extra.rank == 14 then
            rank = localize("Ace", "ranks")
        elseif card.ability.extra.rank == 13 then
            rank = localize("King", "ranks")
        elseif card.ability.extra.rank == 12 then
            rank = localize("Queen", "ranks")
        elseif card.ability.extra.rank == 11 then
            rank = localize("Jack", "ranks")
        else
            rank = card.ability.extra.rank
        end
        return { vars = { rank, card.ability.extra.mult, localize("Ace", "ranks"), card.ability.extra.xmult } }
    end,
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    pos = { x = 3, y = 0 },
    cost = 5,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == card.ability.extra.rank then
                local ret = {}
                if card.ability.extra.rank == 14 then
                    if not context.blueprint then card.ability.extra.rank = card.ability.extra.rank - 1 end
                    ret = {
                        message = localize("k_reset"),
                        mult = card.ability.extra.mult,
                        xmult = card.ability.extra.xmult,
                        message_card = context.blueprint_card or card
                    }
                    return ret
                elseif card.ability.extra.rank == 2 and not context.blueprint then
                    card.ability.extra.rank = 14
                elseif not context.blueprint then card.ability.extra.rank = card.ability.extra.rank - 1 end
                ret = {
                    mult = card.ability.extra.mult,
                    message_card = context.blueprint_card or card,
                }
                return ret
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = { {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "xmult", retrigger_type = "mult" }
                }
            }
            },
            extra = {
                {
                    { text = "+", colour = G.C.MULT },
                    { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult", colour = G.C.MULT } 
                },
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "rank" },
                { text = ")" },
            },
            calc_function = function(card)
                local mult = 0
                local xmult = 1
                local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
                local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
                local inc = 0
                if text ~= "Unknown" then
                    for k, v in pairs(scoring_hand) do
                        if v:get_id() == 14 then
                            xmult = 3
                        end
                        if v:get_id() == card.ability.extra.rank - inc then
                            mult = mult + card.ability.extra.mult * JokerDisplay.calculate_card_triggers(v, scoring_hand)
                            inc = inc + 1
                        end
                    end
                end
                card.joker_display_values.mult = mult
                card.joker_display_values.xmult = xmult

                local rank = nil
                if card.ability.extra.rank == 14 then
                    rank = localize("Ace", "ranks")
                elseif card.ability.extra.rank == 13 then
                    rank = localize("King", "ranks")
                elseif card.ability.extra.rank == 12 then
                    rank = localize("Queen", "ranks")
                elseif card.ability.extra.rank == 11 then
                    rank = localize("Jack", "ranks")
                else
                    rank = card.ability.extra.rank
                end
                card.joker_display_values.rank = rank
            end
        }
    end
}