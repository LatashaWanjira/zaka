class CreateInvestments < ActiveRecord::Migration[5.2]
  def change
    create_table :investments do |t|
      t.integer :invested_amount
      t.references :investor, foreign_key: true
      t.references :entrepreneur, foreign_key: true

      t.timestamps
    end
  end
end
