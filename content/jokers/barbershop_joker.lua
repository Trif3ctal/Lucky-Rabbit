SMODS.Joker {
    key = "barbershop_joker",
    config = {
        extra = {
            balance = 2,
            increase = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.balance, card.ability.extra.increase } }
    end,
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pos = { x = 8, y = 8 },
    cost = 6,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.post_trigger and context.cardarea == G.jokers and not context.blueprint then
            local j_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    j_pos = i
                    break
                end
            end
            if j_pos and G.jokers.cards[j_pos + 1] == context.other_card or G.jokers.cards[j_pos - 1] == context.other_card then
                return {
                    func = function()
                        SMODS.scale_card(card, {
                            ref_table = card.ability.extra,
                            ref_value = 'balance',
                            scalar_value = 'increase',
                            scaling_message = {
                                message = localize { key = "a_fmod_balance", type = "variable", vars = { card.ability.extra.balance + card.ability.extra.increase } },
                                colour = G.C.PURPLE
                            }
                        })
                        return true
                    end
                }
            end
        end
        if context.final_scoring_step and context.cardarea == G.jokers then -- th30ne i stole your code thanks
            local init_mult = mult
            local init_chips = hand_chips
            mult = mod_mult(math.ceil((init_mult + init_chips * card.ability.extra.balance) / (1 + card.ability.extra.balance)))
            hand_chips = mod_chips(math.ceil((init_chips + init_mult * card.ability.extra.balance) /
            (1 + card.ability.extra.balance)))
            update_hand_text({ delay = 0 }, { chips = hand_chips, mult = mult })
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('gong', 0.94, 0.3)
                    play_sound('gong', 0.94 * 1.5, 0.2)
                    play_sound('tarot1', 1.5)
                    ease_colour(G.C.UI_CHIPS, { 0.8, 0.45, 0.85, 1 })
                    ease_colour(G.C.UI_MULT, { 0.8, 0.45, 0.85, 1 })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        blockable = false,
                        blocking = false,
                        delay = 0.8,
                        func = (function()
                            ease_colour(G.C.UI_CHIPS, G.C.BLUE, 0.8)
                            ease_colour(G.C.UI_MULT, G.C.RED, 0.8)
                            return true
                        end)
                    }))
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        blockable = false,
                        blocking = false,
                        no_delete = true,
                        delay = 1.3,
                        func = (function()
                            G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] = G.C.BLUE[1], G.C.BLUE
                            [2], G.C.BLUE[3], G.C.BLUE[4]
                            G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] = G.C.RED[1], G.C.RED[2],
                                G.C.RED[3], G.C.RED[4]
                            return true
                        end)
                    }))
                    return true
                end
            }))
            return {
                message = localize("k_balanced"),
                colour = G.C.PURPLE
            }
        end
        if context.after and context.cardarea == G.jokers and not context.blueprint then
            card.ability.extra.balance = 2
            return {
                message = localize('k_reset'),
                colour = G.C.RED
            }
        end
    end
}