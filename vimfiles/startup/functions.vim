"========= Custom Functions =========
fun! Format_WhiteSpace_RemoveTrailing()
   :%s/\v\s*$//g
   '' " Ctrl-O
endfun

fun! Format_Inflection_ToCamelCase()
   :/\v([a-z])_([a-z])/\1\u\2/g
endfun

fun! CheckTabs()
	if search("\t") != 0
		echohl ErrorMsg | ec "                                 !WARNING!                              "
					\ |              ec "There are tabs in the file, do you want to convert them to spaces? [Y/n]" | echohl None
		let choice = nr2char(getchar())
		if choice == 'y' || choice == "\<CR>"
			retab 2
		endif
	else
		return
	endif
endfun

