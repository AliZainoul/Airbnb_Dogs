class Dog < ApplicationRecord
  has_many :strolls
  has_many :dogsitters, through: :strolls #Link between Dog and Dogsitters THROUGH Strolls
  belongs_to :city, optional: true
end
