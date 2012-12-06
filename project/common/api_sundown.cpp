#include <hx/CFFI.h>
/*#include <hxcpp.h>
#include <String.h>
#include <string>
#include "api_sundown.h"*/

extern "C" {
	#include "markdown.h"
	#include "buffer.h"
	#include "html.h"
}

/*HxSundown::HxSundown() {}
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
}*/

DEFINE_KIND(k_sd_markdown);
DEFINE_KIND(k_sd_callbacks);
DEFINE_KIND(k_html_renderopt);

static void hx_html_renderer_create(value cb, value opt) {
	val_check_kind(cb, k_sd_callbacks);
	val_check_kind(opt, k_html_renderopt);
	
	sdhtml_renderer( (sd_callbacks*)val_data(cb), (html_renderopt*)val_data(opt), 0 );
}

static value hx_sundown_create(value extensions, value cb, value opt) {
	if (!val_is_int(extensions) ) {
		return val_null;
	}
	
	val_check_kind(cb, k_sd_callbacks);
	val_check_kind(opt, k_html_renderopt);
	
	sd_markdown *md = sd_markdown_new( val_int(extensions), 16, (sd_callbacks*)val_data(cb), (html_renderopt*)val_data(opt) );
	return alloc_abstract(k_sd_markdown, md);
}

static value hx_sundown_render(value md_string, value markdown) {
	if (!val_is_string(md_string)) {
		return val_null;
	}
	
	val_check_kind(markdown, k_sd_markdown);
	
	buf *output_buf = bufnew(128);
	sd_markdown_render(output_buf,  reinterpret_cast<const uint8_t*>(val_string(md_string)), val_strlen(md_string), (sd_markdown*)val_data(markdown));
	
	value output = alloc_string(reinterpret_cast<const char*>(output_buf->data));
	
	bufrelease(output_buf);
	
	return output;
}

static void hx_sundown_free(value markdown) {
	val_check_kind(markdown, k_sd_markdown);
	
	sd_markdown_free((sd_markdown*)val_data(markdown));
}

DEFINE_PRIM(hx_sundown_create, 3);
DEFINE_PRIM(hx_html_renderer_create, 2);
DEFINE_PRIM(hx_sundown_render, 2);
DEFINE_PRIM(hx_sundown_free, 1);