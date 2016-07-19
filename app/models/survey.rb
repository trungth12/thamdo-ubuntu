class Survey < ActiveRecord::Base
 # attr_accessible :close_date, :open_date, :title, :activated

  validates_presence_of :title, :open_date, :close_date

  has_many :questions, :dependent => :destroy
  has_many :sinhviens, :dependent => :destroy
  

  scope :by_activated, -> { where(:activated => true)}
  def to_s
  	"#{self.title}"
  end
  def has_questions?
    self.questions.size > 0
  end
  def is_voted?(user)
  	svs = Sinhvien.by_masinhvien(user.masinhvien).by_survey(self.id).by_voted  	
  	return svs.empty?
  end
end
