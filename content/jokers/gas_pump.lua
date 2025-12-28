SMODS.Joker {
    key = "gas_pump",
    config = {
        extra = {
            inc = 3,
            mult = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.inc, card.ability.extra.mult } }
    end,
    rarity = 1,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pos = { x = 9, y = 9 },
    blueprint_compat = true,
    cost = 5,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "mult",
                scalar_value = "inc"
            })
        end
        if context.after and SMODS.last_hand_oneshot then
            card.ability.extra.mult = 0
            return {
                message = localize('k_reset')
            }
        end
        if context.joker_main and card.ability.extra.mult > 0 then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+" },
                { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.MULT },
        }
    end
}