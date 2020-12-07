# frozen-string-literal: true

desc 'Starts up local postgres in docker'

namespace :local_db do
  task start: :environment do
    sh %(docker run --name crystalorb-pg -d --rm -p 5432:5432 --env POSTGRES_PASSWORD=crystalorb \
      --env POSTGRES_USER=crystalorb --env POSTGRES_DB=crystalorb_dev postgres:13.1-alpine)
  end

  task stop: :environment do
    sh %(docker stop crystalorb-pg)
  end
end
