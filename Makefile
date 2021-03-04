SRCS=	ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_write.s \
		ft_read.s \
		ft_strdup.s \

SRCS_BONUS=	ft_atoi_base_bonus.s \
			ft_list_push_front_bonus.s \
			ft_list_size_bonus.s \
			ft_list_sort_bonus.s

OBJS_BONUS=	$(SRCS_BONUS:.s=.o)

OBJS=	$(SRCS:.s=.o)

NAME=	libasm

AR=		libasm.a

NASM=	nasm -felf64

CC=		gcc

FLAGS=	-no-pie

%.o: %.s
	$(NASM) $< -o $@

$(NAME):	$(OBJS)
	ar -rcs $(AR) $^

all:	$(NAME)

bonus:		$(OBJS) $(OBJS_BONUS)
	ar -rcs $(AR) $^

eval:	$(NAME)
	$(CC) $(FLAGS) main.c $(AR)

eval_bonus:	bonus
	$(CC) $(FLAGS) main_bonus.c $(AR)

clean:
	rm -f $(OBJS) $(OBJS_BONUS)

fclean:	clean
	rm -f $(AR) a.out

re:		$(fclean) $(NAME)

.PHONY:	 all, clean, fclean, re
