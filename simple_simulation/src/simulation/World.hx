package simulation;

import simulation.character.Character;
import simulation.character.Baker;
import simulation.character.Peasent;
import simulation.item.ItemStack;
import simulation.item.Item;

using ConsoleFormat.ConsoleFormat;

class World {
	public var characters:Array<Character>;
	public var bakers:Array<Baker>;
	public var peasents:Array<Peasent>;
	var trade = new simulation.system.Trade();
	public function new () {
		characters = new Array<Character>();
		bakers = new Array<Baker>();
		peasents = new Array<Peasent>();

		for (i in 0...2) {
			var baker = new Baker();
			baker.inventory.addItem(Item.Bread, 2);
			baker.name = "Baker "+["Gerald", "Louise"][i];

			bakers.push(baker);
			characters.push(baker);
			trade.register(baker.trade);
		}
		for (i in 0...2) {
			var peasent = new Peasent();
			peasent.inventory.addItem(Item.Seeds);
			peasent.name = "Peasent "+["boy", "girl"][i];

			peasents.push(peasent);
			characters.push(peasent);
			trade.register(peasent.trade);
		}

		update();
	}
	function update () {
		Sys.println('_____________________________');
		trade.update();

		Sys.println('  -- Character log -- ');
		for (baker in bakers) {
			Sys.println('Name: ${baker.name}'.red());
			Sys.println('Profession:'.green() + ' ${baker.profession}');
			Sys.println('Inventory:'.green() + ' ${baker.inventory}');
		}
		for (peasent in peasents) {
			Sys.println('Name: ${peasent.name}'.red());
			Sys.println('Profession:'.green() + ' ${peasent.profession}');
			Sys.println('Inventory:'.green() + ' ${peasent.inventory}');
		}

		haxe.Timer.delay(update, 3000);
	}
}
