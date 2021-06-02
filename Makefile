# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vfurmane <vfurmane@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/02 11:06:52 by vfurmane          #+#    #+#              #
#    Updated: 2021/06/02 11:10:44 by vfurmane         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= Inception

all:	$(NAME)

$(NAME):
		docker-compose up

clean:
		docker-compose stop

fclean:
		docker-compose down

re: 	fclean all

.PHONY: all $(NAME) clean fclean re
