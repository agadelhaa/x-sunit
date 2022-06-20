class CreateSurvivors < ActiveRecord::Migration[7.0]
  def change
    create_table :survivors do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :location
      t.boolean :abducted

      t.timestamps
    end
  end
end
