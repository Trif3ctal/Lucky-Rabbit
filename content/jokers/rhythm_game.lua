SMODS.Joker {
	key = "rhythm_game",
	atlas = "Jokers",
	pos = { x = 1, y = 5 },
	rarity = 2,
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	config = { extra = { retriggers = 1 } },
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.other_card:is_suit("Diamonds") then
            return {
                repetitions = card.ability.extra.retriggers,
            }
        end
    end
}
