LR_UTIL = {}

-- config tab
LR_CONFIG = SMODS.current_mod.config

SMODS.load_file("content/atlas.lua")()
SMODS.load_file("utilities/func.lua")()

SMODS.current_mod.config_tab = function()
    return {
        n = G.UIT.ROOT,
        config = { align = "cm", padding = 0.05, emboss = 0.05, r = 0.1, colour = G.C.BLACK },
        nodes = {
            {
                n = G.UIT.R,
                config = { align = "cm", minh = 1 },
                nodes = {
                    {
                        n = G.UIT.T,
                        config = { text = localize("k_fmod_config_restart"), colour = G.C.RED, scale = 0.5 }
                    }
                }
            },
            {
                n = G.UIT.R,
                nodes = {
                    {
                        n = G.UIT.C,
                        nodes = {
                            create_toggle {
                                label = localize("k_fmod_config_jokers"),
                                ref_table = LR_CONFIG,
                                ref_value = "jokers_enabled"
                            },
                            create_toggle {
                                label = localize("k_fmod_config_silly"),
                                ref_table = LR_CONFIG,
                                ref_value = "silly_enabled"
                            },
                            create_toggle {
                                label = localize("k_fmod_config_vouchers"),
                                ref_table = LR_CONFIG,
                                ref_value = "vouchers_enabled"
                            },
                            create_toggle {
                                label = localize("k_fmod_config_tags"),
                                ref_table = LR_CONFIG,
                                ref_value = "tags_enabled"
                            },
                        }
                    },
                    {
                        n = G.UIT.C,
                        nodes = {
                            create_toggle {
                                label = localize("k_fmod_config_blinds"),
                                ref_table = LR_CONFIG,
                                ref_value = "blinds_enabled"
                            },
                            create_toggle {
                                label = localize("k_fmod_config_decks"),
                                ref_table = LR_CONFIG,
                                ref_value = "decks_enabled"
                            },
                            create_toggle {
                                label = localize("k_fmod_config_markings"),
                                ref_table = LR_CONFIG,
                                ref_value = "markings_enabled"
                            },
                            create_toggle {
                                label = localize("k_fmod_config_enhancements"),
                                ref_table = LR_CONFIG,
                                ref_value = "enhancements_enabled"
                            },
                            create_toggle {
                                label = localize("k_fmod_config_remix"),
                                ref_table = LR_CONFIG,
                                ref_value = "remix_enabled"
                            },
                        }
                    }
                }
            }
        }
    }
end


--Optional features
SMODS.optional_features = {
    cardareas = {
        unscored = true,
    }
}


-- file loading

local files = {
    jokers = {
        list = {
            "fennex",
            "despicable_bear",
            "generator",
            "countdown",
            "penny_joker",
            "nero_the_fool",
            "negative_joker",
            "impractical_joker",
            "passport",
            "ferromancy",
            "fragile_sticker",
            "hyperfixation",
            "calculator",
            "civic_secretary",
            "pop_idol_cat",
            "crazy_neils_crazy_deals",
            "blue_angel_mushroom",
            "low_hanging_fruit",
            "pub_burger",
            "wordle",
            "ghost_trick",
            "detective",
            "nerdcubed",
            "strange_dreams",
            "terminal_velocity",
            "newtons_cradle",
            "claw_machine",
            "orbit",
            "rabbit",
            "jazzercise",
            "trans_joker",
            "litterbug",
            "sad_clown",
            "tax_return",
            "dating_sim",
            "rhythm_game",
            "dungeon_crawler",
            "fighting_game",
            "feline_fleecer",
            "tem_shop",
            "free_shipping",
            "comic_book_ad",
            "lottery",
            "debut_album",
            "zany_to_the_max",
            "friend_inside_me",
            "prismatic_joker",
            "ghostly_joker",
            "working_joker",
            "hypeman",
            "and_thats_not_all",
            "double_down",
            "steve",
            "pomni",
            "ransome",
            "loonette",
            "fennex_the_clown",
        },
        directory = "content/jokers"
    },
    vouchers = {
        list = {
            "circus",
            "showtime",
            "reroll_superfluity",
            "buffet",
            "dumpster_ritual",
            "anti_higgs_boson",
            "big_bang",
            "color_swatches",
            "fire_sale",
            "coupon",
            "extreme_couponing",
            "shopaholic",
            "grab_bag",
            "gachapon",
            "mystery_box",
        },
        directory = "content/vouchers"
    },
    consumables = {
        list = {
            "clown_car",
            "squirt_flower",
            "pie",
            "bang_gun",
            "whoopie_cushion",
            "joy_buzzer",
            "juggler",
            "balloons",
            "split_pants",
            "balloon_animal",
            "tightrope",
            "midway_games",
            "rodeo",
            "trapeze",
            "endless_scarf",
            "knife_throw",
            "fire_breath",
            "greasepaint",
            "unicycle",
            "cannon",
            "barker",
            "hall_of_mirrors",
            "suspenders",
            "soully",
            "crisis"
        },
        directory = 'content/consumables'
    },
    enhancements = {
        list = {
            "raffle_card",
            "copycat_card",
        },
        directory = "content/enhancements"
    },
    blinds = {
        list = {
            "hoard",
            "tool",
            "baby",
            "priest",
            "light",
            "thorn",
            "elder",
            "dice",
            "flux",
            -- "final_horn",
            "final_sword",
            "final_shield",
        },
        directory = "content/blinds"
    },
    decks = {
        list = {
            "clown",
            "fennex",
            "harmony",
            "reaper",
            "recursive",
        },
        directory = "content/decks"
    },
    tags = {
        list = {
            "goofy",
            "lunchbreak",
            "boost",
            "appraisal",
        },
        directory = "content/tags"
    },
    boosters = {
        list = {
            "silly_packs",
            "remix_packs",
        },
        directory = "content/boosters"
    },
    markings = {
        list = {
            "crease_mark",
            "pinhole_mark",
            "ink_mark"
        },
        directory = "content/markings"
    }
}

