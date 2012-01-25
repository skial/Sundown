package ;

import cpp.Utf8;

/**
 * ...
 * @author Skial Bainn
 */

typedef Extensions = {
	var no_intra_emphasis:Bool;
	var tables:Bool;
	var fenced_code:Bool;
	var autolink:Bool;
	var strikethrough:Bool;
	var lax_html_blocks:Bool;
	var space_headers:Bool;
	var superscript:Bool;
}

@:final
@:require(cpp)
@:buildXml('<include name="../native.xml"/>')
@:headerCode('#include "api_sundown.h"')
@:headerClassCode('HxSundown* sundown;')
class Sundown {
	
	// public fields
	
	public function new(?ex:Extensions = null):Void {
		ext = 0;
		if (ex != null) parseExtensions(ex);
		this.create();
	}
	
	@:functionCode('Sundown_obj::output = sundown->markdown_render(::cpp::Utf8_obj::encode(markdown));')
	public function render(markdown:String):String {
		return output;
	}
	
	@:functionCode('sundown->markdown_free();')
	public function close():Void { }
	
	// private fields
	
	private var ext:Int;
	
	private var output:String;
	// force utf8 to be included in the source by hxcpp
	private static var o:String = Utf8.encode('');
	
	@:functionCode('sundown = new HxSundown;\nsundown->markdown_new(Sundown_obj::ext);')
	private function create():Void { }
	
	private function parseExtensions(ex:Extensions):Void {
		if (ex.no_intra_emphasis) ext += (1<<0);
		if (ex.tables) ext += (1<<1);
		if (ex.fenced_code) ext += (1<<2);
		if (ex.autolink) ext += (1<<3);
		if (ex.strikethrough) ext += (1<<4);
		if (ex.lax_html_blocks) ext += (1<<5);
		if (ex.space_headers) ext += (1<<6);
		if (ex.superscript) ext += (1<<7);
	}
	
}