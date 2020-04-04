package simulation.event;

class Eat extends Event {
	public var item:Item;
	public var person:Person;

	public function new (item:Item, person: Person) {
		if (Database.lookupItem(item).tags.indexOf(ItemTags.edible) == -1) {
			cancelled = true;
			return false;
		}

		this.item = item;
		this.person = person;
	}
	public function do() {
		person.hunger -= item.edible.nutrition;
		item.remove();
	}
}
