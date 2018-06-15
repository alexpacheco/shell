#!/usr/bin/awk -f
BEGIN{
     if(ARGC < 3){
        printf "3 arguments needed:[Gaussian log file] [Number of atoms] [MW Velocity file]\n";
        exit;
     }
     gaulog = ARGV[1];
     natom  = ARGV[2];
     vels   = ARGV[3];
     delete ARGV[2];
     delete ARGV[3];
}
/^ *MW Cartesian velocity:/ {
   icount=1;
   while((getline > 0)&&icount<=natom+1){
                    if(icount>=2){
                       gsub(/D/,"E") ;
                       printf "%16.8e%16.8e%16.8e",$4,$6,$8 > vels;
                    }
                    ++icount;
             }
   printf "\n" > vels;

}

