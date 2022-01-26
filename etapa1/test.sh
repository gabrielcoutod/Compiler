# Meant for testing the scanner. It creates an output file that is 
# compared with 'gold.txt' to check for errors. The lines that print the table
# won't be compared but will be printed. 'test.txt' also tests if the hash table
# handles conflicts correctly (not inserting the identifier ident more than once) 
# and if adding a new node to a position that already has a node works correctly.

./etapa1 < test.txt > out.txt
diff <(head -n 71 out.txt) gold.txt
tail -n +72 out.txt
rm out.txt