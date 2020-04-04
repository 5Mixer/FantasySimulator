package simulation.event;

enum AttackType {
	Punch;
	ItemAssisted;
}

class Attack extends Event {
	public var attacker:Living;
	public var attacked:Living;
	public var method:AttackType;
	public var damage:Int;

	public function new(attacker:Living, attacked:Living, method:AttackType, damage:Int) {
		this.attacker = attacker;
		this.attacked = attacked;
		this.method = method;
		this.damage = damage;
	}
	public function do() {
		this.attacked.health -= this.damage;
	}
}
