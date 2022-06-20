class CreateAbductions < ActiveRecord::Migration[7.0]
  def change
    create_table :abductions do |t|
      t.integer :survivor_id
      t.integer :abducted_id

      t.timestamps
    end
  end
end
