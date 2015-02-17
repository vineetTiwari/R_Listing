class RenameOldTableToNewTable < ActiveRecord::Migration
   def self.up
    rename_table :listing, :listings
  end 
  def self.down
    rename_table :listings, :listing
  end
end
