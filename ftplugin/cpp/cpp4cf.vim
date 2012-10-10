" Only do this when not done yet for this buffer
if exists("b:did_cpp4cf_ftplugin")
    finish
endif
let b:did_cpp4cf_ftplugin = 1

if !exists('s:cpp4cf_template')
	let s:cpp4cf_template = globpath(&rtp, '**/cpp/template.cpp')
	let s:cpp4cf_template = s:cpp4cf_template[:match(s:cpp4cf_template,"template")+11]
endif

function! s:LoadTemplate()

	normal gg
	normal dG

	try
		let s:template_lines = readfile(s:cpp4cf_template)

		let s:line = 0
		for i in range (0, len(s:template_lines)-1)

			if s:template_lines[i] == '// [[TESTS]]'

				continue
			endif
			if s:template_lines[i] == '// [[MAIN]]'
				let s:main_lines = ["int main()","{","\tfreopen(\"".bufname("%")."\",\"r\",stdin);","","\tchar s[99];","\tbool f;","","\twhile(true) {","\t\tcin>>s;","\t\tif(cin.eof()) break;","\t\tif(strstr(s,\"/*\")) {","\t\t\tcin>>s;","\t\t\tif(strstr(s,\"Test\")) {","\t\t\t\tcin>>s;","\t\t\t\tif(strstr(s,\"on\")) {","\t\t\t\t\tcout<<\"Output: \";","\t\t\t\t\tcpp4cf_main();","\t\t\t\t\tcout<<\"\nAnswer: \";","\t\t\t\t\tf = false;","\t\t\t\t\twhile(true) {","\t\t\t\t\t\tcin>>s;","\t\t\t\t\t\tif(strstr(s,\"*/\")) break;","\t\t\t\t\t\tif(strstr(s,\"//\") == 0) {","\t\t\t\t\t\t\tif(f) cout<<endl;","\t\t\t\t\t\t\telse f = true;","\t\t\t\t\t\t}else cout<<s<<\" \";","\t\t\t\t\t}","\t\t\t\t\tcout<<\"\\n\\n\";","\t\t\t\t}","\t\t\t}","\t\t}","\t}","","\treturn 0;","}"]
				for j in range (0, len(s:main_lines)-1)
					call append(s:line, s:main_lines[j])
					let s:line += 1
				endfor
				continue
			endif
			if match(s:template_lines[i],"int main()") >= 0
				let s:template_lines[i] = substitute(s:template_lines[i], "int main()", "int cpp4cf_main()", "")
			endif

			call append(s:line, s:template_lines[i])
			let s:line += 1

		endfor

	catch /E484/
		echom "Error in cpp4cf.vim: couldn't read file: " . s:cpp4cf_template
	endtry

	normal gg

	unlet! s:template_lines

endfunction

command! CFTemplate call s:LoadTemplate()
