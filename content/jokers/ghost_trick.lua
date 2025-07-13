SMODS.Joker {
    key = "ghost_trick",
    config = {
        extra = {
            odds = 7
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}}
        return { vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
    end,
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = true,
    pos = { x = 0, y = 2 },
    cost = 4,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
			if not context.other_card.ghost_tricked and not context.blueprint then
				context.other_card.ghost_tricked = true
				local c = context.other_card
				G.E_MANAGER:add_event(Event({
					func = function()
						if c then
							c.ghost_tricked = nil
						end
						return true
					end,
				}))
			else
				if pseudorandom(pseudoseed('ghost_trick')) < G.GAME.probabilities.normal/card.ability.extra.odds then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = (function()
                            SMODS.add_card({set="Spectral", area=G.consumeables, key_append="gtrick", edition="e_negative"})
                            return true
                        end)
                    }))
                    return {
                        message = localize('k_plus_spectral'),
                        colour = G.C.SECONDARY_SET.Spectral,
                        card = card
                    }
                end
			end
		end
    end
}