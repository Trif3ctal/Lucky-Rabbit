SMODS.Joker{
    key = "hyperfixation",
    config = {
        extra = {
            retriggers = 0,
            inc = 1,
            amt_needed = 5,
            current_amt = 5,
        }
    },
    loc_vars = function(self, info_queue, card)
        if not G.GAME.hyperfix_card then
            G.GAME.hyperfix_card = {
                rank = 'Ace',
                suit = 'Spades'
            }
        end
        if not G.GAME.current_round.hyperfix_card then
            G.GAME.current_round.hyperfix_card = {
                rank = '2'
            }
        end
        return {
            vars = {
                localize(G.GAME.hyperfix_card.rank, 'ranks'),
                localize(G.GAME.hyperfix_card.suit, 'suits_plural'),
                card.ability.extra.retriggers,
                localize(G.GAME.current_round.hyperfix_card.rank, 'ranks'),
                card.ability.extra.amt_needed,
                card.ability.extra.current_amt,
                card.ability.extra.retriggers == 1 and "" or "s",
                colours = {G.C.SUITS[G.GAME.hyperfix_card.suit]}
            }
        }
    end,
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pos = { x = 1, y = 1 },
    cost = 6,
    blueprint_compat = true,
    perishable_compat = false,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            local hyperfix_id = SMODS.Ranks[G.GAME.hyperfix_card.rank].id
            if context.other_card:get_id() == hyperfix_id and
            context.other_card:is_suit(G.GAME.hyperfix_card.suit) then
                if card.ability.extra.retriggers > 0 then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = card.ability.extra.retriggers,
                        card = card
                    }
                end
            end
        end
        if context.individual and context.cardarea == G.play and not context.blueprint then
            local current_round_id =
                G.GAME.current_round.hyperfix_card.rank and SMODS.Ranks[G.GAME.current_round.hyperfix_card.rank].id
            if context.other_card:get_id() == current_round_id then
                card.ability.extra.current_amt = card.ability.extra.current_amt - 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up()
                        return true
                    end
                }))
                if card.ability.extra.current_amt == 0 then
                    card.ability.extra.current_amt = card.ability.extra.amt_needed
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = 'retriggers',
                        scalar_value = 'inc',
                    })
                end
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            extra = {
                    { text = "(" },
                    { ref_table = "card.joker_display_values", ref_value = "hyperfix_card", colour = G.C.FILTER },
                    { text = ")" },
            },
            reminder_text = {
                {
                    { text = "(" },
                    { ref_table = "card.joker_display_values", ref_value = "hyperfix_current_card", colour = G.C.ORANGE },
                    { text = ")" },
                }
            },
            calc_function = function(card)
                card.joker_display_values.hyperfix_current_card = localize(G.GAME.current_round.hyperfix_card.rank, 'ranks')
                card.joker_display_values.hyperfix_card = localize { type = 'variable', key = "jdis_rank_of_suit", vars = { localize(G.GAME.hyperfix_card.rank, 'ranks'), localize(G.GAME.hyperfix_card.suit, 'suits_plural') } }
            end,
            retrigger_function = function(card, scoring_hand, held_in_hand, joker_card)
                if held_in_hand then return 0 end
                local hyperfix_id = SMODS.Ranks[G.GAME.hyperfix_card.rank].id
                return card:get_id() == hyperfix_id and card:is_suit(G.GAME.hyperfix_card.suit) and joker_card.ability.extra.retriggers * JokerDisplay.calculate_joker_triggers(joker_card) or 0
            end
        }
    end
}