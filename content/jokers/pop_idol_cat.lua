SMODS.Joker {
    key = "pop_idol_cat",
    rarity = 2,
    atlas = "Jokers",
    config = {
        extra = {
            plus_chance = 1,
            plus_amt = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_lucky
        return { vars = { card.ability.extra.plus_chance } }
    end,
    unlocked = true,
    discovered = false,
    pos = { x = 2, y = 1 },
    blueprint_compat = false,
    cost = 5,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card.lucky_trigger and not context.blueprint then
            card.ability.extra.plus_amt = card.ability.extra.plus_amt + 1
            return {
                message = "+"..card.ability.extra.plus_chance,
                colour = G.C.GREEN,
                message_card = card
            }
        end
        if context.mod_probability and not context.blueprint and (context.identifier == "lucky_mult" or context.identifier == "lucky_money") then
            return {
                numerator = context.numerator + card.ability.extra.plus_amt
            }
        end
        if context.after and context.cardarea == G.jokers then
            card.ability.extra.plus_amt = 0
            return {
                message = localize("k_reset"),
                card = card
            }
        end
    end,
}