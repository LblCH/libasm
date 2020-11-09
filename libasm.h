/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ztawanna <ztawanna@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/11/08 08:22:35 by ztawanna          #+#    #+#             */
/*   Updated: 2020/11/08 08:22:35 by ztawanna         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */


#ifndef LIBASM_H
# define LIBASM_H

#include <stdlib.h>
#include <unistd.h>

size_t		ft_strlen(const char *s);
char		*ft_strcpy(char *dst, const char *src);
int			ft_strcmp(const char *str1, const char *str2);
int			ft_write(int handle, void *buf, int count);
int			ft_read(int fd, void *buf, unsigned count);
char		*ft_strdup(const char *src);

#endif
