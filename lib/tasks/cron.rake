namespace :cron do

  desc "Sending mails...."
  task :send_tasks => :environment do
    puts "Sending mails...."
    begin
      UserMailer.tasks_list.deliver
    rescue Exception => e
      puts e.message
    end
    puts "end"
  end 

  desc "test Sending mails...."
  task :test_send_tasks => :environment do
    puts "Sending mails...."
    begin
      UserMailer.test_tasks_list.deliver
    rescue Exception => e
      puts e.message
    end
    puts "end"
  end 

end
