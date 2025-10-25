SMODS.Joker {
    key = "backpack_hero",
    config = {
        extra = {
            xmult = 1,
            gain = 0.05,
            played = {}
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.gain, card.ability.extra.xmult } }
    end,
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pos = { x = 3, y = 8 },
    blueprint_compat = true,
    cost = 6,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if not SMODS.has_no_suit(context.other_card) and not SMODS.has_no_rank(context.other_card) then
                for k, v in pairs(card.ability.extra.played) do
                    if v == context.other_card.base.name then
                        return
                    end
                end
                table.insert(card.ability.extra.played, context.other_card.base.name)
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'xmult',
                    scalar_value = 'gain',
                })
            end
        end
        if context.joker_main and card.ability.extra.xmult > 1 then
            return {
                xmult = card.ability.extra.xmult,
            }
        end
    end
}