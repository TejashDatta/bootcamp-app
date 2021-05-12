# setup
docker-compose run --no-deps app rails new . \
  --force \
  --database=postgresql \
  --skip-action-mailer \
  --skip-action-mailbox \
  --skip-action-text \
  --skip-active-storage \
  --skip-action-cable

sudo chown -R $USER:$USER .
docker-compose build
docker-compose up
docker-compose run app rails db:create

# rebuild
docker-compose run app bundle install
docker-compose up --build

# common commands
docker-compose up
docker-compose run app COMMAND
