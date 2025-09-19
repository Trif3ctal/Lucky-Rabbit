SMODS.Joker {
    key = "low_hanging_fruit",
    config = {
        extra = {
            chips = 9,
            mult = 6
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
    end,
    rarity = 1,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    pos = { x = 5, y = 1 },
    cost = 4,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 9 or context.other_card:get_id() == 6 then
                return {
                    chips = card.ability.extra.chips,
					mult = card.ability.extra.mult,
					card = card
                }
            end
        end
    end
}