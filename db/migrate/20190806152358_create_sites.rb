class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :domain, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
