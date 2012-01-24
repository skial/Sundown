package ;

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
		var md:String = Sundown.markdown(File.getContent('readme.md'));
		var file = File.write('readme_static.html');
		file.writeString(md);
		file.close();
		
		var sd:Sundown = new Sundown();
		md = sd.render(File.getContent('readme.md'));
		file = File.write('readme.html');
		file.writeString(md);
		file.close();
		sd.close();
		
		var runner:TestRunner = new TestRunner();
		runner.add(new TestH1());
		runner.add(new TestExtensions());
		
		runner.run();
	}
	
}