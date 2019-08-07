class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :name, null: false
      t.string :path, null: false
      t.string :header, null: false
      t.string :body, null: false
      t.string :photo, null: false
      t.references :site, null: false

      t.timestamps
    end
  end
end
