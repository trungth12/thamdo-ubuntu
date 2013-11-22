class Question < ActiveRecord::Base
  attr_accessible :question_text, :question_type_id, :required, :survey_id, :display_order

  validates_presence_of :question_text

  belongs_to :question_type
  belongs_to :survey
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers, :reject_if => :all_blank

  validates :question_type, presence: true
  validates :survey, presence: true

  after_create :create_default_answer

  default_scope order('display_order ASC')  

  def to_s
  	"#{self.question_text}"
  end
  def is_radio?
    question_type_id == 1
  end

  protected

  def create_default_answer
  	if self.question_type_id == 2 then
  		Answer.create!(:question_id => self.id, :answer_text => "", :display_order => 1, :score_point => 0)
  	end
  end

end
