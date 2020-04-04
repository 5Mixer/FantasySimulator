package simulation;

import simulation.Scheduler;
import exp.ecs.*;

import exp.ecs.node.*;
import exp.ecs.entity.*;
import exp.ecs.system.*;
import exp.ecs.component.*;

enum Job {
	Baker;
}
enum Item {

}
typedef ItemStack = {
	public var item:Item;
	public var quantity:Int;
}

class Inventory {
	public var contents = new Array<ItemStack>();
	public function new () {

	}
}

class JobComponent extends Component{
	public var job:Job;
	public function new (job:Job){
		this.job = job;
	}
}

class Baker {
	public var job:Job;
	public var id:Int;
	public function new (id) {
		this.id = id;
		job = Job.Baker;
	}
}

enum Event {} 

class CharacterTrading<Event> extends exp.ecs.system.System<Event>{
	@:nodes var characters:Node<JobComponent>;

	override public function update (delta) {
		for (character in characters) {
			var a = character.jobComponent.job + "";
		}

	}
}

class Simulation {
	var scheduler:Scheduler;

	var names = new Map<Int, String>();
	var jobs = new Map<Int, Job>();
	var inventories = new Map<Int, Inventory>();

	var bakers = new Array<Int>();
	var characters = new Array<Int>();

	var bakers_2:Array<Baker> = [];

	public function new() {
		scheduler = new Scheduler();

		// var baker = new simulation.character.Character();
		var baker = uuid();
		bakers.push(baker);
		characters.push(baker);
		names.set(baker, "Baker Johny");
		jobs.set(baker, Job.Baker);
		inventories.set(baker, new Inventory());

		var start = Sys.cpuTime();
		for (i in 1...100000)
			simulate(1);
		Sys.println('Maps ops:    ${Math.round(1/((Sys.cpuTime()-start)/100000))}');

		////////////////////////

		bakers_2.push(new Baker(uuid()));

		var start = Sys.cpuTime();
		for (i in 1...100000) {
			for (character in bakers_2) {
				var a = character.id + "" + character.job;
				// Sys.println('Character ${character.id}:');
				// Sys.println('Job: ${character.job}');
			}
		}
		Sys.println('Objects ops: ${Math.round(1/((Sys.cpuTime()-start)/100000))}');
		////////////////////////

		var engine = new Engine();
		var baker = new Entity();
		baker.add(new JobComponent(Job.Baker));
		// engine.entities.add(baker);
		// engine.systems.add(new CharacterTrading());
		
		var start = Sys.cpuTime();
		for (i in 1...100000) {
			engine.update(1);
		}
		Sys.println('ECS ops:      ${Math.round(1/((Sys.cpuTime()-start)/100000))}');
	}

	public function uuid() {
		return 111111111 + Math.floor(Math.random() * 999999999);
	}

	public function simulate(delta) {
		// scheduler.tick(delta);
		// scheduler.isDay();
		
		var charactersWithJobs:Array<{character}>
		for (character in characters) {
			// Sys.println('Character $character:');
			if (jobs.exists(character)) {
				var a = jobs.get(character) + "" + character;
				// Sys.println('Job: ${jobs.get(character)}');
			}
		}
	}
}
