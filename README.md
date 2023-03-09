# MPC Jack

This is a bash script that uses jackd and zita-j2n to stream audio from a capture device to a remote IP address. The script retrieves the global IP address of the machine and sets it as the destination IP for the audio stream.
## Prerequisites

- jackd - a low-latency audio server
- zita-j2n - a tool that streams audio from jackd to a network destination
- A capture device connected to the machine

## Usage

- Make the script executable using chmod +x start.sh
- Run the script using ./start.sh
- The script will retrieve the global IP address of the machine and set it as the destination IP for the audio stream.
- The script will then start jackd with the alsa driver and the specified capture device.
- zita-j2n will be started and configured to stream the audio to the remote IP address and port 8888.
- Finally, jack_connect is used to connect the capture channels to the zita-j2n channels.

## Script explanation

#### The script has the following steps:

- Retrieve the global IP address of the machine using ip a | grep global | awk '{print $2;}' | sed -n 's/\/.*//p'. This command retrieves the IP address of the network interface - that is connected to the internet and removes the subnet mask.
- Start jackd with the alsa driver and the specified capture device using jackd -d alsa -d hw:ACVA &.
- Start zita-j2n and configure it to stream audio to the remote IP address and port 8888 using ./zita-j2n [ip-address] 8888 &. The $ip variable is the IP address retrieved in step 1.
- Use jack_connect to connect the system capture channels to the zita-j2n channels using jack_connect system:capture_1 zita-j2n:in_1 & and jack_connect system:capture_2 zita-j2n channels.
- j2n:in_2 &. These commands connect the left and right audio channels of the capture device to the corresponding zita-j2n channels.
