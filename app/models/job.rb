class Job < ApplicationRecord
  validates :title, :description, :pay_amount, :job_type, :content, :location, :nearest_station,
            :number_of_positions, :work_date, :hours, :holidays, :certifications_and_experience,
            :benefits, :employment_type, :person_in_charge, :remarks, :branch_in_charge,
            :pay_range, :area, :shift_category, :duration, :category, presence: true

  has_many :completion_reports
  has_many :attendence_reports
  has_many :completion_reports

  AREAS = %w(関西エリア 中部エリア 関東エリア)

  SHIFT_CATEGORIES = %w(平日勤務 週末勤務 シフト勤務 自由勤務)

  DURATIONS = %w(短期（１日〜２か月） 中期（２〜６か月） 長期（６か月〜）)

  CATEGORIES = %w(イベント・キャンペーン系 物流・軽作業系 製造系 引越・梱包系 配送・引越助手系 飲食店フード系 販売・接客系 オフィス系)

  JOB_TYPE = %w(正社員募集 転職支援 紹介予定派遣)
end
