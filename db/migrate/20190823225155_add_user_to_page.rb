class AddUserToPage < ActiveRecord::Migration[5.2]
  def change
    add_reference :pages, :user, foreign_key: true
    Rake::Task['migrate:add_users_to_pages'].invoke
  end
end
