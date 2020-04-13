package simulation.behaviour;

import simulation.character.Character;
import simulation.attribute.ItemGroup;

enum Action {
	WalkToCharacter(character:Character);	
	Trade(character:Character, incomingGoods:ItemGroup, outgoingGoods:ItemGroup);
	Nothing;
}
