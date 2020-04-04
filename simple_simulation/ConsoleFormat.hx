package ;

class ConsoleFormat {
	public static var clear = '\033[0m';
	static public function red(string:String) {
		return '\033[0;31m' + string + ConsoleFormat.clear;
	}
	static public function green(string:String) {
		return '\033[0;32m' + string + ConsoleFormat.clear;
	}
}
