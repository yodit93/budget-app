class CreateCategoryTransfers < ActiveRecord::Migration[7.0]
  def change
    create_table :category_transfers do |t|
      t.references :category, null: false, foreign_key: true
      t.references :transfer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
