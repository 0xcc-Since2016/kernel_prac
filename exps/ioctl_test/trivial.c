#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<sys/ioctl.h>

//author : afang
//comment: what a nice day, isn't it?!

int main(){

	char *dev = "/dev/example";
	char *buf = "I'm inside kernel.\n";
	int fd = open(dev, O_RDWR);
//	ioctl(fd, 8, 0xffffffff);//copy from user access unmapped region.
	for(int i = 0; i < 100; i++){
	ioctl(fd, 999, 0xffffffff);//copy from user access unmapped region.
	}
	return 0;
}
