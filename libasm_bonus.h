/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm_bonus.h                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ztawanna <ztawanna@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/11/08 08:22:06 by ztawanna          #+#    #+#             */
/*   Updated: 2020/11/08 08:56:37 by ztawanna         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */


#ifndef LIBASM_BONUS_H
#define LIBASM_BONUS_H

typedef struct	s_list
{
	void	*data;
	struct	s_list *next;
} 				t_list;

int		ft_list_size(t_list *list);
void	ft_list_push_front(t_list **list, void *data);
int	ft_list_sort(t_list **list, int	(*cmp)());
int		ft_atoi_base(char *str, char *base);

#endif
