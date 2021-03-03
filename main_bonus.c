#include "libasm.h"

void	test_ft_list_push_front(void)
{
	t_list	start;
	t_list	*begin;

	printf("\n\033[0;33mTEST LST_PUSH_FRONT\033[0m\n");
	start.data = "hello";
	start.next = NULL;
	begin = &start;
	printf("The data at the beginning of the list is %s\n",(char *) begin->data);
	ft_list_push_front(&begin, "world");
	printf("Now, after pushing elem at the top, begin->data = %s\n",(char *) begin->data);

}

int		main(void)
{
	test_ft_list_push_front();
}
