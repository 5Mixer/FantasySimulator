package simulation.system;

import simulation.attribute.Trader;
import simulation.item.Item;
import simulation.item.ItemStack;

using ConsoleFormat;

class Trade {
	public var members:Array<Trader>;

	public function new () {
		members = new Array<Trader>();
	}
	public function register(member:Trader) {
		members.push(member);
	}
	public function update () {
		Sys.println('  -- Trade system log -- ');

		var forSale = new Map<Item, Array<Trader>>();
		for (trader in members) {
			for (selling in trader.selling.contents.keys()){
				if (forSale.exists(selling))
					forSale.get(selling).push(trader);
				else
					forSale.set(selling, [trader]);
			}
		}
		for (buyer in members) {
			for (buying in buyer.buying.contents.keys()){
				if (forSale.exists(buying)) {
					var sellers = forSale.get(buying);
					for (seller in sellers) {
						if (seller == buyer)
							continue;

						trade(seller, buyer, buying, buyer.buying.contents.get(buying), Item.Gold, 1);
					}
				}
			}
		}
	}
	function trade(seller:Trader, buyer:Trader, buyItem:Item, buyCount:Int, sellItem:Item, sellCount:Int) {
		seller.trade(buyItem, buyCount, sellItem, sellCount);
		buyer.trade(sellItem, sellCount, buyItem, buyCount);

		Sys.println('Trade: ');
		Sys.println('${seller.character.name} -> ${buyItem} ' + '($buyCount)' + ' -> '.green() + '${buyer.character.name} ');
		Sys.println('${seller.character.name} <- ${sellItem} ' + '($sellCount)' + ' <- '.green() + '${buyer.character.name} ');
		Sys.println('');
		// Sys.println('${buyer.character.name} ' + ' <- '.green() + '${seller.character.name} ${buyItem} ' + '($buyCount)');
	}
}
