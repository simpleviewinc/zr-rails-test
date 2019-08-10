namespace :db do
  namespace :build do
    desc "Create Relationship for User and Pages"
    task :create_relationship => :environment do
        Site.all.each do |site|
          @user_id = site.user_id
          puts @user_id
            site.pages.each do |page|
              page.update_columns(user_id: @user_id)
            end
          end
      end
      end
    end
