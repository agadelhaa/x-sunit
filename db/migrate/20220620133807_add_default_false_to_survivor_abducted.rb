class AddDefaultFalseToSurvivorAbducted < ActiveRecord::Migration[7.0]
  def up
    change_column_default :survivors, :abducted, false
  end

  def down
    change_column_default :survivors, :abducted, nil
  end
end
