#!/usr/bin/env bash

# Move to the correct directory, create the olddir.
if [ ! -L $0 ]
then
    EXE_PATH=`dirname $0`
else
    REAL=`file $0 | awk '{print $NF}'`
    EXE_PATH=`dirname $REAL`
fi

cd $EXE_PATH/../home

for i in `ls`
do
    echo -n "$i: "
    if [ -f "$i" ]
    then
	if [ -f "$HOME/.${i}" ]
	then
	    echo "Ignoring, exists"
	else
	    echo "setting"
	    ln -s `pwd`/$i $HOME/.${i}
	fi
    else
	echo "bad file in archive"
    fi
done

