require 'rubygems'
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

scheduler.cron '0 22 * * 1-5' do
  # every day of the week at 22:00 (10pm)
  UserMailer.tasks_list.deliver
end

