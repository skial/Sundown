package ;

import cpp.io.File;
import cpp.Lib;

/**
 * ...
 * @author Skial Bainn
 */

class Main {
	
	static function main() {
		
		var sundown:Sundown = new Sundown();
		
		var md:String = sundown.render(File.getContent('readme.md'));
		
		trace(md);
		trace(sundown.render('## Hello Skial Bainn ##\n\n---\n\nHello again!'));
		
		var file = File.write('readme.html');
		file.writeString(md);
		file.close();
		
		sundown.close();
	}
	
}