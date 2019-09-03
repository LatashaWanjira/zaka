class AddDetailsToInvestors < ActiveRecord::Migration[5.2]
  def change
    add_column :investors, :first_name, :string
    add_column :investors, :last_name, :string
    add_column :investors, :username, :string
  end
end
