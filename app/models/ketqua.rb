class Ketqua < ActiveRecord::Base
  attr_accessible :answer_id, :answer_text, :sinhvien_id

  belongs_to :answer
  belongs_to :sinhvien

  validates :answer, presence: true, :allow_nil => false
  validates :sinhvien, presence: true, :allow_nil => false
end
