///////////////////////////////////////////////////////////////////////////
///////////////////Spellplague Item Property Header File///////////////////
///////////////////Made by Valerie Runge for the Spellplague Server////////
///////////////////////////////////////////////////////////////////////////

//Adds a stat bonus equal to nBonus [1-20]
//nAbility [IP_CONST_ABILITY_*] determines the ability
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead
void AddAbilityBonus(object oItem, int nBonus, int nAbility, string sName = "");

//Adds an AC bonus equal to nBonus [1-20]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddACBonus(object oItem, int nBonus, string sName = "");

//Adds an AC bonus equal to nBonus [1-20]
//Towards an alignment GROUP, such as Good or Chaotic. AddACBonusVsSpecificAlign does the same for specific alignments
//nAlign is using the IP_CONST_ALIGNMENTGROUP_* constants
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddACBonusVsAlign(object oItem, int nAlign, int nBonus, string sName = "");

//Adds an AC bonus equal to nBonus [1-20]
//Towards a SPECIFIC alignment, such as Lawful Good or Chaotic Nuetral. AddACBonusVsAlign does the same for alignment Groups
//nAlign is using the IP_CONST_ALIGNMENT_* constants
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddACBonusVsSpecificAlign(object oItem, int nAlign, int nBonus, string sName = "");

//Adds an AC bonus equal to nBonus [1-20]
//nDam is using the IP_CONST_DAMAGETYPE_* constants, only the physical types may be used
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddACBonusVsDmgType(object oItem, int nDam, int nBonus, string sName = "");

//Adds an AC bonus equal to nBonus [1-20]
//nDam is using the IP_CONST_RACIALTYPE_* constants
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddACBonusVsRace(object oItem, int nRace, int nBonus, string sName = "");

//Adds Arcane Spell Failure to an Item
//nLevel is using the ITEM_PROP_ASF_* group
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddArcaneSpellFailure(object oItem, int nLevel, string sName = "");

//Adds an Attack bonus equal to nBonus [1-20]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddAttackBonus(object oItem, int nBonus, string sName = "");

//Adds an Attack bonus equal to nBonus [1-20]
//Towards an alignment GROUP, such as Good or Chaotic. AddACBonusVsSpecificAlign does the same for specific alignments
//nAlign is using the IP_CONST_ALIGNMENTGROUP_* constants
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddAttackBonusVsAlign(object oItem, int nAlign, int nBonus, string sName = "");

//Adds an Attack bonus equal to nBonus [1-20]
//Towards a SPECIFIC alignment, such as Lawful Good or Chaotic Nuetral. AddACBonusVsAlign does the same for alignment Groups
//nAlign is using the IP_CONST_ALIGNMENT_* constants
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddAttackBonusVsSpecificAlign(object oItem, int nAlign, int nBonus, string sName = "");

//Adds an Attack bonus equal to nBonus [1-20]
//nDam is using the IP_CONST_RACIALTYPE_* constants
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddAttackBonusVsRace(object oItem, int nRace, int nBonus, string sName = "");

//Adds an Attack Penalty equal to nBonus [1-20]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddAttackPenalty(object oItem, int nBonus, string sName = "");

//Adds the given Feat to an item's Passive Feat give.
//nFeat is the feat's number on the iprp_feats.2da table. For basegame feats, feel free to use the IP_CONST_FEAT_* constants.
//sName should be the name of the effect. It will be tagged whatever sName is.
void AddBonusFeat(object oItem, int nFeat, string sName);

//Adds a bonus spell slot from a specific class
//nClass uses IP_CONST_CLASS_* or just the class numbers if you know those.
//nSpellLevel [0-9] determines the level of the slot.
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddBonusLevelSpell(object oItem, int nClass, int nSpellLevel, string sName = "");

//Adds nBonus [1-20]
//to nThrow [IP_CONST_SAVEBASETYPE_*]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddBonusSavingThrow(object oItem, int nBonus, int nThrow, string sName = "");

