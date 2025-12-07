SMODS.Joker {
    key = "geiru",
    config = {
        extra = {
            xmult = 1,
            gain_joker = 1,
            gain_seal = 0.5,
            gain_cons = 0.25
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.gain_joker, card.ability.extra.gain_seal, card.ability.extra.gain_cons, card.ability.extra.xmult } }
    end,
    pools = {
        ["Fmod_Legendary"] = true,
    },
    rarity = 4,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pos = { x = 4, y = 3 },
    soul_pos = { x = 4, y = 4 },
    blueprint_compat = true,
    cost = 20,
    calculate = function(self, card, context)
        if (context.playing_card_added or context.card_added) and not context.blueprint then
            print(SMODS.context_stack[1])
            if (SMODS.context_stack[1] or {}).caller then
                if (SMODS.context_stack[1] or {}).caller.ability.set == 'Joker' then
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "xmult",
                        scalar = "gain_joker",
                        message_key = "a_xmult",
                        message_colour = G.C.MULT
                    })
                end
                if (SMODS.context_stack[1] or {}).caller.ability.set == 'Seal' then
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "xmult",
                        scalar = "gain_seal",
                        message_key = "a_xmult",
                        message_colour = G.C.MULT
                    })
                end
                if (SMODS.context_stack[1] or {}).caller.ability.consumeable then
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "xmult",
                        scalar = "gain_cons",
                        message_key = "a_xmult",
                        message_colour = G.C.MULT
                    })
                end
            end
        end
        if context.joker_main and card.ability.extra.xmult > 1 then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    in_pool = function (self, args)
        return not args or not args.source or args.source ~= 'sou'
    end
}