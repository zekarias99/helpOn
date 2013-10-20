desc "Import avatars from the user's gravatar_url"
  task :import_avatars => :environment do
  	puts "Importing avatars from gravatar"
  	User.get_gravatars
  	puts "Avatars updated"
  end