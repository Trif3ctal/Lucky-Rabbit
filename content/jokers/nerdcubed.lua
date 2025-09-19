SMODS.Joker{
    key = "nerdcubed",
    config = {
        extra = {
            repetitions = 3
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.repetitions } }
    end,
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    pos = { x = 2, y = 2 },
    cost = 7,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and not context.repetition_only then
            if context.other_card:get_id() == 3 then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.repetitions,
                    message_card = card
                }
            end
        end
    end
}