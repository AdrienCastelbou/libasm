SRCS=	ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_write.s \
		ft_read.s \
		ft_strdup.s

OBJS=	$(SRCS:.s=.o)

NAME=	libasm

AR=		libasm.a

NASM=	nasm -felf64

%.o: %.s
	$(NASM) $< -o $@

$(NAME):	$(OBJS)
	ar -rcs $(AR) $^

all:	$(NAME)

clean:
	rm -f $(OBJS)

fclean:	clean
	rm -f $(AR)

re:		$(fclean) $(NAME)

.PHONY:	 all, clean, fclean, re
