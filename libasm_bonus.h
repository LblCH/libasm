/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm_bonus.h                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ztawanna <ztawanna@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/11/08 08:22:06 by ztawanna          #+#    #+#             */
/*   Updated: 2020/11/13 23:00:25 by ztawanna         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_BONUS_H
# define LIBASM_BONUS_H

typedef struct		s_list
{
	void			*data;
	struct s_list	*next;
}					t_list;

int					ft_list_size(t_list *list);
void				ft_list_push_front(t_list **list, void *data);
void				ft_list_sort(t_list **list, int	(*cmp)());
int					ft_atoi_base(char *str, char *base);
void				ft_list_remove_if(t_list **list,\
						void *data_ref, int (*cmp)(), void (*free_fnc)(void *));
#endif
