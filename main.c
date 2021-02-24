#include <stdio.h>

extern int	ft_strlen(char *s);

extern	char	*ft_strcpy(char *dst, char *src);

extern	int		ft_strcmp(char *s1, char *s2);

int	main(void)
{
	char dst[] = "hello";
	char src[] = "hallo";
	printf("return : [%d]\n", ft_strcmp("hello", "hallo"));
}
