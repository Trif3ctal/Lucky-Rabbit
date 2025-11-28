SMODS.Joker {
	key = "debut_album",
	atlas = "Jokers",
	pos = { x = 8, y = 5 },
	rarity = 2,
	cost = 4,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
    eternal_compat = false,
    pixel_size = { w = 71, h = 70 },
	config = { extra = { mult_loss = 0.5, xmult = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.mult_loss } }
    end,
    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            if card.ability.extra.xmult - card.ability.extra.mult_loss <= 1 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.destroy_cards(card, nil, nil, true)
                        return true
                    end
                }))
                return {
                    message = localize('k_fmod_debut_destruct'),
                    colour = G.C.RED
                }
            else
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    func = function()
                        SMODS.scale_card(card, {
                            operation = '-',
                            ref_table = card.ability.extra,
                            ref_value = 'xmult',
                            scalar_value = 'mult_loss',
                            message_key = 'a_xmult_minus',
                            message_colour = G.C.MULT
                        })
                        return true
                    end
                }))
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                    }
                }
            }
        }
    end
}