//Adds nBonus [1-20]
//to nThrow [IP_CONST_SAVEVS_*]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddBonusSavingThrowVsSpecific(object oItem, int nBonus, int nThrow, string sName = "");

//Adds nBonus [IP_CONST_SPELLRESISTANCEBONUS_*] to Spell Resistance
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddBonusSpellResistance(object oItem, int nBonus, string sName = "");

//Adds the ability to cast nSpell (IP_CONST_CASTSPELL_*)
//nUses (IP_CONST_CASTSPELL_NUMUSES_*)
//sName should be the name of the effect. It will be tagged whatever sName is.
void AddSpellCasts(object oItem, int nSpell, int nUses, string sName);

//Adds reduced weight to Containers based on nReduction [IP_CONST_CONTAINERWEIGHTRED_*]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddContainerReducedWeight(object oItem, int nReduction, string sName = "");

//Adds nBonus (IP_CONST_DAMAGEBONUS_*) of nType (IP_CONST_DAMAGETYPE_*)
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddDamageBonus(object oItem, int nBonus, int nType, string sName = "");

//Adds nBonus (IP_CONST_DAMAGEBONUS_*) of nType (IP_CONST_DAMAGETYPE_*)
//vs nAlign (IP_CONST_ALIGNMENTGROUP_*)
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddDamageBonusVsAlign(object oItem, int nBonus, int nType, int nAlign, string sName = "");

//Adds nBonus (IP_CONST_DAMAGEBONUS_*) of nType (IP_CONST_DAMAGETYPE_*)
//vs nAlign (IP_CONST_ALIGNMENT_*)
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddDamageBonusVsSpecificAlign(object oItem, int nBonus, int nType, int nAlign, string sName = "");

//Adds nBonus (IP_CONST_DAMAGEBONUS_*) of nType (IP_CONST_DAMAGETYPE_*)
//vs nRace (IP_CONST_RACIALTYPE_*)
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddDamageBonusVsRace(object oItem, int nBonus, int nType, int nRace, string sName = "");

//Adds nImmunity [IP_CONST_DAMAGEIMMUNITY_* or Number as Defined in iprp_immunity.2da] vs nType [IP_CONST_DAMAGEIMMUNITY_*]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddDamageImmunity(object oItem, int nImmunity, int nType, string sName = "");

//Adds nBonus [1-5] as a Damage Penalty
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddDamagePenalty(object oItem, int nBonus, string sName = "");

//Adds nReduction [IP_CONST_DAMAGESOAK_*] with nEnhancement [IP_CONST_DAMAGEREDUCTION_*] as the enhancement bonus required to pierce
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddDamageReduction(object oItem, int nReduction, int nEnhancement, string sName = "");

//Adds nReduction [IP_CONST_DAMAGERESIST_*] with nType [IP_CONST_DAMAGETYPE_*]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddDamageResist(object oItem, int nReduction, int nType, string sName = "");

//Adds a nVulnerability [IP_CONST_DAMAGEVULNERABILITY_*] for nType [IP_CONST_DAMAGETYPE_*]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddDamageVulnerability(object oItem, int nVulnerability, int nType, string sName = "");

//Adds the Darkvision Item Property.
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddDarkvision(object oItem, string sName = "");

//Adds a decrease to nAbility [IP_CONST_ABILITY_*] of nBonus [1-5]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddDecreaseAbility(object oItem, int nAbility, int nBonus, string sName = "");

//Adds a decrease to AC equal to nBonus [1-5]
//nType [IP_CONST_ACMODIFIERTYPE_*]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddDecreaseAC(object oItem, int nType, int nBonus, string sName = "");

//Adds a decrease to nSkill [SKILL_* or the skill number] equal to nBonus [1-10]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddDecreaseSkill(object oItem, int nSkill, int nBonus, string sName = "");

//Adds an enhancement bonus equal to nBonus [1-20]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddEnhancementBonus(object oItem, int nBonus, string sName = "");

