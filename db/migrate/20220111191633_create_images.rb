class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :url
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
