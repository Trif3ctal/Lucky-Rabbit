if LR_CONFIG.silly_enabled then
    SMODS.Tag {
        key = "goofy",
        atlas = "Tags",
        pos = { x = 0, y = 0 },
        min_ante = 2,
        config = {
            type = "new_blind_choice",
        },
        discovered = false,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_CENTERS.p_fmod_silly_mega
            return { vars = { colours = { HEX("ff98e2") } } }
        end,
        apply = function(self, tag, context)
            if context.type == self.config.type then
                tag:yep('+', G.C.GREEN, function()
                    local key = 'p_fmod_silly_mega'
                    local card = Card(
                        G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
                        G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
                        G.CARD_W * 1.27, G.CARD_H * 1.27, G.P_CARDS.empty,
                        G.P_CENTERS[key],
                        { bypass_discovery_center = true, bypass_discovery_ui = true }
                    )
                    card.cost = 0
                    card.from_tag = true
                    G.FUNCS.use_card({ config = { ref_table = card } })
                    card:start_materialize()
                    return true
                end)
                tag.triggered = true
                return true
            end
        end
    }
end
