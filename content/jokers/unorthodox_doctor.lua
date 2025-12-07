SMODS.Joker {
    key = "unorthodox_doctor",
    config = {
        extra = {
            copied = nil,
            key = nil
        }
    },
    loc_vars = function(self, info_queue, card)
        if card.area and card.area == G.jokers then
            if card.ability.extra.copied_id then
                main_end = {
                    {
                        n = G.UIT.C,
                        config = { align = "bm", minh = 0.4 },
                        nodes = {
                            {
                                n = G.UIT.C,
                                config = { ref_table = card, align = "m", colour = mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
                                nodes = {
                                    { n = G.UIT.T, config = { text = ' ' .. localize{ type = "name_text", set = "Joker", key = card.ability.extra.key} .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
                                }
                            }
                        }
                    }
                }
                return { main_end = main_end }
            end
        end
    end,
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pos = { x = 9, y = 6 },
    blueprint_compat = true,
    cost = 8,
    calculate = function(self, card, context)
        if context.before and next(context.poker_hands["Full House"]) and not context.blueprint then
            local compatible = {}
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].config.center.blueprint_compat and G.jokers.cards[i] ~= card then
                    compatible[#compatible + 1] = G.jokers.cards[i]
                end
            end
            if #compatible > 0 then
                local j = pseudorandom_element(compatible, "unorthodox")
                card.ability.extra.copied_id = j.sort_id
                card.ability.extra.key = j.config.center.key
                return {
                    message = localize("k_fmod_copied"),
                    colour = G.C.PURPLE
                }
            end
        end
        if ((context.joker_type_destroyed and context.card.sort_id == card.ability.extra.copied_id) or (context.selling_card and context.card.sort_id == card.ability.extra.copied_id)) and not context.blueprint then
            card.ability.extra.copied_id = nil
            card.ability.extra.key = nil
        end
        if card.ability.extra.copied_id then
            for k, v in ipairs(G.jokers.cards) do
                if v.sort_id == card.ability.extra.copied_id then
                    return SMODS.blueprint_effect(card, v, context)
                end
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            reminder_text = {
                { text = "(" },
                { text = localize("Full House", "poker_hands"), colour = G.C.ORANGE },
                { text = ")" }
            },
            calc_function = function(card)
                local copied_joker, copied_debuff = JokerDisplay.calculate_blueprint_copy(card)
                JokerDisplay.copy_display(card, copied_joker, copied_debuff)
            end,
            get_blueprint_joker = function(card)
                if card.ability.extra.copied_id then
                    for k, v in ipairs(G.jokers.cards) do
                        if v.sort_id == card.ability.extra.copied_id then
                            return v
                        end
                    end
                end
            end
        }
    end,
}