package simulation.attribute;

import simulation.attribute.ItemGroup;
import simulation.item.Item;
import simulation.character.Character;

class Trader {
	var inventory:ItemGroup;

	public var buying:ItemGroup;
	public var selling:ItemGroup;

	public var character:Character;

	public function new (inventory:ItemGroup, ?character) {
		this.inventory = inventory;
		buying = new ItemGroup();
		selling = new ItemGroup();
		this.character = character;
	}
	public function trade (broughtItem:Item, broughtCount:Int, soldItem:Item, soldCount:Int) {
		inventory.addItem(broughtItem, broughtCount);
		inventory.takeItem(soldItem, soldCount);
	}
}
