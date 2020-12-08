# frozen-string-literal: true

namespace :docker do
  desc 'Builds production image'

  task build: :environment do
    sh %(docker build -t crystalorb .)
  end

  desc 'Starts production image linked with local db (local_db:start)'

  task run: ['environment', 'docker:build'] do
    # rubocop:disable Layout/LineLength
    sh %(docker run --rm -it --name crystalorb -p 3000:3000 \
            -e DB_PASSWORD=crystalorb \
            -e DB_NAME=crystalorb_dev \
            -e DB_USER=crystalorb \
            -e DB_HOST=crystalorb-pg \
            -e DB_PORT=5432 \
            -e HOSTNAME="localhost:3000" \
            -e SECRET_KEY_BASE="1e040e81b640752aaa34f847245857994eda63a0aa5c73c2ca47e01cd21e31d5375beba66fe36e75eec2a385bc3f8b5ce50234bf4bf8d5f39438aae8a995c496" \
            --link crystalorb-pg:crystalorb-pg \
            crystalorb)
    # rubocop:enable Layout/LineLength
  end
end
