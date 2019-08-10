class AddUserToPage < ActiveRecord::Migration[5.2]
  def change
    add_reference :pages, :user, foreign_key: true
    Rake::Task['db:build:create_relationship'].invoke
  end
end
