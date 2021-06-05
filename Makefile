# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vfurmane <vfurmane@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/02 11:06:52 by vfurmane          #+#    #+#              #
#    Updated: 2021/06/05 16:02:26 by vfurmane         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= Inception

all:	build $(NAME)

build:
		docker-compose -f ./srcs/docker-compose.yml build

$(NAME):
		docker-compose -f ./srcs/docker-compose.yml up

clean:
		docker-compose -f ./srcs/docker-compose.yml stop

fclean:
		docker-compose -f ./srcs/docker-compose.yml down

re: 	fclean all

.PHONY: all $(NAME) clean fclean re
