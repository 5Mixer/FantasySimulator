package simulation.character;

import simulation.attribute.Profession;
import simulation.attribute.Trader;
import simulation.attribute.ItemGroup;
import simulation.item.Item;
import simulation.item.ItemStack;
import simulation.attribute.Behaviour;

class Baker extends Character {
	public var trade:Trader;
	public var inventory:ItemGroup;
	public var behaviour:Behaviour;
	override public function new () {
		this.profession = Profession.Baker;
		this.inventory = new ItemGroup();
		this.trade = new Trader(inventory, this);
		this.behaviour = new Behaviour();
		super();

		var goodsToAcquire = new ItemStack(Item.Wheat, 10);
		this.behaviour.goals.push(simulation.behaviour.Goal.PossessGood(goodsToAcquire));

		this.trade.buying.addItem(Item.Seeds);

		// When inventory changes, change trades
		this.inventory.inventoryChangeEvent.push(updateTrade);

		updateTrade();
	}

	override public function update () {
		behaviour.update();
	}

	function updateTrade () {
		trade.selling.contents.set(Item.Bread, inventory.hasAny(Item.Bread) ? 1 : 0);
	}
}


