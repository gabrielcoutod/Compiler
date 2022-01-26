# Made by Gabriel Couto Domingues
# Meant for testing the scanner. It creates an output file that is 
# compared with 'gold.txt' to check for errors. The lines that print the table
# won't be compared but will be printed. 'test.txt' also tests if the hash table
# handles conflicts correctly (not inserting the identifier ident more than once) 
# and if adding a new node to a position that already has a node works correctly.

./etapa1 < test.txt > out.txt
diff <(head -n 72 out.txt) gold.txt
grep str=ident <(tail -n +73 out.txt)
grep str=dd <(tail -n +73 out.txt)
tail -n +73 out.txt
rm out.txt