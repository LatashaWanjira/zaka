# frozen_string_literal: true

class AddEntrepreneurDetailsToEntrepreneur < ActiveRecord::Migration[5.2]
  def change
    add_column :entrepreneurs, :business_summary, :string
    add_column :entrepreneurs, :funding_purpose, :string
    add_column :entrepreneurs, :location, :string
  end
end
