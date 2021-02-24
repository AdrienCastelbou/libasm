#include <stdio.h>
#include <unistd.h>

extern int	ft_strlen(char *s);

extern	char	*ft_strcpy(char *dst, char *src);

extern	int		ft_strcmp(char *s1, char *s2);

extern	ssize_t		ft_write(int fildes, char *s, int len);

int	main(void)
{
	printf("return = %zd", ft_write(10, "hello", 5));
	printf("return = %zd", write(10, "hello", 5));
}
