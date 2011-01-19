namespace :cron do

  desc "Sending mails...."
  task :send_tasks => :environment do
    puts "Sending mails...."
    UserMailer.tasks_list.deliver
    puts "end"
  end 

  desc "test Sending mails...."
  task :test_send_tasks => :environment do
    puts "Sending mails...."
    UserMailer.test_tasks_list.deliver
    puts "end"
  end 

end
