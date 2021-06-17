docker-compose run app brakeman -o brakeman_output.html -I

docker-compose run app bundler-audit check --update
