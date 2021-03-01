#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <errno.h>

int	ft_strlen(char *s);

char	*ft_strcpy(char *dst, char *src);

int		ft_strcmp(char *s1, char *s2);

ssize_t		ft_write(int fildes, char *s, int len);

int			ft_read(int fd, char *buff, int len);

char		*ft_strdup(char *s);

int	main(void)
{
	int n;
	char *s = "hello";
	char *dst;

	dst = ft_strdup(s);
	printf("%s, %d\n", dst, (int)strlen(dst));
}
