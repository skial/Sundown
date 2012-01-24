package test;
import haxe.unit.TestCase;
import Sundown;

using StringTools;

/**
 * ...
 * @author Skial Bainn
 */

class TestExtensions extends TestCase {
	
	public var sd:Sundown;
	public var ex:Extensions;
	public var no_intra_emphasis:String;
	public var fenced_code:String;
	public var autolink:String;

	public function new() {
		super();
	}
	
	override public function setup():Void {
		ex = { no_intra_emphasis:true, tables:true, fenced_code:true, 
		autolink:true, strikethrough:true, lax_html_blocks:true, 
		space_headers:true, superscript:true };
		
		sd = new Sundown(ex);
		
		no_intra_emphasis = 'sundown_is_using_no_intra_emphasis';
		fenced_code = '```var sd:Sundown = new Sundown();```';
		autolink = 'http://blog.skialbainn.com/';
	}
	
	public function testNoIntraEmphasis() {
		var o = sd.render(no_intra_emphasis);
		trace(o);
		assertEquals('<p>'+no_intra_emphasis+'</p>', o.trim());
	}
	
	public function testFencedCode() {
		var o = sd.render(fenced_code);
		trace(o);
		assertEquals('<p><code>var sd:Sundown = new Sundown();</code></p>', o.trim());
	}
	
	public function testAutolink() {
		var o = sd.render(autolink);
		trace(o);
		assertEquals('<p><a href="' + autolink + '">' + autolink + '</a></p>', o.trim());
	}
	
	public function testStrikethrough() {
		var o = sd.render('~~strikethrough~~');
		trace(o);
		assertEquals('<p><del>strikethrough</del></p>', o.trim());
	}
	
	public function testSpaceHeader() {
		var o = sd.render('#this header will fail#');
		trace(o);
		assertFalse(o == '<h1>this header will fail</h1>');
	}
	
	public function testSuperscript() {
		var o = sd.render('this is the 2^(nd) time');
		trace(o);
		assertEquals('<p>this is the 2<sup>nd</sup> time</p>', o.trim());
	}
	
	override public function tearDown():Void {
		sd.close();
	}
	
}