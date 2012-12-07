#define IMPLEMENT_API
#include <iostream>
#include <hx/CFFI.h>
#include "markdown.h"
#include "buffer.h"
#include "html.h"
using namespace std;

static value hx_sundown(value md_string, value extensions) {
	if ( !val_is_string(md_string) || !val_is_int(extensions) ) {
		return val_null;
	}
	
	struct buf *ob;
	struct sd_callbacks cb;
	struct html_renderopt opt;
	struct sd_markdown *md;
	
	ob = bufnew( val_strlen(md_string) );
	
	sdhtml_renderer( &cb, &opt, 0 );
	md = sd_markdown_new( val_int(extensions), 16, &cb, &opt );
	
	sd_markdown_render(ob,  (uint8_t *)val_string(md_string), val_strlen(md_string), md);
	sd_markdown_free(md);
	
	value output = alloc_string(bufcstr(ob));
	
	bufrelease(ob);
	
	return output;
}

DEFINE_PRIM(hx_sundown, 2);