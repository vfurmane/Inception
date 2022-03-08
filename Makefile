# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vfurmane <vfurmane@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/02 11:06:52 by vfurmane          #+#    #+#              #
#    Updated: 2022/03/08 11:25:12 by vfurmane         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= Inception
FILE	= -f srcs/docker-compose.yml

all:	build $(NAME)

build:
		docker-compose $(FILE) build

$(NAME):
		mkdir -p /home/vfurmane/data/wordpress-data
		mkdir -p /home/vfurmane/data/adminer-data
		mkdir -p /home/vfurmane/data/grafana-data
		mkdir -p /home/vfurmane/data/wordpress-database
		docker-compose $(FILE) up

clean:
		docker-compose $(FILE) stop

fclean:
		docker-compose $(FILE) down

re: 	fclean all

prune: fclean
		sudo rm -rf /home/vfurmane/data/wordpress-data
		sudo rm -rf /home/vfurmane/data/adminer-data
		sudo rm -rf /home/vfurmane/data/grafana-data
		sudo rm -rf /home/vfurmane/data/wordpress-database
		docker volume rm wordpress-data
		docker volume rm adminer-data
		docker volume rm grafana-data
		docker volume rm wordpress-database

.PHONY: all build $(NAME) clean fclean re
