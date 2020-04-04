package simulation.character;

import simulation.attribute.Profession;
import simulation.attribute.Trader;
import simulation.attribute.ItemGroup;
import simulation.item.Item;

class Peasent extends Character {
	public var trade:Trader;
	public var inventory:ItemGroup;
	override public function new () {
		this.profession = Profession.Peasent;
		this.inventory = new ItemGroup();
		this.trade = new Trader(inventory, this);
		super();

		this.trade.buying.addItem(Item.Bread);

		// When inventory changes, change trades
		this.inventory.inventoryChangeEvent.push(updateTrade);

		updateTrade();
	}

	function updateTrade () {
		trade.buying.contents.set(Item.Bread, inventory.hasAny(Item.Bread) ? 0 : 1);
		trade.selling.contents.set(Item.Seeds, inventory.hasAny(Item.Seeds) ? 1 : 0);
	}
}


