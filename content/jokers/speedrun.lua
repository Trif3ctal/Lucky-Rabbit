SMODS.Joker {
    key = "speedrun",
    config = {
        extra = {
            timer = {
                blind = 0,
                start = 0,
                time = 0,
                current = 0,
                color = copy_table(G.C.GREEN)
            },
            dollars = 5,
            h_size = 2,
            h_size_loss = 1,
            bonus = true,
            hell = false
        }
    },
    atlas = "Jokers",
    pos = { x = 4, y = 7 },
    rarity = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.h_size, card.ability.extra.dollars, card.ability.extra.h_size_loss } }
    end,
    calculate = function(self, card, context)
        -- abandon all hope, ye who enter here
        if context.setting_blind and not context.blueprint then
            card.children.timer = UIBox { definition = { n = G.UIT.ROOT,
                config = { align = "bm", colour = { 0, 0, 0, 0 } },
                nodes = {
                    {
                        n = G.UIT.O,
                        config = {
                            object = DynaText {
                                string = { {
                                    ref_table = card.ability.extra.timer,
                                    ref_value = "time" } },
                                scale = 0.8,
                                shadow = true,
                                colours = { card.ability.extra.timer.color }
                            },
                            align = 'bm'
                        }
                    }
                } }, config = { align = 'bm', major = card, parent = card } }
            card.ability.extra.timer.start = G.TIMERS.REAL
            card.ability.extra.timer.blind = 1
            card:juice_up()
        end
        if context.final_scoring_step and context.main_eval and card.ability.extra.hell and not context.blueprint
        and to_number(G.GAME.chips) + to_number(math.floor(SMODS.calculate_round_score())) >= to_number(G.GAME.blind.chips) and card.children.timer then
            G.GAME.current_round.discards_left = G.GAME.round_resets.discards
            G.GAME.current_round.hands_left = G.GAME.round_resets.hands
            reset_idol_card()
            reset_mail_rank()
            G.GAME.current_round.ancient_card.suit = nil
            reset_ancient_card()
            reset_castle_card()
            for _, mod in ipairs(SMODS.mod_list) do
                if mod.reset_game_globals and type(mod.reset_game_globals) == 'function' then
                    mod.reset_game_globals(true)
                end
            end
            for k, v in ipairs(G.playing_cards) do
                v.ability.discarded = nil
                v.ability.forced_selection = nil
                v.ability.wheel_flipped = nil
            end
            chips = 0
            mult = 0
            SMODS.calculate_effect({
                message = localize("k_nope_ex"),
                colour = G.C.SECONDARY_SET.Tarot
            }, card)
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand:change_size(-card.ability.extra.h_size_loss)
                    G.GAME.round_resets.temp_handsize = (G.GAME.round_resets.temp_handsize or 0) + -card.ability.extra.h_size_loss
                    G.FUNCS.draw_from_hand_to_discard()
                    delay(0.4)
                    G.FUNCS.draw_from_discard_to_deck()
                    G.GAME.current_round.hands_played = 0
                    G.GAME.current_round.discards_used = 0
                    G.GAME.current_round.any_hand_drawn = nil
                    G.GAME.current_round.reroll_cost_increase = 0
                    G.GAME.current_round.used_packs = {}
                    for k, v in pairs(G.GAME.hands) do
                        v.played_this_round = 0
                    end
                    SMODS.calculate_effect({
                        message = localize("k_again_ex")
                    }, card)
                    card.ability.extra.timer.blind = 0
                    delay(0.4)
                    G.hand_text_area.game_chips:juice_up()
                    G.GAME.chips = 0
                    SMODS.calculate_effect({
                        message = localize { type = "variable", key = "a_fmod_hsize_loss", vars = { card.ability.extra.h_size_loss } },
                        colour = G.C.RED
                    }, card)
                    delay(0.2)
                    G.E_MANAGER:add_event(Event({
                        trigger = 'immediate',
                        func = function()
                            G.STATE = G.STATES.DRAW_TO_HAND
                            G.deck:shuffle('fmod_speedrun_' .. G.GAME.round_resets.ante)
                            G.deck:hard_set_T()
                            G.STATE_COMPLETE = false
                            card.ability.extra.timer.blind = 1
                            card.ability.extra.timer.start = G.TIMERS.REAL
                            card.ability.extra.timer.color[1] = G.C.GREEN[1]
                            card.ability.extra.timer.color[2] = G.C.GREEN[2]
                            card.ability.extra.timer.color[3] = G.C.GREEN[3]
                            return true
                        end
                    }))
                    card.ability.extra.hell = false
                    card.ability.extra.bonus = true
                    return true
                end
            }))
        end
        if context.end_of_round and context.main_eval and not context.repetition and not context.blueprint and card.children.timer then
            card.children.timer:remove()
            card.children.timer = nil
            card.ability.extra.timer.blind = 0
            card.ability.extra.timer.start = 0
            card.ability.extra.timer.color = copy_table(G.C.GREEN)
            if card.ability.extra.bonus then
                return {
                    message = localize{ type = "variable", key = "a_handsize", vars = { card.ability.extra.h_size }},
                    dollars = 5
                }
            end
        end
        if context.starting_shop and card.ability.extra.bonus and not context.blueprint then
            G.hand:change_size(card.ability.extra.h_size)
            G.GAME.round_resets.temp_handsize = (G.GAME.round_resets.temp_handsize or 0) + card.ability.extra.h_size
            card.ability.extra.timer.color = copy_table(G.C.GREEN)
            card.ability.extra.bonus = false
        end
    end,
    update = function(self, card, dt)
        local time = (G.TIMERS.REAL - card.ability.extra.timer.start) * card.ability.extra.timer.blind
        if time >= 30 then
            card.ability.extra.timer.color[1] = G.C.FILTER[1]
            card.ability.extra.timer.color[2] = G.C.FILTER[2]
            card.ability.extra.timer.color[3] = G.C.FILTER[3]
            if time >= 60 then
                card.ability.extra.timer.color[1] = G.C.RED[1]
                card.ability.extra.timer.color[2] = G.C.RED[2]
                card.ability.extra.timer.color[3] = G.C.RED[3]
                card.ability.extra.hell = true
            end
            card.ability.extra.bonus = false
        end
        local minutes = math.floor(time / 60)
        local seconds = math.floor(time % 60)
        local ms = math.floor((time * 100) % 100)
        card.ability.extra.timer.time = string.format("%d:%02d.%02d", minutes, seconds, ms)
    end
}