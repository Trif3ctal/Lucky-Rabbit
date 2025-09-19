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
    end
}