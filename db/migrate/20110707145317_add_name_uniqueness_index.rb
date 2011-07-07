class AddNameUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :sites, :name, :unique => true
	add_index :sites, :url, :unique => true
  end

  def self.down
    remove_index :sites, :name
	remove_index :sites, :url
  end
end
