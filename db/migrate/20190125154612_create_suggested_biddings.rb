class CreateSuggestedBiddings < ActiveRecord::Migration[5.2]
  def change
    create_table :suggested_biddings do |t|
      t.json :data

      t.timestamps
    end
  end
end
