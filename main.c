#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>

int	ft_strlen(char *s);

char	*ft_strcpy(char *dst, char *src);

int		ft_strcmp(char *s1, char *s2);

ssize_t		ft_write(int fildes, char *s, int len);

int			ft_read(int fd, char *buff, int len);

char		*ft_strdup(char *s);

void	test_ft_strlen(void)
{
	printf("TEST STRLEN\n");
	printf("strlen(hello):\n");
	printf("real = %d, ft = %d\n", (int)strlen("hello"), ft_strlen("hello"));
	printf("strlen(\"\"):\n");
	printf("real = %d, ft = %d\n", (int)strlen(""), ft_strlen(""));
}

void	test_ft_strcpy(void)
{
	char	rdst[20];
	char	fdst[20];
	char	*s = "hello world";
	bzero(rdst, 20);
	bzero(fdst, 20);
	printf("TEST STRCPY\n");
	printf("strcpy(dst, \"hello world\"):\n");
	printf("real = %s, ft = %s\n", strcpy(rdst, s), ft_strcpy(fdst, s));
}

void	test_ft_strcmp(void)
{
	char	*s1 = "hello";
	char	*s2 = "world";
	char	*s3 = "hallo";

	printf("TEST STRCMP\n");
	printf("Lets cmp %s and %s:\n", s1, s2);
	printf("real = %d, ft = %d\n", strcmp(s1, s2), ft_strcmp(s1, s2));
	printf("Now cmp %s and %s:\n", s1, s3);
	printf("real = %d, ft = %d\n", strcmp(s1, s3), ft_strcmp(s1, s3));
	printf("Final cmp is between %s and %s:\n", s2, s3);
	printf("real = %d, ft = %d\n", strcmp(s2, s3), ft_strcmp(s2, s3));
}

void	test_ft_write(void)
{
	printf("TEST WRITE\n");
	printf(" is writed by real and ret = %d\n", (int)write(1, "hello", 5));
	printf(" is writed by ft and  ret = %d\n", (int)ft_write(1, "hello", 5));
	printf(" is writed by real and ret = %d\n", (int)write(10, "hello", 5));
	printf(" is writed by ft and ret = %d\n", (int)ft_write(10, "hello", 5));
}

int		main(void)
{
	test_ft_strlen();
	test_ft_strcpy();
	test_ft_strcmp();
	test_ft_write();
}
