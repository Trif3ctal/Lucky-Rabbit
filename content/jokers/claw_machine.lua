SMODS.Joker{
	key = 'claw_machine',
    config = {
        extra = {
            xmult = 1.1,
            odds = 7,
            increase = 0.1
        }
    },
    loc_vars = function(self, info_queue, card)
		return {vars = { card.ability.extra.xmult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.increase } }
	end,
	rarity = 3,
    atlas = 'Jokers',
    unlocked = true,
    discovered = true,
    pos = { x = 6, y = 2 },
	cost = 8,
	blueprint_compat = true,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:get_id() == 7 then
            if pseudorandom('claw') < G.GAME.probabilities.normal / card.ability.extra.odds and not context.blueprint then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.increase
            end
            if not context.other_card.debuff then
                return {
                    x_mult = card.ability.extra.xmult
                }
            end
        end
	end,
}