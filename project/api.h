#include <hxcpp.h>
#include <String.h>
#include <string>

extern "C" {
	#include "markdown.h"
	#include "buffer.h"
	#include "html.h"
}

class HxSundown {
	private:
		struct sd_markdown *markdown;
		struct sd_callbacks callbacks;
		struct html_renderopt options;
		::String output;
	public:
		HxSundown();
		~HxSundown();
		
		void markdown_new();
		::String markdown_render(::String md);
		void markdown_free();
};
