# Example input

    $ cat cols.txt
    abc	1	2	3
    def	4	5	6
    ga	7	9	10
    hij	1	5	99

The columns are separated by tabs, but any whitespace will do for awk.


# Matching lines

Remember that "numbers" are just character strings!


## Regular expressions

An "a" in the first column:

    $ awk '$1 ~ /a/' cols.txt
    abc	1	2	3
    ga	7	9	10

An "a" at the start of the first column:

    $ awk '$1 ~ /^a/' cols.txt
    abc	1	2	3

A "9" in the fourth column:

    $ awk '$4 ~ /9/' cols.txt
    hij	1	5	99

A "9" in any column:

    $ awk '/9/' cols.txt
    ga	7	9	10
    hij	1	5	99

A "99" in any column:

    $ awk '/99/' cols.txt
    hij	1	5	99


## Exact string matches

Second column must be exactly "1":

    $ awk '$2 == "1"' cols.txt
    abc	1	2	3
    hij	1	5	99

Third column must be exactly "5":

    $ awk '$3 == "5"' cols.txt
    def	4	5	6
    hij	1	5	99

Fourth column must be exactly "9":

    $ awk '$4 == "9"' cols.txt

Fourth column must be exactly "99":

    $ awk '$4 == "99"' cols.txt
    hij	1	5	99


# Extracting output

Where the match occurs, print the entire line:

    $ awk '$2 == "1" { print $0 }' cols.txt
    abc	1	2	3
    hij	1	5	99

... print the fourth column:

    $ awk '$2 == "1" { print $4 }' cols.txt
    3
    99

... print the third and fourth columns:

    $ awk '$2 == "1" { print $3 $4 }' cols.txt
    23
    599

... separated by a space:

    $ awk '$2 == "1" { print $3, $4 }' cols.txt
    2 3
    5 99

... separated by a tab:

    $ awk '$2 == "1" { print $3 "\t" $4 }' cols.txt
    2	3
    5	99


# Arithmetic

Digit strings can also be treated as numbers by awk.

## Operations

Add values:

    $ awk '{ print 2 + 2 }' cols.txt
    4
    4
    4
    4

... once:

    $ awk 'BEGIN { print 2 + 2 }' cols.txt
    4

Add columns:

    $ awk '{ print $2 + $3 + $4 }' cols.txt
    6
    15
    26
    105

Calculate means, even if they are non-integer:

    $ awk '{ print ($2 + $3 + $4) / 3 }' cols.txt
    2
    5
    8.66667
    35


## Running sums

Sum the values in the fourth column:

    $ awk '{ sum += $4 } END { print sum }' cols.txt
    118

... if the second column matches:

    $ awk '$2 == "1" { sum += $4 } END { print sum }' cols.txt
    102

... and also print the values used:

    $ awk '$2 == "1" { print $4; sum += $4 } END { print sum }' cols.txt
    3
    99
    102

... and also print the rows used:

    $ awk '$2 == "1" { print; sum += $4 } END { print sum }' cols.txt
    abc	1	2	3
    hij	1	5	99
    102

... and use an initial value:

    $ awk 'BEGIN { sum = 1000 } $2 == "1" { print; sum += $4 } END { print sum }' cols.txt
    abc	1	2	3
    hij	1	5	99
    1102

# 本地test

...➜  awk git:(master) awk '$1 ~ /a/' cols.txt
abc 1   2   3
ga  7   9   10
➜  awk git:(master) awk '$1 ~ 1' cols.txt
➜  awk git:(master) awk '$2 ~ 1' cols.txt
abc 1   2   3
hij 1   5   99
➜  awk git:(master) awk '$2 ~ 1' cols.txt
abc 1   2   3
hij 1   5   99
➜  awk git:(master) awk '$2 ~ 5' cols.txt
➜  awk git:(master) awk '$2 = 1' cols.txt
abc 1 2 3
def 1 5 6
ga 1 9 10
hij 1 5 99
➜  awk git:(master) awk '$2 == 1' cols.txt
abc 1   2   3
hij 1   5   99
➜  awk git:(master) awk '$2 ~ 1' cols.txt
abc 1   2   3
hij 1   5   99
➜  awk git:(master) awk '$2 ~ 1' cols.txt
abc 1   2   3
hij 1   5   99
➜  awk git:(master) awk '$2 ~ 1' cols.txt
abc 1   2   3
hij 1   5   99
➜  awk git:(master) awk '$2 ~ 1' cols.txt
abc 1   2   3
hij 1   5   99
➜  awk git:(master) awk '$2 ~ 1' cols.txt
abc 1   2   3
hij 1   5   99
➜  awk git:(master) awk '$2 ~ 1' cols.txt
abc 1   2   3
hij 1   5   99
➜  awk git:(master) awk '$2 ~ 1' cols.txt
abc 1   2   3
hij 1   5   99
➜  awk git:(master) awk '$2 ~ 1' cols.txt
abc 1   2   3
hij 1   5   99