-- load everything

function LR_UTIL.load_files(items, path)
    for i = 1, #items do
        assert(SMODS.load_file(path .. "/" .. items[i] .. '.lua'))()
    end
end

if LR_CONFIG.jokers_enabled then
    LR_UTIL.load_files(files.jokers.list, files.jokers.directory)
end

if LR_CONFIG.silly_enabled then
    -- register silly packs
    SMODS.ConsumableType {
        key = 'Silly',
        primary_colour = HEX('f4d494'),
        secondary_colour = HEX('db8787'),
        collection_rows = { 5, 6 },
        default = 'c_fmod_pie',
        shop_rate = 0,
        cards = {
            ["c_fmod_clown_car"] = true,
            ["c_fmod_squirt_flower"] = true,
            ["c_fmod_pie"] = true,
            ["c_fmod_bang_gun"] = true,
            ["c_fmod_whoopie_cushion"] = true,
            ["c_fmod_joy_buzzer"] = true,
            ["c_fmod_juggler"] = true,
            ["c_fmod_balloons"] = true,
            ["c_fmod_split_pants"] = true,
            ["c_fmod_midway_games"] = true,
            ["c_fmod_balloon_animal"] = true,
            ["c_fmod_tightrope"] = true,
            ["c_fmod_soully"] = true,
            ["c_fmod_fire_breath"] = true,
            ["c_fmod_rodeo"] = true,
            ["c_fmod_endless_scarf"] = true,
            ["c_fmod_knife_throw"] = true,
            ["c_fmod_trapeze"] = true,
            ["c_fmod_greasepaint"] = true,
            ["c_fmod_unicycle"] = true,
            ["c_fmod_cannon"] = true,
            ["c_fmod_barker"] = true,
            ["c_fmod_suspenders"] = true,
            ["c_fmod_hall_of_mirrors"] = true,
            ["c_fmod_crisis"] = true,
        },
        loc_txt = {
            name = "Silly",
            collection = "Silly Cards",
            undiscovered = {
                name = "Not Discovered",
                text = {
                    "Purchase or use",
                    "this card in an",
                    "unseeded run to",
                    "learn what it does"
                }
            }
        },
    }
    SMODS.UndiscoveredSprite {
        key = 'Silly',
        atlas = 'Consumables',
        pos = { x = 3, y = 2 },
        --overlay_pos = { x = 4, y = 2 }
    }
    LR_UTIL.load_files(files.consumables.list, files.consumables.directory)
    assert(SMODS.load_file("content/boosters/silly_packs.lua"))()
end

if LR_CONFIG.vouchers_enabled then
    LR_UTIL.load_files(files.vouchers.list, files.vouchers.directory)
end

if LR_CONFIG.blinds_enabled then
    LR_UTIL.load_files(files.blinds.list, files.blinds.directory)
end

if LR_CONFIG.decks_enabled then
    LR_UTIL.load_files(files.decks.list, files.decks.directory)
end

if LR_CONFIG.tags_enabled then
    LR_UTIL.load_files(files.tags.list, files.tags.directory)
end

if LR_CONFIG.enhancements_enabled then
    LR_UTIL.load_files(files.enhancements.list, files.enhancements.directory)
end

