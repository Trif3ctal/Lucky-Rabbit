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
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'fmod_claw')
		return {vars = { card.ability.extra.xmult, numerator, denominator, card.ability.extra.increase } }
	end,
	rarity = 3,
    atlas = 'Jokers',
    unlocked = true,
    discovered = false,
    pos = { x = 6, y = 2 },
	cost = 8,
	blueprint_compat = true,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:get_id() == 7 then
            if SMODS.pseudorandom_probability(card, 'claw', 1, card.ability.extra.odds, 'fmod_claw') and not context.blueprint then
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