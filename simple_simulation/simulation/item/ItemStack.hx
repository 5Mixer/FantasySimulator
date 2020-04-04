package simulation.item;

class ItemStack {
	public var item:Item;
	public var quantity:Int;

	public function new (item:Item, quantity:Int = 1) {
		this.item = item;
		this.quantity = quantity;
	}
}
