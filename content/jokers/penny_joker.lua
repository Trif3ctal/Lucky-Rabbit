SMODS.Joker {
    key = "penny_joker",
    config = {
        extra = {
            chips = 0,
            chip_gain = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_gain } }
    end,
    rarity = 1,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pos = { x = 4, y = 0 },
    blueprint_compat = true,
    cost = 4,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = 'chips',
                scalar_value = 'chip_gain',
            })
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
            }
        end
    end
}