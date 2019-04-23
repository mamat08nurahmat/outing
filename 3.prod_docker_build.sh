docker pull mamat08nurahmat/bni_inacraft:prod
docker-compose -f prod_docker-compose.yml down
docker-compose -f prod_docker-compose.yml up -d
