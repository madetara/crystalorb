# frozen-string-literal: true

desc 'Performs migrations and starts server'

task startup: ['environment', 'db:migrate', 'assets:precompile'] do
  sh %(bundle exec rails s -b 0.0.0.0)
end
