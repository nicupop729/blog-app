class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio

      t.timestamps
    end
    add_column :users, :posts_counter, :integer, :default => 0
  end
end
