package ;

import cpp.Lib;
import Sundown;

/**
 * ...
 * @author Skial Bainn
 */

class Main {
	
	static function main() {
		trace(Sundown.markdown("# Hocco is [Docco](https://github.com/jashkenas/docco) for Haxe #
Hocco is still in its early stages. Only tested on Windows.

---

## Install ##

Run ```haxelib install Hocco``` or [download](https://github.com/skial/Hocco/downloads) Hocco and drop it into your project folder.

---

## Quick Usage ##

All you have to do is ```implement Hocco```. Then to generate the documentation add ```-D use_rtti_doc``` to your ```.hxml``` file. That's it, just compile.

If you want a specific property or method excluded, just add ```@:ignore``` before it.

By default all private properties and methods are excluded from being processed. If you want to include all private properties and methods, just add ```-D show_privates``` to your ```.hxml``` file.

---

## Issues ##

At the moment you cant comment on a class. For some reason the compiler always returns null. To get around this, create a new variable called ```__readme__``` after your class definition and your all set. Check [Main.hx](https://github.com/skial/Hocco/blob/master/src/Main.hx#L31) in the source for an example.

See the [projects issues](https://github.com/skial/Hocco/issues) to see what else is buggered.

---

## Helpers ##

This project **accepts** and **encourages** contributions.

---

## MIT License ##

Copyright (c) <year> <copyright holders>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."));
	}
	
}