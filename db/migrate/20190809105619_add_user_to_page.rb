class AddUserToPage < ActiveRecord::Migration[5.2]
  def change
    add_reference :pages, :user, foreign_key: true
    #Below triggers a rake task located in the lib directory to create missing user relationships with pages
    Rake::Task['db:build:create_relationship'].invoke
  end
end
