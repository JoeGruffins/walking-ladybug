#!/bin/bash
cat $1 | sed -n '/'$2'/,/grp/p' | awk '{
if($1=="vt"){
	x=$2
	y=$3
	print x"f,",y"f,"
}
}' > $2.colorverts
