if has('win64')
	set runtimepath+=~/vimfiles,~/vimfiles/after
	set packpath+=~/vimfiles
	source ~/vimfiles/vimrc
else
	set runtimepath^=~/.vim runtimepath+=~/.vim/after
	let &packpath = &runtimepath
	source ~/.vimrc
endif
