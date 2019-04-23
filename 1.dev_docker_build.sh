docker-compose -f dev_docker-compose.yml down
docker build -t mamat08nurahmat/bni_inacraft:dev .
docker push mamat08nurahmat/bni_inacraft:dev
docker-compose -f dev_docker-compose.yml up -d
