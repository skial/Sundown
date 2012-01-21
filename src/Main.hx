package ;

import cpp.io.File;
import cpp.Lib;

/**
 * ...
 * @author Skial Bainn
 */

class Main {
	
	static function main() {
		var md:String = Sundown.markdown(File.getContent('readme.md'));
		trace(md);
		var file = File.write('readme.html');
		file.writeString(md);
		file.close();
	}
	
}