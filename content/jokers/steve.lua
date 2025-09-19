SMODS.Joker {
    key = "steve",
    config = {
        extra = {
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.e_negative
    end,
    pools = {
        ["Fmod_Legendary"] = true,
    },
    rarity = 4,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pos = { x = 2, y = 3 },
    soul_pos = { x = 2, y = 4 },
    blueprint_compat = false,
    cost = 20,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            card:juice_up(0.3, 0.5)
            local key = LR_UTIL.get_food_jokers('steve')
            SMODS.add_card({set = 'Joker', key = key, edition = 'e_negative'})
            return true
        end
    end,
    in_pool = function (self, args)
        return not args or not args.source or args.source ~= 'sou'
    end
}