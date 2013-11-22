class Answer < ActiveRecord::Base
  attr_accessible  :answer_text, :question_id, :score_point, :display_order


  belongs_to :question
  delegate :survey, :to => :question
  has_many :ketquas, :dependent => :destroy
  validates :question, presence: true
  def to_s
  	"#{self.answer_text}"
  end
  
  
  
end
