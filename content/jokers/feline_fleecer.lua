if LR_CONFIG.remix_enabled then
    SMODS.Joker {
        key = "feline_fleecer",
        atlas = "Jokers",
        pos = { x = 9, y = 5 },
        rarity = 2,
        cost = 5,
        unlocked = true,
        discovered = false,
        blueprint_compat = true,
        loc_vars = function(self, info_queue)
            info_queue[#info_queue + 1] = G.P_CENTERS.p_fmod_remix_small_1
        end,
        calculate = function(self, card, context)
            if context.starting_shop then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local booster = SMODS.add_booster_to_shop('p_fmod_remix_small_' ..
                        pseudorandom_element({ 1, 2 }, "feline_fleecer" .. G.GAME.round_resets.ante))
                        if booster then booster.ability.couponed = true end
                        booster:set_cost()
                        return true
                    end
                }))
                return {
                    message = localize({ type = "variable", key = "a_fmod_booster", vars = { 1 } }),
                    colour = G.C.CHIPS
                }
            end
        end
    }
end
