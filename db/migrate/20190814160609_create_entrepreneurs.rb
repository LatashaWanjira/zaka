class CreateEntrepreneurs < ActiveRecord::Migration[5.2]
  def change
    create_table :entrepreneurs do |t|
      t.string :business_name
      t.string :entrepreneur_name
      t.integer :amount_sought

      t.timestamps
    end
  end
end
