# NDFA
implemented the ndfa to find the length of sequence for =&lt;4
Using Promela to model non-deterministic finite-state-automatons. This has added printf statements that make its behaviour easier to observe. It has been setup to allow SPIN to search for all possible accepting sequences of length >= 4.

To do this search you need to do the following step:  spin -run -E -c0 -e final.pml

This will generate a number of trail files, of which the nth can be viewed using spin -tn final.pml. So, for example, the 3rd trail file can be viewed using spin -t3 final.pml.
