class Campaign < ApplicationRecord
  has_many :rewards, dependent: :destroy

  #this gives us the possibility of creating rewards at the same time we create a campaign. By passing a special key called: rewards_attributes
  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true
  validates :title, presence: true, uniqueness: true

  def titleized_title
    title.titleize
  end

end
