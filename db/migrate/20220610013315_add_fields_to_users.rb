class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :job_title, :string
    add_column :users, :location, :string
    add_column :users, :education, :string
    add_column :users, :law_firm, :string
    add_column :users, :bio, :text
    add_column :users, :twitter_handle, :string
    add_column :users, :linkedin_url, :string
  end
end
