class CreateSiteconfigs < ActiveRecord::Migration
  def self.up
    create_table :siteconfigs do |t|
      t.string :db
      t.string :status
      t.integer :site_id

      t.timestamps
    end
  end

  def self.down
    drop_table :siteconfigs
  end
end
