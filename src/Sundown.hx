package ;

/**
 * ...
 * @author Skial Bainn
 */

@:final
@:require(cpp)
@:buildXml('<include name="../native.xml"/>')
@:headerCode('#include "api.h"')
@:headerClassCode('HxSundown sundown;')
class Sundown {
	
	private var output:String;
	
	public function new():Void {
		this.create();
	}
	
	@:functionCode('sundown.markdown_new();')
	private function create():Void { }
	
	@:functionCode('Sundown_obj::output = sundown.markdown_render(markdown);')
	public function render(markdown:String):String {
		return output;
	}
	
	@:functionCode('sundown.markdown_free();')
	public function close():Void { }
	
}