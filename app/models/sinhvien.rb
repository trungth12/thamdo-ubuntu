class Sinhvien < ActiveRecord::Base
  #attr_accessible :bomon, :giangvien, :ip_source, :malop, :mamon, :masinhvien, :survey_id, :tenmon, :vote_date

  validates_presence_of :bomon, :giangvien, :malop, :masinhvien
  belongs_to :survey
  has_many :questions, :through => :survey, :dependent => :destroy
  delegate :activated, :to => :survey

  validates :survey, presence: true

  scope :by_survey, lambda { |sid|
  	joins(:survey).where('survey_id = ? and surveys.activated = true', sid)
  }
  
  scope :by_masinhvien, lambda { |msv|
  	where('lower(masinhvien) = ?', msv.downcase)
  }
  has_many :ketquas, :dependent => :destroy

  scope :by_voted, -> { where("ip_source IS NULL or CAST(ip_source as text) = ''") }
  def voted?
  	return (ip_source != nil and ip_source.length > 0)
  end
  def update_voted!(current_ip)
     self.vote_date = DateTime.now
      self.ip_source = current_ip.to_s    
      self.save!
  end
  
  def to_s
    "#{self.masinhvien} - #{self.survey} - #{self.giangvien} - #{self.tenmon}"
  end
end
