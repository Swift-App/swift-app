class Job < ApplicationRecord  
  include Filterable
  mount_uploader :photo, JobPhotoUploader

  validates :title, :description, :pay_amount, :job_type, :content, :location, :nearest_station,
            :number_of_positions, :work_date, :hours, :holidays, :person_in_charge, :pay_range, :area, :shift_category, :duration, :category, presence: true

  default_scope { order('created_at DESC') }

  scope :job_type, -> (job_type) { where job_type: job_type }
  scope :area, -> (area) { where area: area }
  scope :duration, -> (duration) { where duration: duration }
  scope :shift_category, -> (shift_category) { where shift_category: shift_category }
  scope :categories, -> (categories) { where categories: categories }
  scope :pay_range, -> (pay_range) { where pay_range: pay_range }

  AREAS = %w(名古屋市 愛知県北部 愛知県西部 愛知県東部 岐阜県 三重県)

  SHIFT_CATEGORIES = %w(平日勤務 週末勤務 シフト勤務 自由勤務)

  DURATIONS = %w(短期（1日~2か月） 中期（2~6か月） 長期（6か月~）)

  MERITS = %w(駅チカ 未経験歓迎 シフト自由 土日・週末のみOK 夜勤 交通費支給)

  CATEGORIES = %w(イベント系 物流・軽作業系 製造・ライン作業 引越・梱包系 販売・接客系 オフィスワーク その他)

  JOB_TYPE = %w(正社員募集 転職支援 紹介予定派遣)

  PAY_RANGE = %w(時給800円以上 時給900円以上 時給1000円以上 日給7000円以上 日給8000円以上 日給9000円以上 月給10万円以上 月給15万円以上 月給20万円以上 月給25万円以上 日給10000円以上)
end