//Adds an enhancement bonus equal to nBonus [1-20]
//vs nAlign [IP_CONST_ALIGNMENTGROUP_*]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddEnhancementBonusVsAlign(object oItem, int nBonus, int nAlign, string sName = "");

//Adds an enhancement bonus equal to nBonus [1-20]
//vs nAlign [IP_CONST_ALIGNMENT_*]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddEnhancementBonusVsSpecificAlign(object oItem, int nBonus, int nAlign, string sName = "");

//Adds an enhancement bonus equal to nBonus [1-20]
//vs nRace [IP_CONST_RACE_*]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddEnhancementBonusVsRace(object oItem, int nBonus, int nRace, string sName = "");

//Adds an enhancement Penalty equal to nBonus [1-5]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddEnhancementPenalty(object oItem, int nBonus, string sName = "");

//Changes the Damage Type of the weapon to nType [IP_CONST_DAMAGETYPE] which must be one of the physical damage types
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddExtraMeleeDamageType(object oItem, int nType, string sName = "");

//Changes the Damage Type of the weapon to nType [IP_CONST_DAMAGETYPE] which must be one of the physical damage types
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddExtraRangeDamageType(object oItem, int nType, string sName = "");

//Adds the Free Action property
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddFreeAction(object oItem, string sName = "");

//Adds the Haste property
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddHaste(object oItem, string sName = "");

//Turns the item into a Healer's kit of nLevel [1-12]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddHealersKit(object oItem, int nLevel, string sName = "");

//Adds the Holy Avenger Property
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddHolyAvenger(object oItem, string sName = "");

//Adds an nImmunity [IP_CONST_IMMUNITYMISC_*]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddMiscImmunity(object oItem, int nImmunity, string sName = "");

//Adds an immunity to spells nLevel [0-9] and below
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddImmunityToSpellLevel(object oItem, int nLevel, string sName = "");

//Adds the Improved Evasion Property
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddImprovedEvasion(object oItem, string sName = "");

//Adds the Keen Property
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddKeen(object oItem, string sName = "");

//Adds the Light Property of nBrightness [IP_CONST_LIGHTBRIGHTNESS_*] and with nColor [IP_CONST_LIGHTCOLOR_*]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddLight(object oItem, int nBrightness, int nColor, string sName = "");

//Limits item use by nAlign [IP_CONST_ALIGNMENTGROUP_*]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddLimitByAlign(object oItem, int nAlign, string sName = "");

//Limits item use by nAlign [IP_CONST_ALIGNMENT_*]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddLimitBySpecificAlign(object oItem, int nAlign, string sName = "");

//Limits item use by nClass [IP_CONST_CLASS_* or Class  Number]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddLimitByClass(object oItem, int nClass, string sName = "");

//Limits item use by nRace [IP_CONST_RACIALTYPE_*]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddLimitByRace(object oItem, int nRace, string sName = "");

//Adds Massive Critical of nDam [IP_CONST_DAMAGEBONUS_*]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddMassiveCrit(object oItem, int nDam, string sName = "");

//Adds a nMaterial [0-77] property
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddMaterial(object oItem, int nMaterial, string sName = "");

//Adds a Max Strength mod increase for Ranged Weapons equal to nBonus [1-20]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddMighty(object oItem, int nBonus, string sName = "");

//sets damage of Natural weapons equal to nDam [IP_CONST_MONSTERDAMAGE_*]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddMonsterDamage(object oItem, int nDam, string sName = "");

//Makes an item deal no damage, becoming a practice item.
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddNoDamage(object oItem, string sName = "");

//make an item cast nSpell [IP_CONST_ONHIT_CASTSPELL_* or Number as Defined in iprp_onhitspell.2da] at nLevel [Caster Level, 1-30]
//Only one of these effects will trigger. Multiple triggers should use AddOnHitProps.
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddOnHitCastSpell(object oItem, int nSpell, int nLevel, string sName = "");

