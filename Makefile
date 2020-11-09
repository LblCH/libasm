SRCS		= 	ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s

OBJS		=	$(SRCS:.s=.o)

BONUS_SRCS	=	ft_list_sort_bonus.s ft_list_size_bonus.s ft_list_push_front_bonus.s \
				ft_atoi_base_bonus.s
#				ft_list_remove_if_bonus.s

BONUS_OBJS	=	$(BONUS_SRCS:.s=.o)

FLAGS 		=	-Wall -Werror -Wextra

NAME		=	libasm.a

%.o:			%.s
				nasm -f macho64 $<

all:			$(NAME)

$(NAME):		$(OBJS)
				ar rcs $(NAME) $(OBJS)

clean:
				rm -rf $(OBJS) $(BONUS_OBJS)

fclean:			clean
				rm -rf $(NAME) $(BONUS) $(TEST) $(TEST_BONUS)

re:				fclean $(NAME)

bonus:			$(OBJS) $(BONUS_OBJS)
				ar rcs $(NAME) $(OBJS) $(BONUS_OBJS)
