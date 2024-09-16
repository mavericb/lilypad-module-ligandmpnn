#!/bin/bash

echo "pod2 started"

if [[ $PUBLIC_KEY ]]
then
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
    cd ~/.ssh
    echo $PUBLIC_KEY >> authorized_keys
    chmod 700 -R ~/.ssh
    cd /
    service ssh start
fi

#python3 /app/main.py

python3 run.py --seed 111 --pdb_path "./inputs/1BC8.pdb" --out_folder "./outputs/default"

# Print the results
echo "Printing results:"
cat ./outputs/default/seqs_scores.csv