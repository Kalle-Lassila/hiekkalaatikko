#include <stdio.h>
#include <libusb-1.0/libusb.h>

int main(){
    printf("It indeed did compile\n");
    libusb_init(NULL);
    libusb_device **devs;
    size_t cnt = libusb_get_device_list(NULL, &devs);
    printf("test\n");
}