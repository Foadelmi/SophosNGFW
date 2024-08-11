how to bluk import hosts into sophos fw: first create a txt file (input file) and list all ip ranges like:

10.20.30.0/24 20.30.40.0/28 56.36.35.39/32 58.65.95.2/30 . . .

then run the python script and output file will be created. rename output file in linux with the name: "entities.xml" and make it tar (the tar file name can be anything import it to sophos (it takes time and nothing is shown to you during the import. be pationt)
