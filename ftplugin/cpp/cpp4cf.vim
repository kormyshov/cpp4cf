" Only do this when not done yet for this buffer
if exists("b:did_cpp4cf_ftplugin")
    finish
endif
let b:did_cpp4cf_ftplugin = 1

if !exists('s:cpp4cf_template')
	let s:cpp4cf_template = globpath(&rtp, '**/cpp/template.cpp')
	let s:cpp4cf_template = s:cpp4cf_template[:match(s:cpp4cf_template,".cpp")+4]
endif

function! s:LoadTemplate()

	normal gg
	normal dG

	try
		let s:template_lines = readfile(s:cpp4cf_template)
		call append(0, s:template_lines)
	catch /E484/
		echom "Error in cpp4cf.vim: couldn't read file: " . s:cpp4cf_template
	endtry

	normal gg

	unlet! s:template_lines

endfunction

command! CFTemplate call s:LoadTemplate()
