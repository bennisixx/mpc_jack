jackd -d alsa -d hw:ACVA &
zita-j2n 10.42.6.66 8888 &
jack_connect system:capture_1 zita-j2n:in_1 &
jack_connect system:capture_2 zita-j2n:in_2 &



