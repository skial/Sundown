#include <hxcpp.h>
#include <String.h>
#include <string>

extern "C" {
	#include "markdown.h"
	#include "buffer.h"
	#include "html.h"
}

class HxSundown {
	public:
		HxSundown();
		~HxSundown();
		
		::String markdown(::String md);
};
