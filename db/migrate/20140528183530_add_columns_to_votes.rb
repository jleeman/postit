class AddColumnsToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :vote, :boolean
    add_column :votes, :user_id, :integer
    add_column :votes, :voteable_type, :string
    add_column :votes, :voteable_id, :integer
    add_column :votes, :created_at, :datetime
    add_column :votes, :updated_at, :datetime
  end
end
