SMODS.Joker {
    key = "and_thats_not_all",
    config = {
        extra = {
            amt = 1,
            mult = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_bonus
        return { vars = { card.ability.extra.amt, card.ability.extra.mult } }
    end,
    atlas = "Jokers",
    pos = { x = 7, y = 6 },
    rarity = 1,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    cost = 5,
    calculate = function(self, card, context)
        if context.discard and not context.blueprint and SMODS.has_enhancement(context.other_card, "m_bonus") then
            if card.ability.extra.mult ~= 0 then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "mult",
                    scalar_table = card.ability.extra,
                    scalar_value = "amt",
                    operation = function(ref_table, ref_value, initial, change)
                        ref_table[ref_value] = math.max(0, initial - change)
                    end,
                    message_key = 'a_mult_minus',
                    message_colour = G.C.RED
                })
            end
        end
        if context.before and not context.blueprint then
            local bonuses = 0
            for i = 1, #context.full_hand do
                if SMODS.has_enhancement(context.full_hand[i], "m_bonus") then
                    bonuses = bonuses + 1
                end
            end
            if bonuses > 0 then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "mult",
                    scalar_table = card.ability.extra,
                    scalar_value = "amt",
                    operation = function(ref_table, ref_value, initial, change)
                        ref_table[ref_value] = initial + (change * bonuses)
                    end,
                })
            end
        end
        if context.joker_main then
            if card.ability.extra.mult > 0 then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end,
}