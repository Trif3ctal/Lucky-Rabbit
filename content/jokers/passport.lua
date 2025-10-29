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
		return {
			vars = {
				card.ability.extra.mult_mod,
                card.ability.extra.mult_mod * (#card.ability.extra.played_hands)
			}
		}
	end,
	calculate = function(self, card, context)
		if context.before and not context.blueprint then
			local played_before = false
			for i = 1, #card.ability.extra.played_hands do
				if card.ability.extra.played_hands[i] == context.scoring_name then
					played_before = true
					break
				end
			end
			if not played_before then
				table.insert(card.ability.extra.played_hands, context.scoring_name)
				SMODS.scale_card(card, {
					ref_table = card.ability.extra,
					ref_value = 'mult',
					scalar_value = 'mult_mod',
					message_key = 'a_mult'
				})
			end
		end
		if context.joker_main then
			if card.ability.extra.mult > 0 then
				return {
					mult = card.ability.extra.mult
				}
			end
		end
		if context.end_of_round and context.cardarea == G.jokers
		and G.GAME.blind.boss and not context.blueprint then
			card.ability.extra.played_hands = {}
			card.ability.extra.mult = 0
			return {
                message = localize('k_reset'),
            }
		end
	end
}

