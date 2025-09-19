SMODS.Joker {
	key = 'crazy_neils_crazy_deals',
	atlas = 'Jokers',
	pos = { x = 3, y = 1 },
	rarity = 1,
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	config = {
        extra = {
            divide = 75,
            real_amt = 0.75
        }
    },
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.divide
		    }
        }
	end,
	calculate = function(self, card, context)
	    if context.starting_shop and not context.blueprint then
            local items = {}
            for i = 1, #G.shop_booster.cards do
                if G.shop_booster.cards[i].cost + (G.shop_booster.cards[i].extra_cost or 0) ~= 0 then
                    items[#items+1] = G.shop_booster.cards[i]
                end
            end
            for i = 1, #G.shop_jokers.cards do
                if G.shop_jokers.cards[i].cost + (G.shop_jokers.cards[i].extra_cost or 0) ~= 0 then
                    items[#items+1] = G.shop_jokers.cards[i]
                end
            end
            for i = 1, #G.shop_vouchers.cards do
                if G.shop_vouchers.cards[i].cost + (G.shop_vouchers.cards[i].extra_cost or 0) ~= 0 then
                    items[#items + 1] = G.shop_vouchers.cards[i]
                end
            end
            if #items > 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local chosen = pseudorandom_element(items, pseudoseed('crazy_neil'))
                        chosen.ability.fmod_crazy_neil_discount = true
                        chosen:set_cost()
                        delay(0.7)
                        card_eval_status_text(card, 'extra', nil, nil, nil,
                            { message = localize("k_fmod_neil_deal"), colour = G.C.RED })
                        chosen:juice_up(0.3, 0.5)
                        return true
                    end
                }))
            end
	    end
    end
}
