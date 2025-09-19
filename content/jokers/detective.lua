SMODS.Joker {
	key = "detective",
	atlas = "Jokers",
	pos = { x = 1, y = 2 },
	rarity = 2,
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	config = { extra = { dollars = 1 } },
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars,
            }
        }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and context.other_card.ability.detective_played then
			return {
				dollars = card.ability.extra.dollars
			}
		end
        if context.hand_drawn and not context.blueprint then
            for i = 1, #G.hand.cards do
                if G.hand.cards[i].ability.played_this_ante then
                    G.hand.cards[i].ability.detective_played = true
                end
            end
        end
        if context.end_of_round and not context.blueprint and context.cardarea == G.jokers then
            for i = 1, #G.playing_cards do
                if G.playing_cards[i].ability.detective_played then
                    G.playing_cards[i].ability.detective_played = nil
                end
            end
        end
	end
}