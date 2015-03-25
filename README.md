## ESPN 2015 Brackets and Imputed Power Rankings

Merged with another source to yield 3541696 unique ESPN NCAA tournament brackets, which in turn expand to 223126848 game predictions.

Uncompress brackets archive:

gzip -d csv/espn-brackets.csv.gz

Generate game picks from brackets:

./brackets-games.rb

Generate game counts from game picks:

./brackets-counts.sh

Generate game binomial outcome counts from game counts:

./brackets-binomial.rb > csv/espn-outcomes.csv