if LR_CONFIG.remix_enabled then
    assert(SMODS.load_file("content/boosters/remix_packs.lua"))()
end

-- define marking objects

if LR_CONFIG.markings_enabled then
    LR_UTIL.Marking = SMODS.Sticker:extend {
        prefix_config = { key = true },
        should_apply = false,
        config = {},
        rate = 0,
        sets = {
            Default = true
        },

        draw = function(self, card)
            G.shared_stickers[self.key].role.draw_major = card
            G.shared_stickers[self.key]:draw_shader('dissolve', nil, nil, nil, card.children.center, nil, nil)
        end,

        apply = function(self, card, val)
            card.ability[self.key] = val and copy_table(self.config) or nil
        end
    }
    SMODS.current_mod.custom_collection_tabs = function()
        return {
            UIBox_button(
                {
                    button = "your_collection_fmod_markings",
                    id = "your_collection_fmod_markings",
                    label = { "Markings" },
                    minw = 5,
                    minh = 1
                }
            )
        }
    end

    local function markings_ui()
        local markings = {}
        for k, v in pairs(SMODS.Stickers) do
            if LR_UTIL.is_marking(k) then
                markings[k] = v
            end
        end
        return SMODS.card_collection_UIBox(
            markings,
            { 5, 5 },
            {
                snap_back = true,
                hide_single_page = true,
                collapse_single_page = true,
                center = "c_base",
                h_mod = 1.03,
                back_func = "your_collection_other_gameobjects",
                modify_card = function(card, center)
                    card.ignore_pinned = true
                    center:apply(card, true)
                end
            }
        )
    end

    G.FUNCS.your_collection_fmod_markings = function()
        G.SETTINGS.paused = true
        G.FUNCS.overlay_menu {
            definition = markings_ui()
        }
    end

    local function wrap_without_markings(func)
        -- remove from SMODS.Stickers just for this call
        local removed = {}
        for k, v in pairs(SMODS.Stickers) do
            if LR_UTIL.is_marking(k) then
                removed[k] = v
                SMODS.Stickers[k] = nil
            end
        end
        local ret = func()
        -- add them back once the UI was created
        for k, v in pairs(removed) do
            SMODS.Stickers[k] = v
        end
        return ret
    end
    -- override the creation of the 'Stickers' tab in the collection
    local stickers_ui_ref = create_UIBox_your_collection_stickers
    create_UIBox_your_collection_stickers = function()
        return wrap_without_markings(stickers_ui_ref)
    end
    -- override the creation of the 'Stickers' tab in our 'Additions' tab
    local other_objects_ref = create_UIBox_Other_GameObjects
    create_UIBox_Other_GameObjects = function()
        return wrap_without_markings(other_objects_ref)
    end

    LR_UTIL.ENABLED_MARKINGS = {
        "crease_mark",
        "pinhole_mark",
        "ink_mark"
    }
    LR_UTIL.load_files(files.markings.list, files.markings.directory)
end

-- friends of jimbo skins

SMODS.DeckSkin {
    key = "peppered_diamonds",
    suit = "Diamonds",
    loc_txt = "PEPPERED",
    palettes = {
        {
            key = 'lc',
            ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
            display_ranks = { 'Ace', 'King', 'Queen', 'Jack', '10' },
            pos_style = 'ranks',
            atlas = 'fmod_peppered_diamonds_lc'
        },
        {
            key = 'hc',
            ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
            display_ranks = { 'Ace', 'King', 'Queen', 'Jack', '10' },
            pos_style = 'ranks',
            atlas = 'fmod_peppered_diamonds_hc'
        }
    },
}

SMODS.DeckSkin {
    key = "yttd_clubs",
    suit = "Clubs",
    loc_txt = "Your Turn To Die",
    palettes = {
        {
            key = 'lc',
            ranks = { 'Jack', 'Queen', 'King', 'Ace' },
            display_ranks = { 'Ace', 'King', 'Queen', 'Jack' },
            pos_style = 'ranks',
            atlas = 'fmod_yttd_clubs_lc'
        },
        {
            key = 'hc',
            ranks = { 'Jack', 'Queen', 'King', 'Ace' },
            display_ranks = { 'Ace', 'King', 'Queen', 'Jack' },
            pos_style = 'ranks',
            atlas = 'fmod_yttd_clubs_hc'
        }
    },
}

SMODS.DeckSkin {
    key = "catgirl_hearts",
    suit = "Hearts",
    loc_txt = "Catgirls",
    palettes = {
        {
            key = 'lc',
            ranks = { 'Jack', 'Queen', 'King', 'Ace' },
            display_ranks = { 'Ace', 'King', 'Queen', 'Jack' },
            pos_style = 'ranks',
            atlas = 'fmod_catgirl_hearts_lc'
        },
        {
            key = 'hc',
            ranks = { 'Jack', 'Queen', 'King', 'Ace' },
            display_ranks = { 'Ace', 'King', 'Queen', 'Jack' },
            pos_style = 'ranks',
            atlas = 'fmod_catgirl_hearts_hc'
        }
    },
}

