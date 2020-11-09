#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include "libasm.h"
#include <sys/errno.h>
#include <unistd.h>
#include <string.h>

int main() {
	printf("ft_strlen of %s = %zu\n", "1234567890", ft_strlen("1234567890"));
	printf("-------------------------------------\n");

	char dst[] = "12345";
	char *src = "54321";
	printf("ft_strcpy %s\n", ft_strcpy(dst, src));
	printf("strcpy %s\n", strcpy(dst, src));
	printf("-------------------------------------\n");

	char *src1 = "1";
	char *src2 = "1";
	printf("%d\n", ft_strcmp(src1, src2));
	printf("%d\n", strcmp(src1, src2));
	printf("-------------------------------------\n");

    int fd = open("./text.txt", O_WRONLY);
    char buf[10];
    printf("write %zd\n", write(fd, "1234567890", 10));
	printf("errno %d\n", errno);
	printf("ft_write %d\n", ft_write(fd, "1234567890", 10));
	printf("errno %d\n", errno);
	close(fd);
	printf("-------------------------------------\n");

	fd = open("./text.txt", O_RDONLY);
	printf("read %zd\n", read(fd, buf, 9));
	printf("errno %d\n", errno);
	printf("read buf %s\n", buf);
	printf("ft_read %d\n", ft_read(fd, buf, 9));
	printf("ft_ errno %d\n", errno);
	printf("ft_read buf %s\n", buf);
	close(fd);
	printf("-------------------------------------\n");

//	char *str = ft_strdup("Azaza");
	printf("Strdup %s\n", ft_strdup("Azaza"));

    return (0);
}