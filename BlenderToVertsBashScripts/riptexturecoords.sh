#!/bin/bash
cat $1 | sed -n '/grp0/,/grp/p' | awk '{
if($1=="f"){
	i=index($2,"/"); 
                coord1=(substr($2,i+1))-1;
        i=index($3,"/");
                coord2=(substr($3,i+1))-1;
        i=index($4,"/");
                coord3=(substr($4,i+1))-1;
        printf("%s, %s, %s, \n", coord1, coord2, coord3);
}
}' > grp0.texcoords
