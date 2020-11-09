#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include "libasm_bonus.h"
#include "libasm.h"
#include <sys/errno.h>
#include <unistd.h>
#include <string.h>

void	printf_list(t_list *list)
{
	while (list)
	{
		printf("%s\n", list->data);
		list = list->next;
	}
}

//int		cmp(void *a, void *b) { return (1); }
//
//void	foo(t_list **list) {
//	t_list**	begin = list;
//
//	t_list*		current = *begin;
//	while (1) {
//		if (current->next == 0)
//			return ;
//		if (ft_strcmp(current->data, current->next->data) > 0) {
//			void* temp =
//		}
//	}
//}

int 	qwe(void* q, void* e) {
	(void )q;
	(void )e;
	return (-1);
}

int		main(void)
{
	t_list list;
	list.data = strdup("1");
	list.next = NULL;
	printf("list size = %d\n", ft_list_size(&list));

	t_list *list1 = &list;
	ft_list_push_front(&list1, strdup("2"));
	ft_list_push_front(&list1, strdup("3"));
	ft_list_push_front(&list1, strdup("4"));
	printf("list size = %d\n", ft_list_size(list1));
	printf_list(list1);
	ft_list_sort(&list1, &ft_strcmp);
	printf_list(list1);

//	printf("%d\n", ft_atoi_base("     -114983fsifo5723", "0123456789"));
	return (0);
}