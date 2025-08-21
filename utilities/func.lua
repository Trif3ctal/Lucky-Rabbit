----- functions ------

function LR_UTIL.random_showdown_blind(seed)
    local eligible_bosses = {}
    for k, v in pairs(G.P_BLINDS) do
        if v.boss and v.boss.showdown then
            eligible_bosses[k] = true
        end
    end
    for k, v in pairs(G.GAME.banned_keys) do
        if eligible_bosses[k] then eligible_bosses[k] = nil end
    end
    local _, boss = pseudorandom_element(eligible_bosses, pseudoseed(seed or 'seed'))
    return boss
end

function LR_UTIL.reset_hyperfix_rank()
    -- If this function somehow isn't working, fail fast
    G.GAME.current_round.hyperfix_card.rank = "This is a bug"
    local valid_hyperfix_cards = {}
    for k, v in ipairs(G.playing_cards) do
        if not SMODS.has_no_rank(v) and v.base.value ~= G.GAME.hyperfix_card.rank then
            valid_hyperfix_cards[#valid_hyperfix_cards+1] = v
        end
    end
    if valid_hyperfix_cards[1] then
        local hyperfix_card = pseudorandom_element(valid_hyperfix_cards, pseudoseed('hyperfix'..G.GAME.round_resets.ante))
        G.GAME.current_round.hyperfix_card.rank = hyperfix_card.base.value
        return
    end
    -- Edge case: every card matched G.GAME.hyperfix_card's rank
    local valid_ranks = {}
    for _, k in ipairs(SMODS.Rank.obj_buffer) do
        if k ~= G.GAME.hyperfix_card.rank then
            valid_ranks[#valid_ranks+1] = k
        end
    end
    if valid_ranks[1] then
        local hyperfix_rank = pseudorandom_element(valid_ranks, pseudoseed('hyperfix'..G.GAME.round_resets.ante))
        G.GAME.current_round.hyperfix_card.rank = hyperfix_rank
        return
    end
    -- Somehow, there's no other rank to pick
    G.GAME.current_round.hyperfix_card.rank = 'None'
end

function LR_UTIL.reset_hyperfix_full_card()
    local valid_hyperfix_cards = {}
    for k, v in ipairs(G.playing_cards) do
        if not SMODS.has_no_rank(v) and not SMODS.has_no_suit(v) then
            valid_hyperfix_cards[#valid_hyperfix_cards+1] = v
        end
    end
    if valid_hyperfix_cards[1] then
        local hyperfix_card = pseudorandom_element(valid_hyperfix_cards, pseudoseed('hyperfix_'..G.GAME.round_resets.ante))
        local rank = hyperfix_card.base.value
        local suit = hyperfix_card.base.suit
        return rank, suit
    end
    return "Ace", "Spades"
end

function LR_UTIL.get_food_jokers(seed)
    local possible_jokers = {
        'j_gros_michel',
        'j_egg',
        'j_ice_cream',
        'j_cavendish',
        'j_turtle_bean',
        'j_diet_cola',
        'j_popcorn',
        'j_ramen',
        'j_selzer',
        'j_fmod_pub_burger'
    }
    if G.P_CENTER_POOLS.Joker then for k, v in pairs(G.P_CENTER_POOLS.Joker) do
        if v.pools and v.pools.Food then
            possible_jokers[#possible_jokers+1] = v.key
        end
    end
    end
    local key = pseudorandom_element(possible_jokers, pseudoseed(seed)) or 'j_gros_michel'
    return key
end

function LR_UTIL.get_fmod_legendaries(seed)
    local possible_jokers = {}
    if G.P_CENTER_POOLS.Joker then for k, v in pairs(G.P_CENTER_POOLS.Joker) do
        if v.pools and v.pools.Fmod_Legendary then
            possible_jokers[#possible_jokers+1] = v.key
        end
    end
    end
    local key = pseudorandom_element(possible_jokers, pseudoseed(seed)) or 'j_fmod_steve'
    return key
end

-- most marking functions are based off of paperback's paperclip code, credits to their team
function LR_UTIL.is_marking(str)
    if LR_CONFIG and LR_CONFIG.markings_enabled then
        for _, v in ipairs(LR_UTIL.ENABLED_MARKINGS) do
            if 'fmod_' .. v == str then
                return true
            end
        end
    end
    return false
end

function LR_UTIL.has_marking(card)
    for k, v in pairs(card and card.ability or {}) do
        if LR_UTIL.is_marking(k) then
            return k, v
        end
    end
end

function LR_UTIL.set_marking(card, mark)
    local key = 'fmod_' .. mark .. '_mark'
    if card and LR_UTIL.is_marking(key) then
        -- remove existing marks before applying
        for k, _ in pairs(card.ability) do
            if LR_UTIL.is_marking(k) then
                card.ability[k] = nil
            end
        end

        SMODS.Stickers[key]:apply(card, true)
    end
end

function LR_UTIL.marking_tooltip(mark)
    local key = 'fmod_' .. mark .. '_mark'
    local marking = SMODS.Stickers[key]
    local vars = {}
    if not marking then return end
    if marking.loc_vars then
        local dummy_card = { ability = {} }
        marking:apply(dummy_card, true)
        vars = marking:loc_vars({}, dummy_card).vars
    end
    return {
        set = 'Other',
        key = key,
        vars = vars
    }
end

function LR_UTIL.num_vouchers()
    if not G.GAME.used_vouchers then return 0 end
	local count = 0
	for k, v in pairs(G.GAME.used_vouchers) do
		if v then
			count = count + 1
		end
	end
	return count
end

------ hooks ------

local shuffle_ref = CardArea.shuffle
function CardArea:shuffle(_seed)
    local g = shuffle_ref(self, _seed)
    if self == G.deck then
        local priorities = {}
        local others = {}
        for k, v in pairs(self.cards) do
            if LR_UTIL.has_marking(v) == 'fmod_crease_mark' then
                table.insert(priorities, v)
            else
                table.insert(others, v)
            end
        end
        for _, card in ipairs(priorities) do
            table.insert(others, card)
        end
        self.cards = others
        self:set_ranks()
    end
    return g
end

local set_base_ref = Card.set_base
function Card:set_base(card, initial)
    set_base_ref(self, card, initial)
    if self.playing_card and not initial and next(SMODS.find_card("j_fmod_trans_joker")) then
        for k, v in ipairs(G.jokers.cards) do
            if v.ability.name == 'j_fmod_trans_joker' then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        v:juice_up()
                        card_eval_status_text(self, 'extra', nil, nil, nil, {
                            message = localize { type = 'variable', key = 'a_mult', vars = {v.ability.extra.mult} },
                            colour = G.C.RED,
                        })
                        self.ability.perma_mult = self.ability.perma_mult + v.ability.extra.mult
                        return true
                    end
                }))
            end
        end
    end
end

local gnb = get_new_boss
function get_new_boss()
    if G.GAME.selected_back.effect.center.key == "b_fmod_reaper" then
		local boss = tostring(LR_UTIL.random_showdown_blind('reaper'))
		if boss then G.FORCE_BOSS = boss end
	else
		G.FORCE_BOSS = nil
	end
    local gnb_val = gnb()

    G.FORCE_BOSS = nil

    return gnb_val
end

local reroll_ref = G.FUNCS.reroll_boss
G.FUNCS.reroll_boss = function(e)
	if G.GAME.selected_back.effect.center.key == "b_fmod_reaper" then
		local boss = tostring(LR_UTIL.random_showdown_blind('reaper'))
		if boss then G.FORCE_BOSS = boss end
	else
		G.FORCE_BOSS = nil
	end
	local reroll_val = reroll_ref(e)

    G.FORCE_BOSS = nil

	return reroll_val
end

-- taken from MoreFluff, who took it from Entropy, thanks Ruby (and notmario)
local e_round = end_round
function end_round()
    e_round()
    local remove_temp = {}
    for i, v in pairs({ G.jokers, G.hand, G.consumeables, G.discard, G.deck }) do
        for ind, card in pairs(v.cards) do
            if card.ability then
                if card.ability.lr_temp then
                    if card.area ~= G.hand and card.area ~= G.play and card.area ~= G.jokers and card.area ~= G.consumeables then card.states.visible = false end
                    card:remove_from_deck()
                    card:start_dissolve()
                    if card.ability.lr_temp then remove_temp[#remove_temp + 1] = card end
                end
            end
        end
    end
    if #remove_temp > 0 then
        SMODS.calculate_context({ remove_playing_cards = true, removed = remove_temp })
    end
end

local flip = Card.flip
function Card:flip()
    if LR_UTIL.has_marking(self) == 'fmod_ink_mark' and self.facing == 'front' and self.area ~= G.deck then
        return false
    end
    flip(self)
end

------ misc ------

function SMODS.current_mod.reset_game_globals(run_start)
    if run_start then
        G.GAME.hyperfix_card.rank, G.GAME.hyperfix_card.suit = LR_UTIL.reset_hyperfix_full_card()
    end
    LR_UTIL.reset_hyperfix_rank()
    LR_UTIL.reset_ncradle_card()
end

SMODS.current_mod.set_debuff = function(card)
    if LR_UTIL.has_marking(card) == 'fmod_ink_mark' then return "prevent_debuff" end
end