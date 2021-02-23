#include <stdio.h>

extern int	ft_strlen(char *s);

int	main(void)
{
	int i;

	i = ft_strlen("abc");
	printf("%d", i);
}
