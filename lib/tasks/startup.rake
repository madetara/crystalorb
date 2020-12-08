# frozen-string-literal: true

desc 'Performs migrations and starts server'

task startup: ['environment', 'db:migrate'] do
  sh %(bundle exec rails s)
end
