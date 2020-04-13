package simulation.behaviour;

import simulation.item.ItemStack;
import simulation.attribute.Profession;

enum Goal {
	BeNearCharacterOfProfession(profession:Profession);
	PossessGood(good:ItemStack);
}
