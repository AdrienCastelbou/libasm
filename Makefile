SRCS=	ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_write.s \
		ft_read.s \
		ft_strdup.s \
		ft_atoi_base.s \
		ft_list_push_front.s

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

eval:	$(NAME)
	$(CC) $(FLAGS) main.c $(AR)

clean:
	rm -f $(OBJS)

fclean:	clean
	rm -f $(AR) a.out

re:		$(fclean) $(NAME)

.PHONY:	 all, clean, fclean, re
