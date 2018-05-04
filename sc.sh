#/bin/bash

inventory=$1;
command=$2;

for (( i=1; i<=`wc -l $inventory |cut -d ' ' -f1`; i++ ))
do
  echo -e ""
  echo "`sed -n ''$i'p' < $inventory`---"
  echo -e ""
  ssh -i ~/Downloads/kafka.pem "`sed -n ''$i'p' < $inventory`" "$command && exit"
done
