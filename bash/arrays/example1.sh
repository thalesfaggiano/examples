#!/bin/bash
# Select and sum list based in first character
list () {
  B=($(echo $1 | tr ' ,' '@ '))
  C=($(echo $2 | tr ' ,' '@ '))
  for y in ${C[@]}; do
    eval "int$y=0"
    for x in ${B[@]}; do
      number=$(echo $x | cut -d'@' -f2)
      [[ $y == ${x::1} ]] && eval "int$y=$((int$y+$number))"
    done
    Stdout+=$(echo -n '('$y' : '$(eval echo \$int$y)')')
  done
  echo $Stdout | sed -e 's@)(@) - (@g'
}
list "$1" "$2"
