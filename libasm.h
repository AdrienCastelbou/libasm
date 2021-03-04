#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>

typedef struct		s_list
{
	void			*data;
	struct s_list	*next;
}					t_list;

int	ft_strlen(char *s);

char	*ft_strcpy(char *dst, char *src);

int		ft_strcmp(char *s1, char *s2);

ssize_t		ft_write(int fildes, char *s, int len);

int			ft_read(int fd, char *buff, int len);

char		*ft_strdup(char *s);

int			ft_atoi_base(char *s, char *base);

t_list		*ft_list_push_front(t_list **begin_list, void *data);

int		ft_list_size(t_list *begin_list);

int		ft_list_sort(t_list **begin_list, int (*cmp)());

