package simulation.event;

class Trade extends Event {
	public var goods:Array<ItemQuantity>;
	public var seller:Trader;
	public var buyer:Trader;
	
	public function new (goods, seller, buyer) {
		this.goods = goods;
		this.seller = seller;
		this.buyer = buyer;
	}
	public function do () {
		if(this.buyer.inventory.addGoods(this.goods)) {
			this.seller.inventory.removeGoods(this.goods);
		}
	}
}
