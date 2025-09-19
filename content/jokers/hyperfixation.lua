SMODS.Joker{
    key = "hyperfixation",
    config = {
        extra = {
            retriggers = 0,
            amt_needed = 5,
            current_amt = 5,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                localize(G.GAME.hyperfix_card.rank, 'ranks'), 
                localize(G.GAME.hyperfix_card.suit, 'suits_plural'),
                card.ability.extra.retriggers,
                G.GAME.current_round.hyperfix_card.rank and localize(G.GAME.current_round.hyperfix_card.rank, 'ranks') or 'None',
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
                    card.ability.extra.retriggers = card.ability.extra.retriggers + 1
                    -- (same as Wee)
                    return {
                        extra = {focus = card, message = localize('k_upgrade_ex')},
                        card = card,
                    }
                end
            end
        end
    end
}