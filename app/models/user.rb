class User < ApplicationRecord
  validate :start_end_check
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :title, length: { in: 1..20 }
  validates :memo, length: { in: 0..500 }


  def start_end_check
    if start_date > end_date
    errors.add(:end_date, "は開始日以降の日付で登録してください")
    end
  end
end