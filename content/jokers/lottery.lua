SMODS.Joker {
	key = 'lottery',
	atlas = 'Jokers',
	pos = { x = 6, y = 5 },
    config = {
        extra = {
            odds = 2,
            min = 1,
            max = 9
        }
    },
	rarity = 1,
	cost = 4,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'fmod_lottery')
        return { vars = { numerator, denominator, card.ability.extra.min, card.ability.extra.max } }
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.main_eval and context.game_over == false and SMODS.pseudorandom_probability(card, 'lottery', 1, card.ability.extra.odds, 'fmod_lottery') and not context.blueprint then
            local money = math.floor(pseudorandom(pseudoseed("lottery2")) * card.ability.extra.max) + 1
            card.ability.extra_value = (card.ability.extra_value or 0) + money
            card:set_cost()
            return {
                message = localize{type="variable", key="a_fmod_money", vars={money}},
                colour = G.C.MONEY,
                sound = "coin" .. pseudorandom("lottery3", 1, 7)
            }
        end
    end
}

