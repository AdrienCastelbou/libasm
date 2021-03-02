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

int			ft_atoi_base(char *s, char *base);

void	test_ft_strlen(void)
{
	printf("\n\033[0;33mTEST STRLEN\033[0m\n");
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
	printf("\n\033[0;33mTEST STRCPY\033[0m\n");
	printf("strcpy(dst, \"hello world\"):\n");
	printf("real = %s, ft = %s\n", strcpy(rdst, s), ft_strcpy(fdst, s));
}

void	test_ft_strcmp(void)
{
	char	*s1 = "hello";
	char	*s2 = "world";
	char	*s3 = "hallo";

	printf("\n\033[0;33mTEST STRCMP\033[0m\n");
	printf("Lets cmp %s and %s:\n", s1, s2);
	printf("real = %d, ft = %d\n", strcmp(s1, s2), ft_strcmp(s1, s2));
	printf("Now cmp %s and %s:\n", s1, s3);
	printf("real = %d, ft = %d\n", strcmp(s1, s3), ft_strcmp(s1, s3));
	printf("Final cmp is between %s and %s:\n", s2, s3);
	printf("real = %d, ft = %d\n", strcmp(s2, s3), ft_strcmp(s2, s3));
}

void	test_ft_write(void)
{
	printf("\n\033[0;33mTEST WRITE\033[0m\n");
	printf(" is writed by real and ret = %d\n", (int)write(1, "hello", 5));
	printf(" is writed by ft and  ret = %d\n", (int)ft_write(1, "hello", 5));
	printf(" is writed by real and ret = %d\n", (int)write(10, "hello", 5));
	printf(" is writed by ft and ret = %d\n", (int)ft_write(10, "hello", 5));
}

void		test_ft_read()
{
	char	buff[32];
	int		fd;
	int		ret;

	printf("\n\033[0;33mTEST READ\033[0m\n");
	("Lets see what is happening with OG read:\n");
	fd = open("main.c", O_RDONLY);
	ret = read(fd, buff, 31);
	buff[ret] = 0;
	printf("OG read have read :\n\033[0;32m%s\033[0m\nThe return value is %d\n", buff, ret);
	close(fd);
	("Lets see what is happening with ft_read:\n");
	bzero(buff, 32);
	fd = open("main.c", O_RDONLY);
	ret = ft_read(fd, buff, 31);
	buff[ret] = 0;
	printf("The ft_read have read :\n\033[0;32m%s\033[0m\nThe return value is %d\n", buff, ret);
	close(fd);
	printf("With bad inputs :\n");
	bzero(buff, 32);
	ret = read(3, buff, 31);
	printf("OG read have read :\n\033[0;32m%s\033[0m\nThe return value is %d\n", buff, ret);
	ret = ft_read(3, buff, 31);
	printf("The ft_read have read :\n\033[0;32m%s\033[0m\nThe return value is %d\n", buff, ret);
}

void	test_ft_strdup(void)
{
	char	*s = "hello";
	char	*d1;
	char	*d2;

	printf("\n\033[0;33mTEST STRDUP\033[0m\n");
	printf("Try to duplicate \033[0;34m%s\033[0m with OG...\n", s);
	d1 = strdup(s);
	printf("d1 looks like \033[0;34m%s\033[0m, perfect dup !", d1);
	printf("Now try to do the same with ft_strdup:\n");
	d2 = ft_strdup(s);
	printf("Wow, d2 = \033[0;34m%s\033[0m, like s !\n", d2);
	free(d1);
	free(d2);
	printf("\n\033[0;32md1 and d2 have been successfully freed\033[0m\n");
}

int		main(void)
{/*
	test_ft_strlen();
	test_ft_strcpy();
	test_ft_strcmp();
	test_ft_write();
	test_ft_read();
	test_ft_strdup();*/
	int nb;
	
	nb = ft_atoi_base(" -+--q", "0123456789");
	printf("%d\n", nb);
}
