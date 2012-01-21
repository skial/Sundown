package ;
import cpp.io.File;

/**
 * ...
 * @author Skial Bainn
 */

@:buildXml('<include name="../native.xml"/>')
@:headerCode('#include "api.h"')
@:headerClassCode('')
class Sundown {
	
	private static var output:String = '';

	@:functionCode('HxSundown sundown = HxSundown();\n::SunDown_obj::output = sundown.markdown(text);')
	public static function markdown(text:String) {
		return output;
	}
	
}