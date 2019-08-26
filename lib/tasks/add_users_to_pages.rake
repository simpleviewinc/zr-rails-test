namespace :migrate do
  desc "Add Users to Pages"
  task add_users_to_pages: :environment do
    Site.all.each do |site|
      @user_id = site.user_id

      site.pages.each do |page|
        page.update_columns(user_id: @user_id)
      end
    end
  end
end