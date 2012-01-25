# [Sundown](https://github.com/tanoku/sundown) for Haxe / CPP #

I started this to start learning c/cpp, to try out the new hxcpp meta tags.

Sundown.hx will likely change. Consider it ALPHA quality.

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

Once everything is in the correct place, use one of the following :

```
// one time markdown parsing
Sundown.markdown('# Your Markdown #');

// multi markdown parsing
var sd:Sundown = new Sundown();
var md1:String = sd.render('# Your Markdown 1 #');
var md2:String = sd.render('## Your Markdown 2 ##');
sd.close();
```

Then build. All done.

---

## Extensions ##

```Sundown``` has optional support for several (unofficial) Markdown extensions, such as non-strict emphasis, fenced code blocks, tables, autolinks, strikethrough and more.

To turn extensions on, use the ```typedef Extensions`` found in ```Sundown.hx```.

```
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
```

Then pass your ```Extensions``` object to your ```Sundown``` instance.

```
var sd:Sundown = new Sundown(ex);
//
Sundown.markdown('# Your Markdown #', ex);

---

## License ##

License

Permission to use, copy, modify, and distribute this software for any purpose with or without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.