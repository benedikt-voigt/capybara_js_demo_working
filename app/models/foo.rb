class Foo < ApplicationRecord
  validates :name, uniqueness: true
end
