#!/usr/bin/awk -f
BEGIN{
     if(ARGC < 3){
        printf "3 arguments needed:[Gaussian log file] [Number of atoms] [Coordinates file]\n";
        exit;
     }
     gaulog = ARGV[1];
     natom  = ARGV[2];
     coords = ARGV[3];
     delete ARGV[2];
     delete ARGV[3];
}
/^ *Input orientation:/ {
   icount=1;
   printf "%d\n\n",natom > coords;
   while((getline > 0)&&icount<=natom+4){
                    if(icount>=5){
                       printf "%5d%16.8f%16.8f%16.8f\n",$2,$4,$5,$6 > coords;
                    }
                    ++icount;
             }

}

