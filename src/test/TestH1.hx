package test;
import cpp.Utf8;
import haxe.unit.TestCase;

using StringTools;
/**
 * ...
 * @author Skial Bainn
 */

class TestH1 extends TestCase {
	
	public var md:Sundown;
	public var input:String;
	public var expected:String;

	public function new() {
		super();
	}
	
	override public function setup():Void {
		md = new Sundown();
		input = '# Hello Sundown #';
		expected = '<h1>Hello Sundown</h1>';
	}
	
	public function testH1_part1() {
		var o = md.render(input);
		trace(o);
		assertEquals(expected, o.trim());
	}
	
	public function testH1_part2() {
		var o = md.render(input);
		trace(o);
		assertEquals(expected, o.trim());
	}
	
	override public function tearDown():Void {
		md.close();
	}
	
}