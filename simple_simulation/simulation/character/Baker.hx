package simulation.character;

import simulation.attribute.Profession;
import simulation.attribute.Trader;
import simulation.attribute.ItemGroup;
import simulation.item.Item;

class Baker extends Character {
	public var trade:Trader;
	public var inventory:ItemGroup;
	override public function new () {
		this.profession = Profession.Baker;
		this.inventory = new ItemGroup();
		this.trade = new Trader(inventory, this);
		super();

		this.trade.buying.addItem(Item.Seeds);

		// When inventory changes, change trades
		this.inventory.inventoryChangeEvent.push(updateTrade);

		updateTrade();
	}

	function updateTrade () {
		trade.selling.contents.set(Item.Bread, inventory.hasAny(Item.Bread) ? 1 : 0);
	}
}


