# A simple todo system
# Edit files with the .md extension
# Todo items begin with a +
# Needs you GOPATH setup and the library below
# Usage:
# todo - lists all todo items
# todo # - edit the file with the todo line

function todo (){
colorize="$GOPATH/src/github.com/jaisingh/colorize/colorize -alt"
list=$(find ~/Documents -iname "*.md" -print | xargs egrep "^(\+|\s+\+)")

if [ -z $1 ]
then
	echo "$list" | nl | column -t -s ";" | $colorize -color='default:236'
	return
fi

echo "$list" | sed -n $1p | cut -d : -f 1 | xargs -o vim
}
