#include <hxcpp.h>
#include <String.h>
#include "api.h"
#include <string>
#include <iostream>

extern "C" {
	#include "markdown.h"
	#include "buffer.h"
	#include "html.h"
}

#define OUTPUT_UNIT 64

HxSundown::HxSundown() {}
HxSundown::~HxSundown() {}

::String HxSundown::markdown(::String md) {
	struct buf *ob;
	struct sd_callbacks callbacks;
	struct html_renderopt options;
	struct sd_markdown *markdown;
	::String output;
	
	ob = bufnew(OUTPUT_UNIT);
	
	sdhtml_renderer(&callbacks, &options, 0);
	markdown = sd_markdown_new(0, 16, &callbacks, &options);
	
	/* reinterpret_cast from - http://stackoverflow.com/questions/1673445/how-to-convert-byte-to-stdstring-in-c
	
	sd_markdown_render(ob, reinterpret_cast<const uint8_t*>(md.__s), static_cast<std::string>(md.__s).size(), markdown);
	sd_markdown_free(markdown);
	
	output = ::String(reinterpret_cast<const char*>(ob->data), ob->size);
	
	/* cleanup */
	bufrelease(ob);
	
	return output;
}
