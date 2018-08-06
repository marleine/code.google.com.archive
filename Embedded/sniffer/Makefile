all:
	gcc -o bin/sniffer src/*.c -Wall -lpcap;

clean:
	rm -rf bin/*;

run:
	cd bin && sudo ./sniffer eth0;
