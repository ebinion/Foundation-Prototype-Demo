# If you have OpenSSL installed, we recommend updating
# the following line to use "https"
source 'http://rubygems.org'

ruby "2.0.0"

gem "middleman", "~>3.1.5"

# Live-reloading plugin
gem "middleman-livereload", "~> 3.1.0"

gem "middleman-autoprefixer", "~> 0.2.1"

# For faster file watcher updates on Windows:
gem "wdm", "~> 0.1.0", :platforms => [:mswin, :mingw]

# Cross-templating language block fix for Ruby 1.8
platforms :mri_18 do
  gem "ruby18_source_location"
end

# For Heroku deployment
gem "rack-contrib", "~> 1.1.0"
gem "puma", "~> 2.6.0"
