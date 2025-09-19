SMODS.Joker{
    key = "impractical_joker",
    config = {
        extra = {
            mult = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pixel_size = { w = 71, h = 80 },
    pos = { x = 7, y = 0 },
    cost = 4,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local temp_ID = 15
            local raised_card = nil
            for i = 1, #context.scoring_hand do
                if temp_ID > context.scoring_hand[i].base.id and not SMODS.has_no_rank(context.scoring_hand[i]) then
                    temp_ID = context.scoring_hand[i].base.id
                    raised_card = context.scoring_hand[i]
                end
            end
            if raised_card == context.other_card then
                return {
                    x_mult = card.ability.extra.mult,
                    colour = G.C.RED,
                    card = card
                }
            end
        end
    end
}