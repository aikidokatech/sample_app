source 'https://rubygems.org'

gem 'rails', '3.2.1'
gem 'gravatar_image_tag', '1.0.0.pre2'
gem 'will_paginate'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Heroku Cedar stack cannot do sqlite3
group :development do
  gem 'sqlite3'
  gem 'rspec-rails'
# This annotate is necessarty to fix "undefinded method 'namespace'" error in databases.rake
  gem 'annotate', :git => 'git://github.com/jeremyolliver/annotate_models.git', :branch => 'rake_compatibility'
  gem 'faker'
end

group :test do
  gem 'rspec-rails'
  gem 'webrat'
  gem 'factory_girl_rails', '1.0'
end

gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :production do
  # Heroku specific gems
  gem "pg"
end
