class CreateRollovers < ActiveRecord::Migration[5.2]
  def change
    create_table :rollovers do |t|
      t.string :rollover_id
      t.string :rollover_type
      t.string :origin_bank
      t.string :destination_bank
      t.string :integer
  end
 end
end
