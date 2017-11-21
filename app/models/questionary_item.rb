class QuestionaryItem < ApplicationRecord
	belongs_to :questionary
    has_many :questionary_choice

    validates :content, presence: {message:'は、必須項目です。 '}
end
