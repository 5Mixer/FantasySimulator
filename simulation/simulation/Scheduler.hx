package simulation;

class Scheduler {
	public var time = 0;

	private var dayLength = 24 * 60 * 60;
	private var dawn = 7 * 60 * 60;
	private var dusk = 19 * 60 * 60;

	public function new() {

	}
	public function tick(delta) {
		time += delta;
	}
	public function isDay() {
		var dayProgress = time % dayLength;

		return dawn < time && time < dusk;
	}
}
