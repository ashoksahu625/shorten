class CreateShortens < ActiveRecord::Migration[5.2]
  def change
    create_table :shortens do |t|
      t.string :slug
      t.string :url
      t.integer :use_count, null: false, default: 0
      t.datetime :expires_at
      t.timestamps
    end
  end
end
