#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <errno.h>

extern int	ft_strlen(char *s);

extern	char	*ft_strcpy(char *dst, char *src);

extern	int		ft_strcmp(char *s1, char *s2);

extern	ssize_t		ft_write(int fildes, char *s, int len);

extern	int			ft_read(int fd, char *buff, int len);

int	main(void)
{
	int fd;
	char	buff[10];

	fd = open("main.c", O_RDONLY);
	read(10, buff, 9);
	buff[9] = 0;
	printf("%s,   %s", buff, strerror(errno));

}
