SMODS.Joker {
    key = "drummer_joker",
    config = {
        extra = {
            xmult = 1,
            gain = 0.05,
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_fmod_copycat_card
        return { vars = { card.ability.extra.gain, card.ability.extra.xmult } }
    end,
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pos = { x = 4, y = 9 },
    blueprint_compat = true,
    perishable_compat = false,
    enhancement_gate = "m_fmod_copycat_card",
    cost = 6,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if SMODS.has_enhancement(context.other_card, "m_fmod_copycat_card") then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'xmult',
                    scalar_value = 'gain',
                })
            end
        end
        if context.joker_main and card.ability.extra.xmult > 1 then
            return {
                xmult = card.ability.extra.xmult,
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