class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :title
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :forum, null: false, foreign_key: true

      t.timestamps
    end
  end
end
