class CreateRelationships < ActiveRecord::Migration
  def self.up
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
  end

  def self.down
    remove_index :relationships, :followed_id
    remove_index :relationships, :follower_id
    drop_table :relationships
  end
end