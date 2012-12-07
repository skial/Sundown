package ;

#if cpp
import cpp.Lib;
import haxe.Utf8;
#elseif neko
import neko.Lib;
#end

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

class Sundown {
	
	public static function render(markdown:String, ?ex:Extensions):String {
		ext = 0;
		if (ex != null) parseExtensions(ex);
		return hx_sundown_render(markdown, ext);
	}
	
	private static var ext:Int;
	private static var output:String;
	
	private static function parseExtensions(ex:Extensions):Void {
		if (ex.no_intra_emphasis) ext += (1<<0);
		if (ex.tables) ext += (1<<1);
		if (ex.fenced_code) ext += (1<<2);
		if (ex.autolink) ext += (1<<3);
		if (ex.strikethrough) ext += (1<<4);
		if (ex.lax_html_blocks) ext += (1<<5);
		if (ex.space_headers) ext += (1<<6);
		if (ex.superscript) ext += (1<<7);
	}
	
	private static var hx_sundown_render = Lib.load('sundown', 'hx_sundown', 2);
}