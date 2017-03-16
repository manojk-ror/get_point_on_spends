class CreateSpends < ActiveRecord::Migration[5.0]
  def change
    create_table :spends do |t|
      t.string :spend_for
      t.integer :spend_amount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
