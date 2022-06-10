the completion engine

to run the config tool

autoload -Uz compinstall
compinstall

???

Completion directories /usr/share/zsh/functions/Completion/*
are already in your $fpath, good.

?? Completers
completer list...

_expand
	- globbing (filename generation), 
	- substitution (anything with a `$' or backquote),
	- completion (all other command line) 
		? 1 turn it on

_list: condition for delay and comparison.
_oldlist: when to keep old list.
_match: whether to assume a `*' at the cursor.
_prefix: whether to add a space before the suffix.

