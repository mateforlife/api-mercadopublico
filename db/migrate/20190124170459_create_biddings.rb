class CreateBiddings < ActiveRecord::Migration[5.2]
  def change
    create_table :biddings do |t|
      t.string :external_code
      t.string :name
      t.integer :state
      t.date :deadline

      t.timestamps
    end
  end
end
