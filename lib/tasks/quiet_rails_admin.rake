# Rails Admin (as of Tue Jan 8 21:18:38 2013) prints out an annoying
# message every time you run tests:
## [RailsAdmin] RailsAdmin initialization disabled by default. Pass SKIP_RAILS_ADMIN_INITIALIZER=false if you need it.
# This kludge task makes it quiet.
# http://www.dan-manges.com/blog/modifying-rake-tasks

task :quiet_rails_admin do
  ENV["SKIP_RAILS_ADMIN_INITIALIZER"] = "true"
end
Rake::Task[:test].enhance [:quiet_rails_admin]