//adds an item property trigger on hit. property is nProp [IP_CONST_ONHIT_* or Number as Defined in iprp_onhit.2da]
//Use IP_CONST_ONHIT_SAVEDC_* Constants
//nSpecial is the special requirement for some effects. They are listed at ( https://nwnlexicon.com/index.php?title=ItemPropertyOnHitProps ) or in the description of ItemPropertyOnHitProps()
//The description is missing 2 effects of nSpecial.
//LEVELDRAIN and WOUNDING also require the special parameter of 1-5, being how many levels to drain / the amount of wounding.
void AddOnHitProps(object oItem, int nProp, int nDC, int nSpecial = 0, string sName = "");

//THIS ONLY WORKS ON NATURAL WEAPONS. IT WILL NOT WORK OTHERWISE.
//adds an item property trigger on hit. property is nProp [IP_CONST_ONHIT_* or Number as Defined in iprp_monsterhit.2da]
//DC is equal to nDC
//nSpecial is the special requirement for some effects. They are listed at ( https://nwnlexicon.com/index.php?title=ItemPropertyOnHitProps ) or in the description of ItemPropertyOnHitProps()
//The description is missing 2 effects of nSpecial.
//LEVELDRAIN and WOUNDING also require the special parameter of 1-5, being how many levels to drain / the amount of wounding
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddOnMonsterHitProperties(object oItem, int nProp, int nSpecial = 0, string sName = "");

//adds nQuality [IP_CONST_QUALITY_* or Number as defined in iprp_qualcost.2da] to item
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddQuality(object oItem, int nQuality, string sName = "");

//adds a reduction to nSave [IP_CONST_SAVEBASETYPE_*] equal to nBonus [1-20]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddReducedSavingThrow(object oItem, int nSave, int nBonus, string sName = "");

//adds a reduction to nSave [IP_CONST_SAVEVS_*] equal to nBonus [1-20]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddReducedSavingThrowVsSpecific(object oItem, int nSave, int nBonus, string sName = "");

//Adds the regeneration property equal to nBonus [1-20]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddRegeneration(object oItem, int nBonus, string sName = "");

//Adds a skill bonus to nSkill [SKILL_*] equal to nBonus [1-50]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddSkillBonus(object oItem, int nSkill, int nBonus, string sName = "");


//This is mostly unused but can make someone walk like a zombie. If you add more to iprp_walk.2da and make it work then it may be useful.
//nSpecial would define the walk type, but again there's just zombie walking. Ignore it until you change something.
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddSpecialWalk(object oItem, int nSpecial = 0, string sName = "");

//Adds immuinity to nSchool [IP_CONST_SPELLSCHOOL_*] of magic.
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddSpellImmunitySchool(object oItem, int nSchool, string sName = "");

//Adds immunity to nSpell [IP_CONST_IMMUNITYSPELL_*]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddSpellImmunitySpecific(object oItem, int nSpell, string sName = "");

//Adds the property of ThievesTools with an nModifier [1-12]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddThievesTools(object oItem, int nModifier, string sName = "");

//Use this to upgrade a basic trap to a better one.
//nTrapLevel [IP_CONST_TRAPSTRENGTH_*]
//nTrapType [IP_CONST_TRAPTYPE_*]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddTrap(object oItem, int nTrapLevel, int nTrapType, string sName = "");

//Adds the True Seeing Property
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddTrueSeeing(object oItem, string sName = "");

//Adds turn resistance equal to nBonus [1-50]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddTurnResistance(object oItem, int nBonus, string sName = "");

//Adds unlimited Ammo to a ranged weapon. If the ammo is special, use nAmmo [IP_CONST_UNLIMITEDAMMO_* or Number from iprp_ammocost.2da]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddUnlimitedAmmo(object oItem, int nAmmo = IP_CONST_UNLIMITEDAMMO_BASIC, string sName = "");

