SMODS.Enhancement:take_ownership('m_steel',
    {
        update = function(self, card, dt)
            if #SMODS.find_card('j_fmod_ferromancy') > 0 then
                card.ability.h_x_mult = 0
                card.ability.h_dollars = 5
                    * (card.ability.jest_charged_applied and card.ability.jest_charged_applied.factor or 1)
            else
                card.ability.h_dollars = 0
                card.ability.h_x_mult = 1.5
                    * (card.ability.jest_charged_applied and card.ability.jest_charged_applied.factor or 1)
            end
        end
    },
    true
)

SMODS.Enhancement:take_ownership('m_gold',
    {
        loc_vars = function(self, info_queue, card)
            if #SMODS.find_card('j_fmod_ferromancy') > 0 then
                return {
                    vars = { (card.ability.h_x_mult or 2) },
                    key = 'm_steel'
                }
            else
                return {
                    vars = { '$' .. card.ability.h_dollars },
                }
            end
        end,
        update = function(self, card, dt)
            if #SMODS.find_card('j_fmod_ferromancy') > 0 then
                card.ability.h_x_mult = 2
                    * (card.ability.jest_charged_applied and card.ability.jest_charged_applied.factor or 1)
                card.ability.h_dollars = 0
            else
                card.ability.h_x_mult = 1
                card.ability.h_dollars = 3
                    * (card.ability.jest_charged_applied and card.ability.jest_charged_applied.factor or 1)
            end
        end
    },
    true
)

SMODS.Joker {
    key = "ferromancy",
    config = {
        extra = {
            xmult = 2,
            money = 5,
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_gold
        info_queue[#info_queue+1] = G.P_CENTERS.m_steel
        return { vars = { card.ability.extra.xmult, card.ability.extra.money } }
    end,
    rarity = 3,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    pos = { x = 9, y = 0 },
    cost = 8,
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_steel') or SMODS.has_enhancement(playing_card, 'm_gold') then
                return true
            end
        end
        return false
    end
}
