# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vfurmane <vfurmane@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/02 11:06:52 by vfurmane          #+#    #+#              #
#    Updated: 2022/02/06 15:01:49 by vfurmane         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= Inception
FILE	= -f srcs/docker-compose.yml

all:	build $(NAME)

build:
		docker-compose $(FILE) build

$(NAME):
		docker-compose $(FILE) up

clean:
		docker-compose $(FILE) stop

fclean:
		docker-compose $(FILE) down

re: 	fclean all

.PHONY: all build $(NAME) clean fclean re
