class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait?

  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def is_clickbait?
    if CLICKBAIT_PATTERNS.none? { |str| str.match(self.title)  }
      errors.add(:title, "must be clickbait")
    end
  end

  # def is_clickbait?
  #   array = ["Won't Believe", "Secret", "Top", "Guess"]
  #   if array.none? {|str| self.title.include?(str)}
  #     byebug
  #     errors.add(:title, "must be clickbait")
  #   end
  # end

end
