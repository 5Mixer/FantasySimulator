package simulation.attribute;

import simulation.item.Item;
import simulation.item.ItemStack;
import haxe.ds.Either;

class ItemGroup {
	public var contents:Map<Item, Int>;
	public var inventoryChangeEvent = new Array<Void->Void>();

	public function new () {
		contents = new Map<Item, Int>();
	}

	public function addItem (item:Item, quantity=1) {
		if (contents.exists(item)) {
			contents.set(item, contents.get(item) + quantity);
		}else{
			contents.set(item, quantity);
		}
		for (listener in inventoryChangeEvent)
			listener();

		return this;
	}

	public function addStack (itemStack:ItemStack) {
		return addItem(itemStack.item, itemStack.quantity);
	}

	public function takeStack (itemStack:ItemStack) {
		return takeItem(itemStack.item, itemStack.quantity);
	}
	public function takeItem (item:Item, quantity=1) {
		if (contents.exists(item) && contents.get(item) > 0) {
			contents.set(item, contents.get(item)-quantity);
			for (listener in inventoryChangeEvent)
				listener();

			return true;
		} else
			return false;
	}

	// Does this inventory contain *at least* a specific quantity of an item?
	public function has(query:ItemStack) {
		if (contents.exists(query.item)) {
			if (contents.get(query.item) >= query.quantity)
				return true;
		}
		return false;
	}
	public function hasAny (item:Item) {
		if (contents.exists(item) == false)
			return false;
		if (contents.get(item) < 1)
			return false;
		return true;
	}
	public function toString () {
		var log = "\n";
		for (entry in contents.keyValueIterator()) {
			log += '\t${entry.key} (${entry.value})\n';
		}
		return log;
	}
}
