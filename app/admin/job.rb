ActiveAdmin.register Job do


  permit_params :title, :description, :pay_amount, :job_type, :content, :location, 
                :nearest_station, 
                :number_of_positions, :work_date, :hours, :holidays, 
                :certifications_and_experience, 
                :benefits, :employment_type, :person_in_charge, :remarks, :branch_in_charge, 
                :pay_range, :area, :shift_category, :duration, :category

  index do 
    column :id
    column :title do |job|
      link_to job.title, [:admin,job]
    end
    column :description
    column :job_type
  end

  form do |f|
    f.inputs "お仕事登録" do    
      f.input :title, placeholder: '【有料職業紹介】ネットワークエンジニア■ネットワークの運用・保守業務のお仕事をしていただきます。'
      f.input :description, placeholder: '職歴、経験、資格、新卒・既卒は一切関係ございません。
将来のために
「資格をとりたい方」
「手に職をつけたい方」
「ネットワークエンジニアのキャリアを積みたい方」
「IT業界で働きたい方」

にはおすすめの求人となります。

こちらの会社では、IT業界で働くために確実なネットワークスキルをつけるために
CCNA（Cisco Certified Network Associate）の取得をしてもらっていますが、
その資格取得にかかる一切の学費は無料で受講することが可能です。'
      f.input :pay_amount, placeholder: '200000円／月収'
      f.input :pay_range, placeholder: '月給20万円以上'
      f.input :area, as: :select, collection: Job::AREAS
      f.input :shift_category, as: :select, collection: Job::SHIFT_CATEGORIES
      f.input :duration, as: :select, collection: Job::DURATIONS
      f.input :category, as: :select, collection: Job::CATEGORIES
      f.input :job_type, as: :select, collection: Job::JOB_TYPE
      f.input :content, placeholder: '※HPやサイトにキレイな物件の写真が載っていることも、お客様が「部屋を見てみたい」と思える重要なポイント。「ここのお部屋イイ！」と思ったら、写真の撮り方を工夫してみたり、興味を惹くようなアピールポイントを書いてみたり…。クリエイティブな楽しさも味わえます！'
      f.input :location, placeholder: '渋谷'
      f.input :nearest_station, placeholder: 'JR渋谷駅'
      f.input :number_of_positions, placeholder: '10人'
      f.input :work_date, placeholder: '平日（月〜金）'
      f.input :hours, placeholder: '10：00～19：00（休憩60分）'
      f.input :holidays, placeholder: 'シフトによる'
      f.input :certifications_and_experience, placeholder: '学歴不問 未経験者歓迎　 普通自動車免許'
      f.input :benefits, placeholder: '【保険】
　雇用、労災、健康、厚生年金保険'
      f.input :person_in_charge, placeholder: '東京支店　担当：鈴木 000-000-0000'
      f.input :remarks, placeholder: '【想定年収】350万円～
　※ご経験、前年収、ご年齢に応じて決定します。

【月収例】
　大卒　　　：220,000円+インセンティブ
　専門学校卒：220,000円+インセンティブ
'
    end
    f.actions
  end



end
