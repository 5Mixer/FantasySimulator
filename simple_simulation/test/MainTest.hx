package ;

using buddy.Should;

import simulation.attribute.ItemGroup;

class MainTest extends buddy.SingleSuite {
	public function new() {
		describe("ItemGroup", {
			var itemGroup = new simulation.attribute.ItemGroup();

			it("should start empty", {
				itemGroup.contents.iterator().hasNext().should.be(false);
			});
			it("can be added to", {
				itemGroup.addItem(simulation.item.Item.createByIndex(0));
				itemGroup.contents.get(simulation.item.Item.createByIndex(0)).should.be(1);
			});
			it("should have the added item", {
				itemGroup.has(new simulation.item.ItemStack(simulation.item.Item.createByIndex(0), 1)).should().be(true);
			});
			it("should trigger an inventoryChangeEvent", {
				var triggerCount = 0;
				itemGroup.inventoryChangeEvent.push(() -> {
					triggerCount++;
				});
				itemGroup.takeStack(new simulation.item.ItemStack(simulation.item.Item.createByIndex(0)));
				itemGroup.addItem(simulation.item.Item.createByIndex(0), 5);

				triggerCount.should.be(2);
			});

		});
	}
}
