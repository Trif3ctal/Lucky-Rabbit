SMODS.Joker {
    key = "trans_joker",
    config = {
        extra = {
            mult = 5
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, colours = {HEX("ff98e2"), HEX("5bcefa") }  },  }
    end,
    atlas = "Jokers",
    pos = { x = 1, y = 3 },
    rarity = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    cost = 5,
    calculate = function(self, card, context)
        if (context.change_rank and context.old_rank ~= nil) or (context.change_suit and context.old_suit ~= nil) then
            local bp = context.blueprint_card
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.calculate_effect({
                        message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
                        colour = G.C.RED,
                        message_card = context.other_card,
                        card = bp or card
                    })
                    context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.mult
                    return true
                end
            }))
        end
    end
}