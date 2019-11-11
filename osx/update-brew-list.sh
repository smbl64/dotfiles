set -eu

original_file="Brewfile"
temp_file="temp_file"
output_file="result"

echo "Dumping current brew..."
brew bundle dump --force --file=$temp_file
rm -f $output_file

echo "Merging..."
cat $original_file $temp_file | grep "tap \"" | sort | uniq >> $output_file
cat $original_file $temp_file | grep "brew \"" | sort | uniq >> $output_file
cat $original_file $temp_file | grep "cask \"" | sort | uniq >> $output_file

rm $temp_file

echo "Replacing with the original file..."
mv $output_file $original_file

echo "Done."
