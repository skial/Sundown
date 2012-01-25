#include <hxcpp.h>
#include <String.h>
#include <string>
#include "api_sundown.h"

extern "C" {
	#include "markdown.h"
	#include "buffer.h"
	#include "html.h"
}

HxSundown::HxSundown() {}
HxSundown::~HxSundown() {}

void HxSundown::markdown_new(int ext) {
	sdhtml_renderer(&callbacks, &options, 0);
	markdown = sd_markdown_new(ext, 16, &callbacks, &options);
}

::String HxSundown::markdown_render(::String md) {
	// create new buffer
	output_buf = bufnew(128);
	
	// reinterpret_cast from - http://stackoverflow.com/questions/1673445/how-to-convert-byte-to-stdstring-in-c
	sd_markdown_render(output_buf, reinterpret_cast<const uint8_t*>(md.__s), static_cast<std::string>(md.__s).size(), markdown);
	
	// cast to hxcpp string
	output = ::String(reinterpret_cast<const char*>(output_buf->data), output_buf->size);
	
	// return rendered markdown
	return output;
}

void HxSundown::markdown_free() {
	sd_markdown_free(markdown);
	
	// cleanup buffer
	bufrelease(output_buf);
}