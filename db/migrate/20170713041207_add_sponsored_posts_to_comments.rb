class AddSponsoredPostsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :sponsored_post_id, :integer
    add_index :comments, :sponsored_post_id
  end
end
