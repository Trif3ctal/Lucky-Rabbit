SMODS.Joker {
    key = "unorthodox_doctor",
    config = {
        extra = {
            copied = nil
        }
    },
    loc_vars = function(self, info_queue, card)
        if card.area and card.area == G.jokers then
            local copied = card.ability.extra.copied
            if copied then
                main_end = {
                    {
                        n = G.UIT.C,
                        config = { align = "bm", minh = 0.4 },
                        nodes = {
                            {
                                n = G.UIT.C,
                                config = { ref_table = card, align = "m", colour = copied and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
                                nodes = {
                                    { n = G.UIT.T, config = { text = ' ' .. localize{ type = "name_text", set = "Joker", key = copied.config.center.key} .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
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
    cost = 6,
    calculate = function(self, card, context)
        if context.before and next(context.poker_hands["Full House"]) and not context.blueprint then
            local compatible = {}
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].config.center.blueprint_compat and G.jokers.cards[i] ~= card then
                    compatible[#compatible + 1] = G.jokers.cards[i]
                end
            end
            if #compatible > 0 then
                card.ability.extra.copied = pseudorandom_element(compatible, "unorthodox")
                return {
                    message = localize("k_fmod_copied"),
                    colour = G.C.PURPLE
                }
            end
        end
        if ((context.joker_type_destroyed and context.card == card.ability.extra.copied) or (context.selling_card and context.card == card.ability.extra.copied)) and not context.blueprint then
            card.ability.extra.copied = nil
        end
        if card.ability.extra.copied then
            return SMODS.blueprint_effect(card, card.ability.extra.copied, context)
        end
    end,
}