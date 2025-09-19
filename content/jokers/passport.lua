SMODS.Joker {
	key = 'passport',
	atlas = 'Jokers',
	pos = { x = 8, y = 0 },
	rarity = 2,
	cost = 4,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	config = {
		extra = {
			mult = 0,
            mult_mod = 8,
			played_hands = {}
		}
	},
	loc_vars = function(self, info_queue, card)
        card.ability.extra.mult = 0
        for scoring_name, played_count in pairs(card.ability.extra.played_hands) do
			if played_count >= 1 then
				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
			end
		end
		return {
			vars = {
				card.ability.extra.mult_mod,
                card.ability.extra.mult
			}
		}
	end,
	calculate = function(self, card, context)
		if context.before then
			card.ability.extra.played_hands[context.scoring_name] = (card.ability.extra.played_hands[context.scoring_name] or 0) + 1
		end
		if context.joker_main then
			card.ability.extra.mult = 0
			for scoring_name, played_count in pairs(card.ability.extra.played_hands) do
				if played_count >= 1 then
					card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
				end
			end
			return {
				mult = card.ability.extra.mult
			}
		end
		if context.end_of_round and G.GAME.blind.boss and not context.blueprint then
			for k in pairs(card.ability.extra.played_hands) do
				card.ability.extra.played_hands[k] = 0
			end
			card.ability.extra.mult = 0
		end
	end
}

