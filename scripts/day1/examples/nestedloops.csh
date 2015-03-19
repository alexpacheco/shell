#!/bin/tcsh

## Example of Nested loops

echo "Nested for loops"
foreach a (`seq 1 5`)
  echo "Value of a in outer loop:" $a
  foreach b (`seq 1 2 5`)
    @ c = $a * $b 
    if ( $c <  10 ) then
      echo "a * b = $a * $b = $c"
    else
      echo "$a * $b > 10"
      break
    endif
  end
end
echo "========================"
echo
echo "Nested for and while loops"
foreach a (`seq 1 5`)
  echo "Value of a in outer loop:" $a
  set b = 1
  while ( $b <= 5 )
    @ c = $a * $b
    if ( $c < 5 ) then
      echo "a * b = $a * $b = $c"
    else
      echo "$a * $b > 5"
      break
    endif
    @ b = $b + 2
  end
end
echo "========================"
