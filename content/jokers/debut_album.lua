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
                        -- This replicates the food destruction effect
                        -- If you want a simpler way to destroy Jokers, you can do card:start_dissolve() for a dissolving animation
                        -- or just card:remove() for no animation
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                card:remove()
                                return true
                            end
                        }))
                        return true
                    end
                }))
                return {
                    message = localize('k_fmod_debut_destruct'),
                    colour = G.C.RED
                }
            else
                card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.mult_loss
                return {
                    message = localize{type = 'variable', key = 'a_xmult_minus', vars = { card.ability.extra.mult_loss }},
                    colour = G.C.MULT
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}