SMODS.DeckSkin {
    key = "deathnote_spades",
    suit = "Spades",
    loc_txt = "Death Note",
    palettes = {
        {
            key = 'lc',
            ranks = { 'Jack', 'Queen', 'King', 'Ace' },
            display_ranks = { 'Ace', 'King', 'Queen', 'Jack' },
            pos_style = 'ranks',
            atlas = 'fmod_deathnote_spades_lc'
        },
        {
            key = 'hc',
            ranks = { 'Jack', 'Queen', 'King', 'Ace' },
            display_ranks = { 'Ace', 'King', 'Queen', 'Jack' },
            pos_style = 'ranks',
            atlas = 'fmod_deathnote_spades_hc'
        }
    },
}

SMODS.DeckSkin {
    key = "deltarune_hearts",
    suit = "Hearts",
    loc_txt = "Deltarune",
    palettes = {
        {
            key = 'lc',
            ranks = { 'Jack', 'Queen', 'King', 'Ace' },
            display_ranks = { 'Ace', 'King', 'Queen', 'Jack' },
            pos_style = 'ranks',
            atlas = 'fmod_deltarune_hearts_lc'
        },
        {
            key = 'hc',
            ranks = { 'Jack', 'Queen', 'King', 'Ace' },
            display_ranks = { 'Ace', 'King', 'Queen', 'Jack' },
            pos_style = 'ranks',
            atlas = 'fmod_deltarune_hearts_hc'
        }
    },
}

SMODS.DeckSkin {
    key = "celeste_spades",
    suit = "Spades",
    loc_txt = "Celeste",
    palettes = {
        {
            key = 'lc',
            ranks = { 'Jack', 'Queen', 'King', 'Ace' },
            display_ranks = { 'Ace', 'King', 'Queen', 'Jack' },
            pos_style = 'ranks',
            atlas = 'fmod_celeste_spades_lc'
        },
        {
            key = 'hc',
            ranks = { 'Jack', 'Queen', 'King', 'Ace' },
            display_ranks = { 'Ace', 'King', 'Queen', 'Jack' },
            pos_style = 'ranks',
            atlas = 'fmod_celeste_spades_hc'
        }
    },
}

if next(SMODS.find_mod("paperback")) then
    SMODS.Atlas {
        key = "peppered_stars_lc",
        path = "collabs/peppered_stars_lc.png",
        px = 71,
        py = 95
    }
    SMODS.Atlas {
        key = "peppered_stars_hc",
        path = "collabs/peppered_stars_hc.png",
        px = 71,
        py = 95
    }
    SMODS.Atlas {
        key = "yttd_crowns_lc",
        path = "collabs/yttd_crowns_lc.png",
        px = 71,
        py = 95
    }
    SMODS.Atlas {
        key = "yttd_crowns_hc",
        path = "collabs/yttd_crowns_hc.png",
        px = 71,
        py = 95
    }
    SMODS.DeckSkin {
        key = "peppered_paperback_stars",
        suit = "paperback_Stars",
        loc_txt = "PEPPERED",
        palettes = {
            {
                key = 'lc',
                ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
                display_ranks = { 'Ace', 'King', 'Queen', 'Jack', '10' },
                pos_style = 'ranks',
                atlas = 'fmod_peppered_stars_lc'
            },
            {
                key = 'hc',
                ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
                display_ranks = { 'Ace', 'King', 'Queen', 'Jack', '10' },
                pos_style = 'ranks',
                atlas = 'fmod_peppered_stars_hc'
            }
        },
    }
    SMODS.DeckSkin {
        key = "yttd_paperback_crowns",
        suit = "paperback_Crowns",
        loc_txt = "Your Turn To Die",
        palettes = {
            {
                key = 'lc',
                ranks = { 'Jack', 'Queen', 'King', 'Ace' },
                display_ranks = { 'Ace', 'King', 'Queen', 'Jack' },
                pos_style = 'ranks',
                atlas = 'fmod_yttd_crowns_lc'
            },
            {
                key = 'hc',
                ranks = { 'Jack', 'Queen', 'King', 'Ace' },
                display_ranks = { 'Ace', 'King', 'Queen', 'Jack' },
                pos_style = 'ranks',
                atlas = 'fmod_yttd_crowns_hc'
            }
        }
    }
end
