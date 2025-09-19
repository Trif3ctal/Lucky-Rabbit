SMODS.Joker{
    key = "wordle",
    config = {
        extra = {
            chip_gain = 5,
            chips = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chip_gain, card.ability.extra.chips } }
    end,
    rarity = 1,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pos = { x = 9, y = 1 },
    cost = 4,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                card = card
            }
        end
        if context.before and context.main_eval and not context.blueprint then
            for _, playingcard in ipairs(context.scoring_hand) do
                if not SMODS.has_no_rank(playingcard) and not playingcard.debuff and playingcard:get_id() == 3
                or playingcard:get_id() == 7 or playingcard:get_id() == 8
                or playingcard:get_id() == 12 then
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
                    return {
                        message = localize("k_upgrade_ex"),
                        colour = G.C.CHIPS,
                        card = card
                    }
                end
            end
        end
    end
}