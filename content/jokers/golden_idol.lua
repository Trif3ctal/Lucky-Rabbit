SMODS.Joker {
    key = "golden_idol",
    atlas = "Jokers",
    pos = { x = 7, y = 10 },
    config = {
        extra = {
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
    rarity = 3,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    cost = 8,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.hand then
            local count = 0
            if context.other_card.seal and context.other_card.seal == "Gold" then
                count = count + 1
            end
            if context.other_card:is_suit("Hearts") then
                count = count + 1
            end
            if context.other_card:get_id() == 8 then
                count = count + 1
            end
            if count > 0 then
                return {
                    repetitions = count,
                }
            end
        end
    end,
}