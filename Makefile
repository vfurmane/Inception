# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vfurmane <vfurmane@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/02 11:06:52 by vfurmane          #+#    #+#              #
#    Updated: 2022/03/09 12:32:59 by vfurmane         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= Inception
FILE	= -f srcs/docker-compose.yml
OPTIONS	= -p inception

all:	build $(NAME)

build:
		docker-compose $(OPTIONS) $(FILE) build

$(NAME):
		mkdir -p /home/vfurmane/data/wordpress-data
		mkdir -p /home/vfurmane/data/adminer-data
		mkdir -p /home/vfurmane/data/grafana-data
		mkdir -p /home/vfurmane/data/wordpress-database
		docker-compose $(OPTIONS) $(FILE) up

clean:
		docker-compose $(OPTIONS) $(FILE) stop

fclean:
		docker-compose $(OPTIONS) $(FILE) down

re: 	fclean all

prune: fclean
		sudo rm -rf /home/vfurmane/data/wordpress-data
		sudo rm -rf /home/vfurmane/data/adminer-data
		sudo rm -rf /home/vfurmane/data/grafana-data
		sudo rm -rf /home/vfurmane/data/wordpress-database
		docker volume rm inception_wordpress-data
		docker volume rm inception_adminer-data
		docker volume rm inception_grafana-data
		docker volume rm inception_wordpress-database

.PHONY: all build $(NAME) clean fclean re
