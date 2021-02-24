#include <stdio.h>

extern int	ft_strlen(char *s);

extern	char	*ft_strcpy(char *dst, char *src);

int	main(void)
{
	char dst[] = "helloo";
	char src[] = "world";

	printf("%s", ft_strcpy(dst, src));
	printf("%s", dst);
}
