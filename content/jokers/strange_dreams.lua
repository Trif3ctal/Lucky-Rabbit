SMODS.Joker {
	key = "strange_dreams",
	atlas = "Jokers",
	pos = { x = 3, y = 2 },
	rarity = 3,
	cost = 8,
    config = {
        extra = {
            unscored = {}
        }
    },
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == 'unscored' and not context.blueprint then
            card.ability.extra.unscored[#card.ability.extra.unscored + 1] = context.other_card
		end
        if context.after and not context.blueprint then
            local card_ = pseudorandom_element(card.ability.extra.unscored, pseudoseed("strange_dreams"))
            if card_ then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        card_:flip()
                        play_sound('card1', 1)
                        card_:juice_up(0.3, 0.5)
                        return true
                    end
                }))
                delay(0.3)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        copy_card(context.scoring_hand[#context.scoring_hand], card_)
                        return true
                    end
                }))
                delay(0.3)
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        card_:flip()
                        play_sound('tarot2', 0.85, 0.6)
                        card_:juice_up(0.3, 0.5)
                        return true
                    end
                }))
                delay(0.3)
                card.ability.extra.unscored = {}
                return {
                    message = localize('k_copied_ex'),
                    colour = G.C.CHIPS,
                }
            end
        end
	end
}
