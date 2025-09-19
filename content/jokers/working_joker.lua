SMODS.Joker {
    key = "working_joker",
    config = {
        extra = {
            mult = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    atlas = "Jokers",
    pos = { x = 5, y = 6 },
    rarity = 1,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    cost = 5,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            (context.other_card:get_id() == 5 or context.other_card:get_id() == 6 or context.other_card:get_id() == 7 or context.other_card:get_id() == 8 or context.other_card:get_id() == 9) then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
}