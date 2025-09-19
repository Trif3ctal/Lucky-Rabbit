if LR_CONFIG and LR_CONFIG.remix_enabled then
    SMODS.Voucher {
        key = 'grab_bag',
        config = {
            triggered = false,
            extra = {
                types = {
                    "small_1",
                    "small_2",
                    "jumbo",
                    "mega"
                }
            }
        },
        atlas = 'Vouchers',
        pos = { x = 0, y = 2 },
        unlocked = true,
        available = true,
        loc_vars = function(self, info_queue)
            info_queue[#info_queue + 1] = G.P_CENTERS.p_fmod_remix_small_1
        end,
        calculate = function(self, card, context)
            if context.starting_shop and card.ability.triggered then
                card.ability.triggered = false
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local key = 'p_fmod_remix_' ..
                        pseudorandom_element(card.ability.extra.types, "grab_bag" .. G.GAME.round_resets.ante)
                        local _card = Card(
                            G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
                            G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
                            G.CARD_W * 1.27, G.CARD_H * 1.27, G.P_CARDS.empty,
                            G.P_CENTERS[key],
                            { bypass_discovery_center = true, bypass_discovery_ui = true }
                        )
                        _card.cost = 0
                        G.FUNCS.use_card({ config = { ref_table = _card } })
                        _card:start_materialize()
                        return true
                    end
                }))
            end

            if context.end_of_round and context.main_eval and G.GAME.blind.boss then
                card.ability.triggered = true
            end
        end
    }
end
