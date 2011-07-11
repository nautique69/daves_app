class AddFieldsToSiteconfig < ActiveRecord::Migration
  def self.up
    add_column :siteconfigs, :dbtype, :string
    add_column :siteconfigs, :username, :string
    add_column :siteconfigs, :password, :string
  end

  def self.down
    remove_column :siteconfigs, :password
    remove_column :siteconfigs, :username
    remove_column :siteconfigs, :dbtype
  end
end
