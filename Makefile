# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vfurmane <vfurmane@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/02 11:06:52 by vfurmane          #+#    #+#              #
#    Updated: 2021/06/03 11:38:00 by vfurmane         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= Inception

all:	build $(NAME)

build:
		docker-compose build

$(NAME):
		docker-compose up

clean:
		docker-compose stop

fclean:
		docker-compose down

re: 	fclean all

.PHONY: all $(NAME) clean fclean re
