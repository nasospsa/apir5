class AddUniqueKeyInTags < ActiveRecord::Migration[5.0]
  def change
  	add_index :tags, [:key], :unique => true
  end
end
