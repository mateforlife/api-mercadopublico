# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# ENV['RAILS_ENV'] = "#{@pre_set_variables[:environment]}"

# env :PATH, ENV['PATH']

ENV['RAILS_ENV'] = 'development'
set :output, "/log/cron_log_#{ENV['RAILS_ENV']}.log"
every 1.day, at: '3:25 pm' do
  rake 'biddings:save_suggested'
end
