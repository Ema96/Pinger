#!/usr/local/bin/zsh

function ProgressBar {
    # Process data
    let _progress="(${1}*100/${2}*100)/100"
    let _done="(${_progress}*4)/10"
    let _left="40-$_done"
    
    # Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")
    
    printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%%"
}


# Variables
_start=1
_ipAddress=192.168.1
_end=100

printf "Initializing Pinger\n"

for number in $(seq $_start $_end)
do
    ping -c 1 -t 1 192.168.1.$number &>/dev/null 2>&1
    
    if [[ $? = 0 ]]; then
        printf "\nSuccessful Ping From : $_ipAddress.$number\n"
    fi
    
    ProgressBar $number $_end
done