/* 
 * mySniffer.c
 * CSEN701
 * Embedded Assign1
 * Marleine Mounir Daoud
 * 4-3096
 * E11
 */

#include <stdio.h>
#include <pcap.h>

#define snapLen 1600 // snap length used in opening the device and means maximum bytes per packet to capture

void got_packet(u_char *args, const struct pcap_pkthdr *header, const u_char *packet); // callback function prototype

int main(int argc, char *argv[])
{
	char *dev = argv[1]; // the device to sniff on, takes device eth0 as input
	printf("Device: %s\n", dev); // prints the device entered by the user
	pcap_t *handle; // packet capture handle 
	char errbuf[PCAP_ERRBUF_SIZE]; // error buffer
	handle = pcap_open_live(dev, snapLen, 1, 2000, errbuf); // open capture device
	if (handle == NULL) 
	{
		fprintf(stderr, "Sorry, couldn't open device %s: %s\n", dev, errbuf); // error message if handle was found to be NULL
		return(1); // return 1 so means there's an error
	}
	
	bpf_u_int32 mask; // the netmask
	bpf_u_int32 net; // the IP
	
	if (pcap_lookupnet(dev, &net, &mask, errbuf) == -1) // sets the properties od the device
	{
		fprintf(stderr, "Couldn't get netmask for device %s: %s\n", dev, errbuf);
		net = 0;
		mask = 0;
	}
	
	pcap_loop(handle, -1 , got_packet, NULL);
	pcap_close(handle); // close the session

	return(0); // return 0 means no errors
}

void got_packet (u_char *args, const struct pcap_pkthdr *header, const u_char *packet)
{
	printf(" --- Packet Begin ---\n");
	printf("Size: %d\n", header->len); // prints packet size
	printf("Packet content in Hex: \n"); // prints content in hex
	
	int i=0;
	
	while (header->len>i)
	{
		printf("0x%x ", packet[i]);
		i++;
	} 
	printf("\n --- Packet End ---\n\n");
}
