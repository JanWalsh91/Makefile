# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jwalsh <jwalsh@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/12 15:16:17 by jwalsh            #+#    #+#              #
#    Updated: 2018/04/12 17:07:55 by jwalsh           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME := program

SRCS := main testFunction

EXT  :=.c
SRCS := $(addsuffix $(EXT), $(SRCS))
OBJS := $(SRCS:.c=.o)
SRCS_DIR := ./src
OBJS_DIR := ./obj
OBJS := $(addprefix $(OBJS_DIR)/, $(OBJS))
SRCS := $(addprefix $(SRCS_DIR)/, $(SRCS))

HEADERS := header.h
HEADER_DIR := ./inc/
HEADERS := $(addprefix $(HEADER_DIR), $(HEADERS))

CC := gcc
CFLAGS := -Wall -Werror -Wextra

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(NAME)	

$(OBJS): | $(OBJS_DIR)

$(OBJS_DIR)/%.o: $(SRCS_DIR)/%.c $(HEADERS)
	$(CC) $(CFLAGS) -o $@ -c $<

$(OBJS_DIR):
	mkdir -p $(OBJS_DIR)

clean:
	rm -rf $(OBJS_DIR)

fclean: clean
	rm -f $(NAME)

re: fclean all

PHONY: re all clean fclean

.PHONY: all clean fclean re
