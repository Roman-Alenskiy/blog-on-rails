class Author < ApplicationRecord
	has_many :articles
	authenticates_with_sorcery!
	validates_confirmation_of :password, message: "should match password", if: :password
	validates :email, presence: {message: "can't be empty"}, uniqueness: {message: "must be uniq"}
	validates :username, length: {in: 3..20, message: "must be from 3 to 20 symbols"}, uniqueness: {message: "must be uniq"}
	validates :password, length: {in: 3..20, message: "must be from 3 to 20 symbols"}
end
