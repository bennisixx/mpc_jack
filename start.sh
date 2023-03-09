ip=$(ip a | grep global | awk '{print $2;}' | sed -n 's/\/.*//p')
echo $ip
jackd -d alsa -d hw:ACVA &
./zita-j2n $ip 8888 &
jack_connect system:capture_1 zita-j2n:in_1 &
jack_connect system:capture_2 zita-j2n:in_2 &



