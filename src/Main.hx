package ;

import Sundown;
import haxe.unit.TestRunner;
import sys.io.File;
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
		
		var md = Sundown.render(File.getContent('readme.md'));
		File.saveContent('readme_new.html', md);
	}
	
}