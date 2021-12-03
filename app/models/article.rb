class Article < ApplicationRecord
    belongs_to :user
    # valdations this will stop an record from being inserted
    validates :title, presence: true, length: {minimum: 6, mazimum: 100}
    validates :description, presence: true, length: {minimum: 10, mazimum: 300}
end