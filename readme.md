# [Sundown](https://github.com/tanoku/sundown) for Haxe / CPP #
This was to start learning c/cpp, to try out the new hxcpp meta tags. Sundown.hx will changed alot.

---

## Info ##

```Sundown``` uses the [new HXCPP meta tags](http://haxe.org/manual/tips_and_tricks), which requires a Haxe nightly build. The currently nightly builds available should work. ```Sundown``` has only been tested on Windows 7 x64 using the MinGW compiler, using ```HXCPP``` build files.

---

## Helpers ##

This project **accepts** and **encourages** contributions.

---

## Usage ##

Currently now available on ```haxelib```. 

The ```Sundown.hx``` can be place anywhere, the import files in the ```project/``` directory, and ```native.xml``` which both need to be at the same level as your ```bin/``` directory where ```HXCPP``` creates its ```Build.xml``` file.

Once everything is in the correct place, just use ```var md:String = Sundown.markdown('## Your Markdown ##');``` and build.

---

## License ##

License

Permission to use, copy, modify, and distribute this software for any purpose with or without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.