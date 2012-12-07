package ;

import Sundown;
import cpp.io.File;
import cpp.Lib;
import cpp.Utf8;
import haxe.unit.TestRunner;
import test.TestExtensions;
import test.TestH1;

/**
 * ...
 * @author Skial Bainn
 */

class Main {
	
	static function main() {
		//new Sundown(); // anything saved to file after this statment is mangled if uncommented...
		
		var runner:TestRunner = new TestRunner();
		runner.add(new TestH1());
		runner.add(new TestExtensions());
		
		runner.run();
		
		/*var sd:Sundown = new Sundown();
		var md = sd.render(File.getContent('readme.md'));
		var file = File.write('readme1.html');
		file.writeString(md);
		file.close();
		sd.close();*/
	}
	
}