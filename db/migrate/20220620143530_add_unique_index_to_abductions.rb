class AddUniqueIndexToAbductions < ActiveRecord::Migration[7.0]
  def change
    add_index :abductions, [:survivor_id, :abducted_id], unique: true
  end
end
