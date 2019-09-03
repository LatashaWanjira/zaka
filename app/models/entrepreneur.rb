# frozen_string_literal: true

class Entrepreneur < ApplicationRecord
  has_many :investments
  has_many :investors, through: :investments
  has_many_attached :images
end
