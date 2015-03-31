#!/usr/bin/awk -f

BEGIN {
  x[1] = "Hello,"
  x[2] = "World!"
  x[3] = "\n"
  for (i=1;i<=3;i++) 
    printf " %s", x[i]
}
