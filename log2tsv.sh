#/usr/bin/bash

echo "[[ convert started ]]"

if [ ! -d log ]; then
	echo "log directory not found."
	exit 1
fi

if [ ! -d tsv ]; then
	mkdir tsv
fi

# copy files in log directory to tsv directory.
ls -1 log | xargs -t -I{} cp -p log/{} tsv/{}.tsv


# convert log format to tsv format.
ls -1 tsv/*.log.tsv | xargs -t -n 1 sed -i -e '/^----/d' -e 's/ \+|/|/g' -e 's/|/\t/g'

echo "[[ convert end ]]"
