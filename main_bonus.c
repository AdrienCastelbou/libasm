#include "libasm.h"

void	test_ft_atoi_base(void)
{
	char	*dec = "0123456789";
	char	*hex = "0123456789abcdef";
	char	*bin = "01";
	int		result;

	printf("\n\033[0;33mTEST FT_ATOI_BASE\033[0m\n");
	result = ft_atoi_base("1298", dec);
	printf("1298 int value in decimal base = %d\n", result);
	result = ft_atoi_base("1298", hex);
	printf("1298 int value in hexa base = %d\n", result);
	result = ft_atoi_base("1298", bin);
	printf("1298 int value in bin base = %d\n", result);
}

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
	free(begin);
}

void	test_ft_list_size()
{
	t_list	one;
	t_list	two;
	t_list	three;
	int		result;

	one.next = &two;
	two.next = &three;
	three.next = NULL;
	printf("\n\033[0;33mTEST LST_SIZE\033[0m\n");
	result = ft_list_size(&one);
	printf("the list\'s size is %d\n", result);
}

int		main(void)
{
	test_ft_atoi_base();
	test_ft_list_push_front();
	test_ft_list_size();
}
