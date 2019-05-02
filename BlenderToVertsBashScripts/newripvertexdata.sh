#!/bin/bash
echo 0 > x.text
foo(){
	x=$(cat x.text)
	x=$((x+1))
	echo $x > x.text
}
cat $1 | sed -n '/grp2/,/grp/p' | awk '{
if($1=="v"){
	x=$2
	y=$3
	z=$4*-1
	x2=0.58244
	y2=-0.01897
	z2=-0.15794
	print x-x2"f,",y-y2"f,",z-z2"f,"
}
}' > $1.verts
cat $1 | sed -n '/grp2/,/grp/p' | awk '{
if($1=="v"){
	printf("a\n")
}
}' | while read ASDF; do
	foo
done
cat x.text

cat $1 | sed -n '/grp1/,/grp/p' | awk -v x=$(cat x.text) '{
if($1=="v"){
	x=$2
	y=$3
	z=$4*-1
	x2=-0.58244
	y2=-0.01897
	z2=-0.15794
	print x-x2"f,",y-y2"f,",z-z2"f,"
}
}' >> $1.verts
cat $1 | sed -n '/grp1/,/grp/p' | awk '{
if($1=="v"){
	printf("a\n")
}
}' | while read ASDF; do
	foo
done
cat x.text

cat $1 | sed -n '/grp3/,/grp/p' | awk -v x=$(cat x.text) '{
if($1=="v"){
	x=$2
	y=$3
	z=$4*-1
	x2=-0.00042
	y2=-0.04334
	z2=-1.25622
	print x-x2"f,",y-y2"f,",z-z2"f,"
}
}' >> $1.verts
cat $1 | sed -n '/grp3/,/grp/p' | awk '{
if($1=="v"){
	printf("a\n")
}
}' | while read ASDF; do
	foo
done
cat x.text

cat $1 | sed -n '/grp0/,/grp/p' | awk -v x=$(cat x.text) '{
if($1=="v"){
	x=$2
	y=$3
	z=$4*-1
	x2=0.02688
	y2=0.14431
	z2=-0.14968
	print x-x2"f,",y-y2"f,",z-z2"f,"
}
}' >> $1.verts
cat $1 |  sed -n '/grp0/,/grp/p' | awk -v q=$(cat x.text) 'BEGIN{
ZETA=0
BETA=0
OMEGA=0
PHI=0
}
{
if($1=="f"){
        i=index($2,"/");
                texcoord1=(substr($2,i+1))-1;
        i=index($3,"/");
                texcoord2=(substr($3,i+1))-1;
        i=index($4,"/");
                texcoord3=(substr($4,i+1))-1;
        if((x=index($2,"/")) > 0) {
                coord1=(substr($2,1,x-1))-1-q;
        }
        if((x=index($3,"/")) > 0) {
                coord2=(substr($3,1,x-1))-1-q;
        }
        if((x=index($4,"/")) > 0) {
                coord3=(substr($4,1,x-1))-1-q;
        }
	coordindex[ZETA]=coord1;
	coordindex[ZETA+1]=texcoord1;
	coordindex[ZETA+2]=coord2;
	coordindex[ZETA+3]=texcoord2;
	coordindex[ZETA+4]=coord3;
	coordindex[ZETA+5]=texcoord3;
	ZETA=ZETA+6;
}
if($1=="vt"){
        x=$2
        y=1-$3
        coords[BETA]=x
	coords[BETA+1]=y
	BETA=BETA+2;
}
}
END{
	for(BEEF in coordindex) {
		if (OMEGA%2==0){
			LAME=coordindex[OMEGA]
			DUCK=coordindex[OMEGA+1]
			finalcoords[LAME*2]=coords[DUCK*2]
			finalcoords[LAME*2+1]=coords[DUCK*2+1]
		}
		OMEGA=OMEGA+1
	}
	for(SALAMI in finalcoords){
		if (PHI%2==0) {
			print finalcoords[PHI]"f,",finalcoords[PHI+1]"f,"
		}
		PHI=PHI+1
	}
}' > $1.texcoords

cat $1 | sed -n '/grp3/,/grp/p' | awk '{
if($1=="v"){
	printf("a\n")
}
}' | while read ASDF; do
	foo
done
cat x.text
cat $1 | awk '{
if($1=="f"){
        if((x=index($2,"/")) > 0) {
                coord1=(substr($2,1,x-1))-1;
        } else {
		coord1=$2-1;
	}
        if((x=index($3,"/")) > 0) {
                coord2=(substr($3,1,x-1))-1;
        } else {
		coord2=$3-1;
	}
        if((x=index($4,"/")) > 0) {
                coord3=(substr($4,1,x-1))-1;
        } else {
		coord3=$4-1;
	}
        printf("%s, %s, %s, \n", coord1, coord2, coord3);

}
}' > $1.vertexdraworder


