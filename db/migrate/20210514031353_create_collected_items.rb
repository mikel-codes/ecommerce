class CreateCollectedItems < ActiveRecord::Migration[6.0]
  def change
    create_table :collected_items do |t|
      t.references :product, null: false, foreign_key: true
      t.belongs_to :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
