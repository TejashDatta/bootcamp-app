docker-compose run --no-deps app rails new . --force --database=postgresql
sudo chown -R $USER:$USER .
docker-compose build
docker-compose up
docker-compose run app rake db:create

# rebuild
docker-compose run app bundle install
docker-compose up --build