//Adds Vampiric Regeneration equal to nBonus [1-20]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddVampiricRegeneration(object oItem, int nBonus, string sName = "");

//Adds a visual effect nVisual [ITEM_VISUAL_*] for Melee weapons only.
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddVisualEffect(object oItem, int nVisual, string sName = "");

//Adds nWieght [IP_CONST_WEIGHTINCREASE_*]
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddWeightIncrease(object oItem, int nWeight, string sName = "");

//Adds nWeight [IP_CONST_REDUCEWIEGHT_*] as a reduction
//sName should be the name of the effect. It will be tagged whatever sName is. If sName is not changed, a basic identifier based on the effect will be used instead.
void AddWeightReduction(object oItem, int nWieght, string sName = "");

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//I've scrapped this section in favor of handling feats and spells in the calling script and leaving a name function open to differentiate between different ones. It will save us editing two scripts, so that we only need to change the one.

/*
void AddShootingStars(object oItem, int nLevel, int nUses)
{
    int nLevelNum;
    int nUsesNum;

    if (nLevel == 5)
    {
        nLevelNum = IP_CONST_CASTSPELL_MAGIC_MISSILE_5;
    }
    else if (nLevel == 9)
    {
        nLevelNum = IP_CONST_CASTSPELL_MAGIC_MISSILE_9;
    }
    else
    {
        nLevelNum = IP_CONST_CASTSPELL_MAGIC_MISSILE_3;
    }

    if (nUses == 2)
    {
        nUsesNum = IP_CONST_CASTSPELL_NUMUSES_2_USES_PER_DAY;
    }
    else if (nUses == 3)
    {
        nUsesNum = IP_CONST_CASTSPELL_NUMUSES_3_USES_PER_DAY;
    }
    else if (nUses == 4)
    {
        nUsesNum = IP_CONST_CASTSPELL_NUMUSES_4_USES_PER_DAY;
    }
    else if (nUses == 5)
    {
        nUsesNum = IP_CONST_CASTSPELL_NUMUSES_5_USES_PER_DAY;
    }
    else
    {
        nUsesNum = IP_CONST_CASTSPELL_NUMUSES_1_USE_PER_DAY;
    }

    WriteTimestampedLogEntry("Made it to the enchantment thingy");
    itemproperty iProp = TagItemProperty(ItemPropertyCastSpell(nLevelNum, nUsesNum), "ShootingStars");
    WriteTimestampedLogEntry("Item's current Valid Status: "+ IntToString(GetIsObjectValid(oItem)));
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}
*/


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///This is a brute force simplification of every item property in the base coding system. It exists so Item Properties are auto tagged. Use it. /////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void AddAbilityBonus(object oItem, int nBonus, int nAbility, string sName = "")
{
    string sBase = "AbilityBonus";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyAbilityBonus(nAbility, nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}
void AddACBonus(object oItem, int nBonus, string sName = "")
{
    string sBase = "ACBonus";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyACBonus(nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddACBonusVsAlign(object oItem, int nAlign, int nBonus, string sName = "")
{
    string sBase = "ACBonusVsAlign";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyACBonusVsAlign(nAlign, nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddACBonusVsSpecificAlign(object oItem, int nAlign, int nBonus, string sName = "")
{
    string sBase = "ACBonusVsSpecificAlign";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyACBonusVsAlign(nAlign, nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddACBonusVsDmgType(object oItem, int nDam, int nBonus, string sName = "")
{
    string sBase = "ACBonusVsDmgType";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyACBonusVsDmgType(nDam, nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddACBonusVsRace(object oItem, int nRace, int nBonus, string sName = "")
{
    string sBase = "ACBonusVsRace";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyACBonusVsRace(nRace, nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddArcaneSpellFailure(object oItem, int nLevel, string sName = "")
{
    string sBase = "ArcaneSpellFailure";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyArcaneSpellFailure(nLevel), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddAttackBonus(object oItem, int nBonus, string sName = "")
{
    string sBase = "AttackBonus";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyAttackBonus(nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddAttackBonusVsAlign(object oItem, int nAlign, int nBonus, string sName = "")
{
    string sBase = "AttackBonusVsAlign";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyAttackBonusVsAlign(nAlign, nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddAttackBonusVsSpecificAlign(object oItem, int nAlign, int nBonus, string sName = "")
{
    string sBase = "AttackBonusVsSpecificAlign";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyAttackBonusVsSAlign(nAlign, nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddAttackBonusVsRace(object oItem, int nRace, int nBonus, string sName = "")
{
    string sBase = "AttackBonusVsRace";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyAttackBonusVsRace(nRace, nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddAttackPenalty(object oItem, int nBonus, string sName = "")
{
    string sBase = "AttackPenalty";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyAttackPenalty(nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddBonusFeat(object oItem, int nFeat, string sName)
{
    string sFinalName = sName;
    itemproperty iProp = TagItemProperty(ItemPropertyBonusFeat(nFeat), sFinalName);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddBonusLevelSpell(object oItem, int nClass, int nSpellLevel, string sName = "")
{
    string sBase = "BonusSpellSlots";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyBonusLevelSpell(nClass, nSpellLevel), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddBonusSavingThrow(object oItem, int nBonus, int nThrow, string sName = "")
{
    string sBase = "SaveBonus";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyBonusSavingThrow(nThrow, nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddBonusSavingThrowVsSpecific(object oItem, int nBonus, int nThrow, string sName = "")
{
    string sBase = "SaveBonusVsSpecific";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyBonusSavingThrowVsX(nThrow, nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddBonusSpellResistance(object oItem, int nBonus, string sName = "")
{
    string sBase = "SpellResistance";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyBonusSpellResistance(nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddSpellCasts(object oItem, int nSpell, int nUses, string sName)
{
    string sFinalName = sName;
    itemproperty iProp = TagItemProperty(ItemPropertyCastSpell(nSpell, nUses), sFinalName);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddContainerReducedWeight(object oItem, int nReduction, string sName = "")
{
    string sBase = "ContainerReducedWeight";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyContainerReducedWeight(nReduction), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddDamageBonus(object oItem, int nBonus, int nType, string sName = "")
{
    string sBase = "DamageBonus";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyDamageBonus(nType, nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddDamageBonusVsAlign(object oItem, int nBonus, int nType, int nAlign, string sName = "")
{
    string sBase = "DamageBonusVsAlign";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyDamageBonusVsAlign(nAlign, nType, nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddDamageBonusVsSpecificAlign(object oItem, int nBonus, int nType, int nAlign, string sName = "")
{
    string sBase = "DamageBonusVsSpecificAlign";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyDamageBonusVsSAlign(nAlign, nType, nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddDamageBonusVsRace(object oItem, int nBonus, int nType, int nRace, string sName = "")
{
    string sBase = "DamageBonusVsRace";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyDamageBonusVsRace(nRace, nType, nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddDamageImmunity(object oItem, int nImmunity, int nType, string sName = "")
{
    string sBase = "DamageImmunity";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyDamageImmunity(nType, nImmunity), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddDamagePenalty(object oItem, int nBonus, string sName = "")
{
    string sBase = "DamagePenalty";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyDamagePenalty(nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddDamageReduction(object oItem, int nReduction, int nEnhancement, string sName = "")
{
    string sBase = "DamageReduction";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyDamageReduction(nEnhancement, nReduction), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddDamageResist(object oItem, int nReduction, int nType, string sName = "")
{
    string sBase = "DamageResist";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyDamageResistance(nReduction, nType), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddDamageVulnerability(object oItem, int nVulnerability, int nType, string sName = "")
{
    string sBase = "DamageVulnerability";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyDamageVulnerability(nType, nVulnerability), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddDarkvision(object oItem, string sName = "")
{
    string sBase = "Darkvision";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyDarkvision(), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddDecreaseAbility(object oItem, int nAbility, int nBonus, string sName = "")
{
    string sBase = "DecreaseAbility";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyDecreaseAbility(nAbility, nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddDecreaseAC(object oItem, int nType, int nBonus, string sName = "")
{
    string sBase = "DecreaseAC";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyDecreaseAC(nType, nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddDecreaseSkill(object oItem, int nSkill, int nBonus, string sName = "")
{
    string sBase = "DecreaseSkill";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyDecreaseSkill(nSkill, nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddEnhancementBonus(object oItem, int nBonus, string sName = "")
{
    string sBase = "EnhancementBonus";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyEnhancementBonus(nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddEnhancementBonusVsAlign(object oItem, int nBonus, int nAlign, string sName = "")
{
    string sBase = "EnhancementBonusVsAlign";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyEnhancementBonusVsAlign(nAlign, nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddEnhancementBonusVsSpecificAlign(object oItem, int nBonus, int nAlign, string sName = "")
{
    string sBase = "EnhancementBonusVsSpecificAlign";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyEnhancementBonusVsSAlign(nAlign, nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddEnhancementBonusVsRace(object oItem, int nBonus, int nRace, string sName = "")
{
    string sBase = "EnhancementBonusVsRace";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyEnhancementBonusVsRace(nRace, nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddEnhancementPenalty(object oItem, int nBonus, string sName = "")
{
    string sBase = "EnhancementPenalty";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyEnhancementPenalty(nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddExtraMeleeDamageType(object oItem, int nType, string sName = "")
{
    string sBase = "ExtraMeleeDamageType";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyExtraMeleeDamageType(nType), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddExtraRangeDamageType(object oItem, int nType, string sName = "")
{
    string sBase = "ExtraRangedDamageType";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyExtraRangeDamageType(nType), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddFreeAction(object oItem, string sName = "")
{
    string sBase = "FreeAction";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyFreeAction(), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddHaste(object oItem, string sName = "")
{
    string sBase = "Haste";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyHaste(), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddHealersKit(object oItem, int nLevel, string sName = "")
{
    string sBase = "HealersKit";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyHealersKit(nLevel), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddHolyAvenger(object oItem, string sName = "")
{
    string sBase = "HolyAvenger";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyHolyAvenger(), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddMiscImmunity(object oItem, int nImmunity, string sName = "")
{
    string sBase = "MiscImmunity";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyImmunityMisc(nImmunity), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddImmunityToSpellLevel(object oItem, int nLevel, string sName = "")
{
    string sBase = "ImmunityToSpellLevel";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyImmunityToSpellLevel(nLevel), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddImprovedEvasion(object oItem, string sName = "")
{
    string sBase = "ImprovedEvasion";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyImprovedEvasion(), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddKeen(object oItem, string sName = "")
{
    string sBase = "Keen";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyKeen(), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddLight(object oItem, int nBrightness, int nColor, string sName = "")
{
    string sBase = "Light";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyLight(nBrightness, nColor), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddLimitByAlign(object oItem, int nAlign, string sName = "")
{
    string sBase = "LimitByAlign";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyLimitUseByAlign(nAlign), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddLimitBySpecificAlign(object oItem, int nAlign, string sName = "")
{
    string sBase = "LimitBySpecificAlign";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyLimitUseBySAlign(nAlign), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddLimitByClass(object oItem, int nClass, string sName = "")
{
    string sBase = "LimitByClass";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyLimitUseByClass(nClass), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddLimitByRace(object oItem, int nRace, string sName = "")
{
    string sBase = "LimitByRace";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyLimitUseByRace(nRace), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddMassiveCrit(object oItem, int nDam, string sName = "")
{
    string sBase = "MassiveCrit";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyMassiveCritical(nDam), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddMaterial(object oItem, int nMaterial, string sName = "")
{
    string sBase = "Material";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyMaterial(nMaterial), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddMighty(object oItem, int nBonus, string sName = "")
{
    string sBase = "Mighty";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyMaxRangeStrengthMod(nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddMonsterDamage(object oItem, int nDam, string sName = "")
{
    string sBase = "MonsterDamage";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyMonsterDamage(nDam), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddNoDamage(object oItem, string sName = "")
{
    string sBase = "NoDamage";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyNoDamage(), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddOnHitCastSpell(object oItem, int nSpell, int nLevel, string sName = "")
{
    string sBase = "OnHitCastSpell";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyOnHitCastSpell(nSpell, nLevel), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddOnHitProps(object oItem, int nProp, int nDC, int nSpecial = 0, string sName = "")
{
    string sBase = "OnHitProps";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyOnHitProps(nProp, nDC, nSpecial), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddOnMonsterHitProperties(object oItem, int nProp, int nSpecial = 0, string sName = "")
{
    string sBase = "MonsterOnHitProps";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyOnMonsterHitProperties(nProp, nSpecial), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddQuality(object oItem, int nQuality, string sName = "")
{
    string sBase = "Quality";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyQuality(nQuality), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddReducedSavingThrow(object oItem, int nSave, int nBonus, string sName = "")
{
    string sBase = "ReducedSavingThrow";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyReducedSavingThrow(nSave, nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddReducedSavingThrowVsSpecific(object oItem, int nSave, int nBonus, string sName = "")
{
    string sBase = "ReducedSavingThrowVsSpecific";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyReducedSavingThrowVsX(nSave, nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddRegeneration(object oItem, int nBonus, string sName = "")
{
    string sBase = "Regeneration";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyRegeneration(nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddSkillBonus(object oItem, int nSkill, int nBonus, string sName = "")
{
    string sBase = "SkillBonus";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertySkillBonus(nSkill, nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddSpecialWalk(object oItem, int nSpecial = 0, string sName = "")
{
    string sBase = "SpecialWalk";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertySpecialWalk(nSpecial), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddSpellImmunitySchool(object oItem, int nSchool, string sName = "")
{
    string sBase = "ImmunitySchool";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertySpellImmunitySchool(nSchool), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddSpellImmunitySpecific(object oItem, int nSpell, string sName = "")
{
    string sBase = "ImmunitySpecific";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertySpellImmunitySpecific(nSpell), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddThievesTools(object oItem, int nModifier, string sName = "")
{
    string sBase = "ThievesTools";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyThievesTools(nModifier), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddTrap(object oItem, int nTrapLevel, int nTrapType, string sName = "")
{
    string sBase = "Trap";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyTrap(nTrapLevel, nTrapType), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddTrueSeeing(object oItem, string sName = "")
{
    string sBase = "TrueSeeing";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyTrueSeeing(), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddTurnResistance(object oItem, int nBonus, string sName = "")
{
    string sBase = "TurnResistance";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyTurnResistance(nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddUnlimitedAmmo(object oItem, int nAmmo = IP_CONST_UNLIMITEDAMMO_BASIC, string sName = "")
{
    string sBase = "UnlimitedAmmo";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyUnlimitedAmmo(nAmmo), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddVampiricRegeneration(object oItem, int nBonus, string sName = "")
{
    string sBase = "VampiricRegeneration";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyVampiricRegeneration(nBonus), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddVisualEffect(object oItem, int nVisual, string sName = "")
{
    string sBase = "VisualEffect";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyVisualEffect(nVisual), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddWeightIncrease(object oItem, int nWeight, string sName = "")
{
    string sBase = "WeightIncrease";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyWeightIncrease(nWeight), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}

void AddWeightReduction(object oItem, int nWieght, string sName = "")
{
    string sBase = "WeightReduction";
    if (sName != "")
    {sBase = sName;}
    itemproperty iProp = TagItemProperty(ItemPropertyWeightReduction(nWieght), sBase);
    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oItem);
}
