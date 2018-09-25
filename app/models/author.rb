class Author < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :phone_number, length: { is: 10 }

end



  # def title_contains_click_bait
  #   if self.title && ["Won't Believe", "Secret", "Top", "Guess"].none? { |phrase| self.title.include?(phrase) }
  #     errors.add(:title, "Title must contain a click baity word!")
  #   end
  # end
