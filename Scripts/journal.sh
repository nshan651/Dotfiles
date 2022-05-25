#!bin/sh
# Script for creating a new journal entry

date=$(date +"%F")
file="$HOME/Documents/wiki/journal/$date.md"
if [ -f $file ]; then
	$TERMINAL -e nvim $file
	exit
fi
echo "- [$date]($date)" >> "$HOME/Documents/wiki/journal/index.md"
touch $file
echo "# $date" >> $file
echo "Journal entry created"
$TERMINAL -e nvim $file
