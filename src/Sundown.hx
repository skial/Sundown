package ;

/**
 * ...
 * @author Skial Bainn
 */

@:final
@:require(cpp)
@:buildXml('<include name="../native.xml"/>')
@:headerCode('#include "api.h"')
class Sundown {
	
	private static var output:String = '';

	@:functionCode('HxSundown sundown = HxSundown();\n::Sundown_obj::output = sundown.markdown(text);')
	public static function markdown(text:String) {
		return output;
	}
	
}