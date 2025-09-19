SMODS.Joker{
    key = "jazzercise",
    config = {
        extra = {
            destroy = 5,
            destroy_amt = 5,
            h_size = 0,
            h_inc = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.h_inc, card.ability.extra.destroy, card.ability.extra.destroy_amt, card.ability.extra.h_size } }
    end,
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pixel_size = { w = 64, h = 95 },
    pos = { x = 9, y = 2 },
    cost = 4,
    blueprint_compat = false,
    calculate = function(self, card, context)
        if context.remove_playing_cards and not context.blueprint then
            for i = 1, #context.removed do
                if card.ability.extra.destroy_amt <= 1 then
                    card.ability.extra.h_size = card.ability.extra.h_size + card.ability.extra.h_inc
                    card.ability.extra.destroy_amt = card.ability.extra.destroy
                    G.hand:change_size(card.ability.extra.h_inc)
                    if #G.hand.cards > 1 then
                        G.FUNCS.draw_from_deck_to_hand(card.ability.extra.h_inc)
                    end
                    return {
                        delay = 0.2,
                        message = localize{type = 'variable',key = 'a_handsize', vars = {card.ability.extra.h_inc}}, 
                        colour = G.C.ORANGE
                    }
                else
                    card.ability.extra.destroy_amt = card.ability.extra.destroy_amt - 1
                end
            end
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end
}