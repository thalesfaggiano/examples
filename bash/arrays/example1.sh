#!/bin/bash
stock_list () {
  B=($(echo $1 | tr ' ,' '@ '))
  C=($(echo $2 | tr ' ,' '@ '))
  [[ ${#B[@]} == "0" ]] && exit 0
  for y in ${C[@]}; do
    eval "int$y=0"
    for x in ${B[@]}; do
      number=$(echo $x | cut -d'@' -f2 | sed 's/^0*//')
      [[ $y == ${x::1} ]] && eval "int$y=$((int$y+$number))"
    done
    Stdout+=$(echo -n '('$y' : '$(eval echo \$int$y)')')
  done
  echo $Stdout | sed -e 's@)(@) - (@g'
}
stock_list "$1" "$2"
