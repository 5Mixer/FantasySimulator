package simulation.attribute;

import simulation.behaviour.Goal;
import simulation.behaviour.Action;
import simulation.item.Item;

class Behaviour {
	public var goals = new Array<Goal>();
	public var actions = new Array<Action>();
	public function new () {
		goals = [];
		actions = [Action.Nothing];
	}

	var _isNearProfession = false;
	var _doesPossessGood = false;

	public function isGoalSatisfied(goal){
		if (goal == null) {
			Sys.println("Warning: Checking if goal null is satisfied");
			return false;
		}
		switch (goal) {
			case Goal.BeNearCharacterOfProfession(profession):
				return _isNearProfession;
			case Goal.PossessGood(good):
				return _doesPossessGood;
		}
	}

	
	public function update () {
		if (goals.length == 0) {
			Sys.println("No goals!");
			return;
		}

		var activeGoal = goals[goals.length - 1];
		var activeAction = actions[actions.length - 1];

		// Goals dictate high level priorities
		// Goals instigate actions
		// These actions satisfy the goals
	
		while (activeGoal != null && isGoalSatisfied(activeGoal)) {
			Sys.println('Popping $activeGoal as it is satisfied');
			goals.pop();
			activeGoal = goals[goals.length - 1];
		}

		if (activeGoal != null) {
			switch (activeGoal){
				case Goal.BeNearCharacterOfProfession(profession):
					actions.push(Action.WalkToCharacter(null));

				case Goal.PossessGood(good):
					if (good.item == Item.Wheat) {
						// Dependency
						if (isGoalSatisfied(Goal.BeNearCharacterOfProfession(Profession.Peasent))) {
							actions.push(Action.Trade(null, null, null));
						} else
							goals.push(Goal.BeNearCharacterOfProfession(Profession.Peasent));
					}
			}
		}

		switch (activeAction) {
			case Action.Nothing:
				Sys.println("Action: Nothing");
			case Action.Trade(character, incomingGoods, outgoingGoods):
				Sys.println("Trading");
				_doesPossessGood = true;
				actions.pop();
			case Action.WalkToCharacter(character):
				Sys.println("Walking to character");
				_isNearProfession = true;
				actions.pop();
		}
	}
}
