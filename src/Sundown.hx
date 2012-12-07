package ;

#if cpp
import cpp.Lib;
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
	
	// public fields
	
	public function new(?ex:Extensions = null):Void {
		ext = 0;
		cb = { };
		opt = { };
		if (ex != null) parseExtensions(ex);
		hx_html_render(cb, opt);
		md = hx_create(ext, cb, opt );
	}
	
	public function render(markdown:String):String {
		output = hx_sundown_render(markdown, md);
		return output;
	}
	
	public function close():Void {
		hx_sundown_free(md);
	}
	
	private var ext:Int;
	private var md:Dynamic;
	private var cb:Dynamic;
	private var opt:Dynamic;
	
	private var output:String;
	
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
	
	private static var hx_create:Int->Dynamic->Dynamic->Dynamic = Lib.load('sundown', 'hx_sundown_create', 3);
	private static var hx_html_render:Dynamic->Dynamic->Void = Lib.load('sundown', 'hx_html_renderer_create', 2);
	private static var hx_sundown_render:String->Dynamic->String = Lib.load('sundown', 'hx_sundown_render', 2);
	private static var hx_sundown_free:Dynamic->Void = Lib.load('sundown', 'hx_sundown_free', 1);
	
}