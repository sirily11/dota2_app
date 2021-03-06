import 'dart:convert';

List<Map<String, dynamic>> heroData = [
  {
    "id": 1,
    "name": "npc_dota_hero_antimage",
    "localized_name": "敌法师",
    "primary_attr": "agi",
    "attack_type": "Melee",
    "roles": ["Carry", "Escape", "Nuker"],
    "legs": 2
  },
  {
    "id": 2,
    "name": "npc_dota_hero_axe",
    "localized_name": "斧王",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Initiator", "Durable", "Disabler", "Jungler"],
    "legs": 2
  },
  {
    "id": 3,
    "name": "npc_dota_hero_bane",
    "localized_name": "祸乱之源",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Support", "Disabler", "Nuker", "Durable"],
    "legs": 4
  },
  {
    "id": 4,
    "name": "npc_dota_hero_bloodseeker",
    "localized_name": "血魔",
    "primary_attr": "agi",
    "attack_type": "Melee",
    "roles": ["Carry", "Disabler", "Jungler", "Nuker", "Initiator"],
    "legs": 2
  },
  {
    "id": 5,
    "name": "npc_dota_hero_crystal_maiden",
    "localized_name": "冰晶魔女",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Support", "Disabler", "Nuker", "Jungler"],
    "legs": 2
  },
  {
    "id": 6,
    "name": "npc_dota_hero_drow_ranger",
    "localized_name": "卓尔游侠",
    "primary_attr": "agi",
    "attack_type": "Ranged",
    "roles": ["Carry", "Disabler", "Pusher"],
    "legs": 2
  },
  {
    "id": 7,
    "name": "npc_dota_hero_earthshaker",
    "localized_name": "撼地者",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Support", "Initiator", "Disabler", "Nuker"],
    "legs": 2
  },
  {
    "id": 8,
    "name": "npc_dota_hero_juggernaut",
    "localized_name": "主宰",
    "primary_attr": "agi",
    "attack_type": "Melee",
    "roles": ["Carry", "Pusher", "Escape"],
    "legs": 2
  },
  {
    "id": 9,
    "name": "npc_dota_hero_mirana",
    "localized_name": "米拉娜",
    "primary_attr": "agi",
    "attack_type": "Ranged",
    "roles": ["Carry", "Support", "Escape", "Nuker", "Disabler"],
    "legs": 2
  },
  {
    "id": 10,
    "name": "npc_dota_hero_morphling",
    "localized_name": "看血死",
    "primary_attr": "agi",
    "attack_type": "Ranged",
    "roles": ["Carry", "Escape", "Durable", "Nuker", "Disabler"],
    "legs": 0
  },
  {
    "id": 11,
    "name": "npc_dota_hero_nevermore",
    "localized_name": "Shadow Fiend",
    "primary_attr": "agi",
    "attack_type": "Ranged",
    "roles": ["Carry", "Nuker"],
    "legs": 0
  },
  {
    "id": 12,
    "name": "npc_dota_hero_phantom_lancer",
    "localized_name": "幻影长矛手",
    "primary_attr": "agi",
    "attack_type": "Melee",
    "roles": ["Carry", "Escape", "Pusher", "Nuker"],
    "legs": 2
  },
  {
    "id": 13,
    "name": "npc_dota_hero_puck",
    "localized_name": "帕克",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Initiator", "Disabler", "Escape", "Nuker"],
    "legs": 2
  },
  {
    "id": 14,
    "name": "npc_dota_hero_pudge",
    "localized_name": "路霸",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Disabler", "Initiator", "Durable", "Nuker"],
    "legs": 2
  },
  {
    "id": 15,
    "name": "npc_dota_hero_razor",
    "localized_name": "剃刀",
    "primary_attr": "agi",
    "attack_type": "Ranged",
    "roles": ["Carry", "Durable", "Nuker", "Pusher"],
    "legs": 0
  },
  {
    "id": 16,
    "name": "npc_dota_hero_sand_king",
    "localized_name": "沙子王",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Initiator", "Disabler", "Support", "Nuker", "Escape", "Jungler"],
    "legs": 6
  },
  {
    "id": 17,
    "name": "npc_dota_hero_storm_spirit",
    "localized_name": "风暴之灵",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Carry", "Escape", "Nuker", "Initiator", "Disabler"],
    "legs": 2
  },
  {
    "id": 18,
    "name": "npc_dota_hero_sven",
    "localized_name": "斯文",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Carry", "Disabler", "Initiator", "Durable", "Nuker"],
    "legs": 2
  },
  {
    "id": 19,
    "name": "npc_dota_hero_tiny",
    "localized_name": "小小",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Carry", "Nuker", "Pusher", "Initiator", "Durable", "Disabler"],
    "legs": 2
  },
  {
    "id": 20,
    "name": "npc_dota_hero_vengefulspirit",
    "localized_name": "复仇之魂",
    "primary_attr": "agi",
    "attack_type": "Ranged",
    "roles": ["Support", "Initiator", "Disabler", "Nuker", "Escape"],
    "legs": 2
  },
  {
    "id": 21,
    "name": "npc_dota_hero_windrunner",
    "localized_name": "风行者",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Carry", "Support", "Disabler", "Escape", "Nuker"],
    "legs": 2
  },
  {
    "id": 22,
    "name": "npc_dota_hero_zuus",
    "localized_name": "宙斯",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Nuker"],
    "legs": 2
  },
  {
    "id": 23,
    "name": "npc_dota_hero_kunkka",
    "localized_name": "昆卡",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Carry", "Support", "Disabler", "Initiator", "Durable", "Nuker"],
    "legs": 2
  },
  {
    "id": 25,
    "name": "npc_dota_hero_lina",
    "localized_name": "丽娜",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Support", "Carry", "Nuker", "Disabler"],
    "legs": 2
  },
  {
    "id": 26,
    "name": "npc_dota_hero_lion",
    "localized_name": "莱恩",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Support", "Disabler", "Nuker", "Initiator"],
    "legs": 2
  },
  {
    "id": 27,
    "name": "npc_dota_hero_shadow_shaman",
    "localized_name": "暗影萨满",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Support", "Pusher", "Disabler", "Nuker", "Initiator"],
    "legs": 2
  },
  {
    "id": 28,
    "name": "npc_dota_hero_slardar",
    "localized_name": "斯拉达",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Carry", "Durable", "Initiator", "Disabler", "Escape"],
    "legs": 0
  },
  {
    "id": 29,
    "name": "npc_dota_hero_tidehunter",
    "localized_name": "潮汐猎人",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Initiator", "Durable", "Disabler", "Nuker"],
    "legs": 2
  },
  {
    "id": 30,
    "name": "npc_dota_hero_witch_doctor",
    "localized_name": "哦耶～嘿嘿嘿兄弟",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Support", "Nuker", "Disabler"],
    "legs": 2
  },
  {
    "id": 31,
    "name": "npc_dota_hero_lich",
    "localized_name": "巫妖",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Support", "Nuker"],
    "legs": 2
  },
  {
    "id": 32,
    "name": "npc_dota_hero_riki",
    "localized_name": "力丸",
    "primary_attr": "agi",
    "attack_type": "Melee",
    "roles": ["Carry", "Escape", "Disabler"],
    "legs": 2
  },
  {
    "id": 33,
    "name": "npc_dota_hero_enigma",
    "localized_name": "黑洞王",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Disabler", "Jungler", "Initiator", "Pusher"],
    "legs": 0
  },
  {
    "id": 34,
    "name": "npc_dota_hero_tinker",
    "localized_name": "修补匠",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Carry", "Nuker", "Pusher"],
    "legs": 2
  },
  {
    "id": 35,
    "name": "npc_dota_hero_sniper",
    "localized_name": "狙击老头",
    "primary_attr": "agi",
    "attack_type": "Ranged",
    "roles": ["Carry", "Nuker"],
    "legs": 2
  },
  {
    "id": 36,
    "name": "npc_dota_hero_necrolyte",
    "localized_name": "瘟疫法师",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Carry", "Nuker", "Durable", "Disabler"],
    "legs": 2
  },
  {
    "id": 37,
    "name": "npc_dota_hero_warlock",
    "localized_name": "术士",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Support", "Initiator", "Disabler"],
    "legs": 2
  },
  {
    "id": 38,
    "name": "npc_dota_hero_beastmaster",
    "localized_name": "兽王",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Initiator", "Disabler", "Durable", "Nuker"],
    "legs": 2
  },
  {
    "id": 39,
    "name": "npc_dota_hero_queenofpain",
    "localized_name": "痛苦女王",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Carry", "Nuker", "Escape"],
    "legs": 2
  },
  {
    "id": 40,
    "name": "npc_dota_hero_venomancer",
    "localized_name": "剧毒术士",
    "primary_attr": "agi",
    "attack_type": "Ranged",
    "roles": ["Support", "Nuker", "Initiator", "Pusher", "Disabler"],
    "legs": 0
  },
  {
    "id": 41,
    "name": "npc_dota_hero_faceless_void",
    "localized_name": "虚空假面",
    "primary_attr": "agi",
    "attack_type": "Melee",
    "roles": ["Carry", "Initiator", "Disabler", "Escape", "Durable"],
    "legs": 2
  },
  {
    "id": 42,
    "name": "npc_dota_hero_skeleton_king",
    "localized_name": "幽冥大帝",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Carry", "Support", "Durable", "Disabler", "Initiator"],
    "legs": 2
  },
  {
    "id": 43,
    "name": "npc_dota_hero_death_prophet",
    "localized_name": "死亡先知",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Carry", "Pusher", "Nuker", "Disabler"],
    "legs": 2
  },
  {
    "id": 44,
    "name": "npc_dota_hero_phantom_assassin",
    "localized_name": "幻影刺客",
    "primary_attr": "agi",
    "attack_type": "Melee",
    "roles": ["Carry", "Escape"],
    "legs": 2
  },
  {
    "id": 45,
    "name": "npc_dota_hero_pugna",
    "localized_name": "帕格娜",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Nuker", "Pusher"],
    "legs": 2
  },
  {
    "id": 46,
    "name": "npc_dota_hero_templar_assassin",
    "localized_name": "圣堂刺客",
    "primary_attr": "agi",
    "attack_type": "Ranged",
    "roles": ["Carry", "Escape"],
    "legs": 2
  },
  {
    "id": 47,
    "name": "npc_dota_hero_viper",
    "localized_name": "冥界亚龙",
    "primary_attr": "agi",
    "attack_type": "Ranged",
    "roles": ["Carry", "Durable", "Initiator", "Disabler"],
    "legs": 0
  },
  {
    "id": 48,
    "name": "npc_dota_hero_luna",
    "localized_name": "露娜",
    "primary_attr": "agi",
    "attack_type": "Ranged",
    "roles": ["Carry", "Nuker", "Pusher"],
    "legs": 2
  },
  {
    "id": 49,
    "name": "npc_dota_hero_dragon_knight",
    "localized_name": "龙骑士",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Carry", "Pusher", "Durable", "Disabler", "Initiator", "Nuker"],
    "legs": 2
  },
  {
    "id": 50,
    "name": "npc_dota_hero_dazzle",
    "localized_name": "戴泽",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Support", "Nuker", "Disabler"],
    "legs": 2
  },
  {
    "id": 51,
    "name": "npc_dota_hero_rattletrap",
    "localized_name": "Clockwerk",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Initiator", "Disabler", "Durable", "Nuker"],
    "legs": 2
  },
  {
    "id": 52,
    "name": "npc_dota_hero_leshrac",
    "localized_name": "拉席克",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Carry", "Support", "Nuker", "Pusher", "Disabler"],
    "legs": 4
  },
  {
    "id": 53,
    "name": "npc_dota_hero_furion",
    "localized_name": "先知",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Carry", "Jungler", "Pusher", "Escape", "Nuker"],
    "legs": 2
  },
  {
    "id": 54,
    "name": "npc_dota_hero_life_stealer",
    "localized_name": "噬魂鬼",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Carry", "Durable", "Jungler", "Escape", "Disabler"],
    "legs": 2
  },
  {
    "id": 55,
    "name": "npc_dota_hero_dark_seer",
    "localized_name": "黑暗贤者",
    "primary_attr": "int",
    "attack_type": "Melee",
    "roles": ["Initiator", "Jungler", "Escape", "Disabler"],
    "legs": 2
  },
  {
    "id": 56,
    "name": "npc_dota_hero_clinkz",
    "localized_name": "克林克滋",
    "primary_attr": "agi",
    "attack_type": "Ranged",
    "roles": ["Carry", "Escape", "Pusher"],
    "legs": 2
  },
  {
    "id": 57,
    "name": "npc_dota_hero_omniknight",
    "localized_name": "全能骑士",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Support", "Durable", "Nuker"],
    "legs": 2
  },
  {
    "id": 58,
    "name": "npc_dota_hero_enchantress",
    "localized_name": "小鹿",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Support", "Jungler", "Pusher", "Durable", "Disabler"],
    "legs": 4
  },
  {
    "id": 59,
    "name": "npc_dota_hero_huskar",
    "localized_name": "哈士奇",
    "primary_attr": "str",
    "attack_type": "Ranged",
    "roles": ["Carry", "Durable", "Initiator"],
    "legs": 2
  },
  {
    "id": 60,
    "name": "npc_dota_hero_night_stalker",
    "localized_name": "暗夜魔王",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Carry", "Initiator", "Durable", "Disabler", "Nuker"],
    "legs": 2
  },
  {
    "id": 61,
    "name": "npc_dota_hero_broodmother",
    "localized_name": "育母蜘蛛",
    "primary_attr": "agi",
    "attack_type": "Melee",
    "roles": ["Carry", "Pusher", "Escape", "Nuker"],
    "legs": 8
  },
  {
    "id": 62,
    "name": "npc_dota_hero_bounty_hunter",
    "localized_name": "赏金猎人",
    "primary_attr": "agi",
    "attack_type": "Melee",
    "roles": ["Escape", "Nuker"],
    "legs": 2
  },
  {
    "id": 63,
    "name": "npc_dota_hero_weaver",
    "localized_name": "编织者",
    "primary_attr": "agi",
    "attack_type": "Ranged",
    "roles": ["Carry", "Escape"],
    "legs": 4
  },
  {
    "id": 64,
    "name": "npc_dota_hero_jakiro",
    "localized_name": "杰奇洛",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Support", "Nuker", "Pusher", "Disabler"],
    "legs": 2
  },
  {
    "id": 65,
    "name": "npc_dota_hero_batrider",
    "localized_name": "蝙蝠骑士",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Initiator", "Jungler", "Disabler", "Escape"],
    "legs": 2
  },
  {
    "id": 66,
    "name": "npc_dota_hero_chen",
    "localized_name": "陈",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Support", "Jungler", "Pusher"],
    "legs": 2
  },
  {
    "id": 67,
    "name": "npc_dota_hero_spectre",
    "localized_name": "幽鬼",
    "primary_attr": "agi",
    "attack_type": "Melee",
    "roles": ["Carry", "Durable", "Escape"],
    "legs": 0
  },
  {
    "id": 68,
    "name": "npc_dota_hero_ancient_apparition",
    "localized_name": "远古冰魂",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Support", "Disabler", "Nuker"],
    "legs": 2
  },
  {
    "id": 69,
    "name": "npc_dota_hero_doom_bringer",
    "localized_name": "末日使者",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Carry", "Disabler", "Initiator", "Durable", "Nuker"],
    "legs": 2
  },
  {
    "id": 70,
    "name": "npc_dota_hero_ursa",
    "localized_name": "熊战士",
    "primary_attr": "agi",
    "attack_type": "Melee",
    "roles": ["Carry", "Jungler", "Durable", "Disabler"],
    "legs": 2
  },
  {
    "id": 71,
    "name": "npc_dota_hero_spirit_breaker",
    "localized_name": "裂魂人",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Carry", "Initiator", "Disabler", "Durable", "Escape"],
    "legs": 2
  },
  {
    "id": 72,
    "name": "npc_dota_hero_gyrocopter",
    "localized_name": "矮人直升机",
    "primary_attr": "agi",
    "attack_type": "Ranged",
    "roles": ["Carry", "Nuker", "Disabler"],
    "legs": 2
  },
  {
    "id": 73,
    "name": "npc_dota_hero_alchemist",
    "localized_name": "炼金术士",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Carry", "Support", "Durable", "Disabler", "Initiator", "Nuker"],
    "legs": 2
  },
  {
    "id": 74,
    "name": "npc_dota_hero_invoker",
    "localized_name": "祈求者",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Carry", "Nuker", "Disabler", "Escape", "Pusher"],
    "legs": 2
  },
  {
    "id": 75,
    "name": "npc_dota_hero_silencer",
    "localized_name": "沉默术士",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Carry", "Support", "Disabler", "Initiator", "Nuker"],
    "legs": 2
  },
  {
    "id": 76,
    "name": "npc_dota_hero_obsidian_destroyer",
    "localized_name": "殁境神蚀者",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Carry", "Nuker", "Disabler"],
    "legs": 4
  },
  {
    "id": 77,
    "name": "npc_dota_hero_lycan",
    "localized_name": "狼人",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Carry", "Pusher", "Jungler", "Durable", "Escape"],
    "legs": 2
  },
  {
    "id": 78,
    "name": "npc_dota_hero_brewmaster",
    "localized_name": "酒仙",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Carry", "Initiator", "Durable", "Disabler", "Nuker"],
    "legs": 2
  },
  {
    "id": 79,
    "name": "npc_dota_hero_shadow_demon",
    "localized_name": "暗影恶魔",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Support", "Disabler", "Initiator", "Nuker"],
    "legs": 2
  },
  {
    "id": 80,
    "name": "npc_dota_hero_lone_druid",
    "localized_name": "德鲁伊",
    "primary_attr": "agi",
    "attack_type": "Ranged",
    "roles": ["Carry", "Pusher", "Jungler", "Durable"],
    "legs": 2
  },
  {
    "id": 81,
    "name": "npc_dota_hero_chaos_knight",
    "localized_name": "混沌骑士",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Carry", "Disabler", "Durable", "Pusher", "Initiator"],
    "legs": 2
  },
  {
    "id": 82,
    "name": "npc_dota_hero_meepo",
    "localized_name": "米波",
    "primary_attr": "agi",
    "attack_type": "Melee",
    "roles": ["Carry", "Escape", "Nuker", "Disabler", "Initiator", "Pusher"],
    "legs": 2
  },
  {
    "id": 83,
    "name": "npc_dota_hero_treant",
    "localized_name": "树精卫士",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Support", "Initiator", "Durable", "Disabler", "Escape"],
    "legs": 2
  },
  {
    "id": 84,
    "name": "npc_dota_hero_ogre_magi",
    "localized_name": "食人魔魔法师",
    "primary_attr": "int",
    "attack_type": "Melee",
    "roles": ["Support", "Nuker", "Disabler", "Durable", "Initiator"],
    "legs": 2
  },
  {
    "id": 85,
    "name": "npc_dota_hero_undying",
    "localized_name": "不朽尸王",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Support", "Durable", "Disabler", "Nuker"],
    "legs": 2
  },
  {
    "id": 86,
    "name": "npc_dota_hero_rubick",
    "localized_name": "拉比克",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Support", "Disabler", "Nuker"],
    "legs": 2
  },
  {
    "id": 87,
    "name": "npc_dota_hero_disruptor",
    "localized_name": "干扰者",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Support", "Disabler", "Nuker", "Initiator"],
    "legs": 2
  },
  {
    "id": 88,
    "name": "npc_dota_hero_nyx_assassin",
    "localized_name": "司夜刺客",
    "primary_attr": "agi",
    "attack_type": "Melee",
    "roles": ["Disabler", "Nuker", "Initiator", "Escape"],
    "legs": 6
  },
  {
    "id": 89,
    "name": "npc_dota_hero_naga_siren",
    "localized_name": "娜迦海妖",
    "primary_attr": "agi",
    "attack_type": "Melee",
    "roles": ["Carry", "Support", "Pusher", "Disabler", "Initiator", "Escape"],
    "legs": 0
  },
  {
    "id": 90,
    "name": "npc_dota_hero_keeper_of_the_light",
    "localized_name": "光之守卫",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Support", "Nuker", "Disabler", "Jungler"],
    "legs": 2
  },
  {
    "id": 91,
    "name": "npc_dota_hero_wisp",
    "localized_name": "爱欧",
    "primary_attr": "str",
    "attack_type": "Ranged",
    "roles": ["Support", "Escape", "Nuker"],
    "legs": 0
  },
  {
    "id": 92,
    "name": "npc_dota_hero_visage",
    "localized_name": "维萨吉",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Support", "Nuker", "Durable", "Disabler", "Pusher"],
    "legs": 2
  },
  {
    "id": 93,
    "name": "npc_dota_hero_slark",
    "localized_name": "斯拉克",
    "primary_attr": "agi",
    "attack_type": "Melee",
    "roles": ["Carry", "Escape", "Disabler", "Nuker"],
    "legs": 2
  },
  {
    "id": 94,
    "name": "npc_dota_hero_medusa",
    "localized_name": "美杜莎",
    "primary_attr": "agi",
    "attack_type": "Ranged",
    "roles": ["Carry", "Disabler", "Durable"],
    "legs": 0
  },
  {
    "id": 95,
    "name": "npc_dota_hero_troll_warlord",
    "localized_name": "巨魔战将",
    "primary_attr": "agi",
    "attack_type": "Ranged",
    "roles": ["Carry", "Pusher", "Disabler", "Durable"],
    "legs": 2
  },
  {
    "id": 96,
    "name": "npc_dota_hero_centaur",
    "localized_name": "半人马战行者",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Durable", "Initiator", "Disabler", "Nuker", "Escape"],
    "legs": 4
  },
  {
    "id": 97,
    "name": "npc_dota_hero_magnataur",
    "localized_name": "马格纳斯",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Initiator", "Disabler", "Nuker", "Escape"],
    "legs": 4
  },
  {
    "id": 98,
    "name": "npc_dota_hero_shredder",
    "localized_name": "伐木机",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Nuker", "Durable", "Escape"],
    "legs": 2
  },
  {
    "id": 99,
    "name": "npc_dota_hero_bristleback",
    "localized_name": "钢背兽",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Carry", "Durable", "Initiator", "Nuker"],
    "legs": 2
  },
  {
    "id": 100,
    "name": "npc_dota_hero_tusk",
    "localized_name": "巨牙海民",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Initiator", "Disabler", "Nuker"],
    "legs": 2
  },
  {
    "id": 101,
    "name": "npc_dota_hero_skywrath_mage",
    "localized_name": "天怒法师",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Support", "Nuker", "Disabler"],
    "legs": 2
  },
  {
    "id": 102,
    "name": "npc_dota_hero_abaddon",
    "localized_name": "亚巴顿",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Support", "Carry", "Durable"],
    "legs": 2
  },
  {
    "id": 103,
    "name": "npc_dota_hero_elder_titan",
    "localized_name": "上古巨神",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Initiator", "Disabler", "Nuker", "Durable"],
    "legs": 2
  },
  {
    "id": 104,
    "name": "npc_dota_hero_legion_commander",
    "localized_name": "军团指挥官",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Carry", "Disabler", "Initiator", "Durable", "Nuker"],
    "legs": 2
  },
  {
    "id": 105,
    "name": "npc_dota_hero_techies",
    "localized_name": "工程师",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Nuker", "Disabler"],
    "legs": 6
  },
  {
    "id": 106,
    "name": "npc_dota_hero_ember_spirit",
    "localized_name": "灰烬之灵",
    "primary_attr": "agi",
    "attack_type": "Melee",
    "roles": ["Carry", "Escape", "Nuker", "Disabler", "Initiator"],
    "legs": 2
  },
  {
    "id": 107,
    "name": "npc_dota_hero_earth_spirit",
    "localized_name": "大地之灵",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Nuker", "Escape", "Disabler", "Initiator", "Durable"],
    "legs": 2
  },
  {
    "id": 108,
    "name": "npc_dota_hero_abyssal_underlord",
    "localized_name": "孽主",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Support", "Nuker", "Disabler", "Durable", "Escape"],
    "legs": 2
  },
  {
    "id": 109,
    "name": "npc_dota_hero_terrorblade",
    "localized_name": "恐怖利刃",
    "primary_attr": "agi",
    "attack_type": "Melee",
    "roles": ["Carry", "Pusher", "Nuker"],
    "legs": 2
  },
  {
    "id": 110,
    "name": "npc_dota_hero_phoenix",
    "localized_name": "凤凰",
    "primary_attr": "str",
    "attack_type": "Ranged",
    "roles": ["Support", "Nuker", "Initiator", "Escape", "Disabler"],
    "legs": 2
  },
  {
    "id": 111,
    "name": "npc_dota_hero_oracle",
    "localized_name": "神谕者",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Support", "Nuker", "Disabler", "Escape"],
    "legs": 2
  },
  {
    "id": 112,
    "name": "npc_dota_hero_winter_wyvern",
    "localized_name": "寒冰飞龙",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Support", "Disabler", "Nuker"],
    "legs": 2
  },
  {
    "id": 113,
    "name": "npc_dota_hero_arc_warden",
    "localized_name": "天穹守望者",
    "primary_attr": "agi",
    "attack_type": "Ranged",
    "roles": ["Carry", "Escape", "Nuker"],
    "legs": 2
  },
  {
    "id": 114,
    "name": "npc_dota_hero_monkey_king",
    "localized_name": "齐天大圣",
    "primary_attr": "agi",
    "attack_type": "Melee",
    "roles": ["Carry", "Escape", "Disabler", "Initiator"],
    "legs": 2
  },
  {
    "id": 119,
    "name": "npc_dota_hero_dark_willow",
    "localized_name": "邪影芳灵",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Support", "Nuker", "Disabler", "Escape"],
    "legs": 2
  },
  {
    "id": 120,
    "name": "npc_dota_hero_pangolier",
    "localized_name": "石鳞剑士",
    "primary_attr": "agi",
    "attack_type": "Melee",
    "roles": ["Carry", "Nuker", "Disabler", "Durable", "Escape", "Initiator"],
    "legs": 2
  },
  {
    "id": 121,
    "name": "npc_dota_hero_grimstroke",
    "localized_name": "天涯墨客",
    "primary_attr": "int",
    "attack_type": "Ranged",
    "roles": ["Support", "Nuker", "Disabler", "Escape"],
    "legs": 2
  },
  {
    "id": 126,
    "name": "npc_dota_hero_void_spirit",
    "localized_name": "虚空之灵",
    "primary_attr": "int",
    "attack_type": "Melee",
    "roles": ["Carry", "Escape", "Nuker", "Disabler"],
    "legs": 2
  },
  {
    "id": 128,
    "name": "npc_dota_hero_snapfire",
    "localized_name": "电炎绝手",
    "primary_attr": "str",
    "attack_type": "Ranged",
    "roles": ["Support", "Nuker", "Disabler", "Escape"],
    "legs": 2
  },
  {
    "id": 129,
    "name": "npc_dota_hero_mars",
    "localized_name": "马尔斯",
    "primary_attr": "str",
    "attack_type": "Melee",
    "roles": ["Carry", "Initiator", "Disabler", "Durable"],
    "legs": 2
  }
];

class DotaHero {
  int id;
  String name;
  String localizedName;
  String primaryAttr;
  String attackType;
  List<dynamic> roles;

  DotaHero({
    this.id,
    this.name,
    this.localizedName,
    this.primaryAttr,
    this.attackType,
    this.roles,
  });

  factory DotaHero.fromJson(Map<String, dynamic> json) => DotaHero(
        id: json["id"],
        name: json["name"],
        localizedName: json["localized_name"],
        primaryAttr: json["primary_attr"],
        attackType: json["attack_type"],
        roles: List<dynamic>.from(json["roles"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "localized_name": localizedName,
        "primary_attr": primaryAttr,
        "attack_type": attackType,
        "roles": List<dynamic>.from(roles.map((x) => x)),
      };
}
