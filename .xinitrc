if [[ -f /usr/bin/prime-offload ]]; then
    /usr/bin/prime-offload
fi

exec qtile start 

if [[ -f /usr/bin/prime-switch ]]; then
    sudo /usr/bin/prime-switch
fi
