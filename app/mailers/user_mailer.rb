class UserMailer < ApplicationMailer
  
  default from: 'info@swift-staff.jp'
  default to: "info@info-swift.sakura.ne.jp"  


  def confirmation_email(args)
    @user = args.fetch(:user)

    mail(to: @user.email, subject: "スイフト登録完了")
  end

  def new_user_registration(args)
    @user = args.fetch(:user)

    csv = @user.to_csv

    attachments["#{@user.unique_id}_#{@user.name_katakana}.csv"] = csv

    mail(subject: "#{@user.unique_id} #{@user.name_katakana}が登録完了しました。")
  end

  def attendance_report(args)
    @user = args.fetch(:user)
    @attendance_report = args.fetch(:attendance_report)

    mail(subject: "#{@user.unique_id} #{@user.name_katakana} #{@attendance_report.report_type}")
  end

  def reservation(user)
    @user = user
    mail(to: @user.email, subject: "#{@user.unique_id} #{@user.name_katakana}　追加予約")
  end

  def job_confirmation(args)
    @user = args.fetch(:user)
    @confirmation = args.fetch(:confirmation) 
    mail(subject: 'お仕事申し込み受付')
  end

  def report_completion(args)
    @user = args.fetch(:user)
    @completion_report = args.fetch(:completion_report)
    @job_name = @completion_report.job_name

    attachments.inline['attachment.png'] = open(@completion_report.photo_url).read if @completion_report.photo.present?

    mail(subject: "#{@user.unique_id} #{@user.name_katakana} 終了報告")
  end

  def reservation_made(args)
    @reservation = args.fetch(:reservation)
    @user = args.fetch(:user)
    mail(subject: "#{@user.unique_id} #{@user.name_katakana}　追加予約")
  end

  def payment_reservation_made(args)
    @payment_reservation = args.fetch(:payment_reservation)
    @user = args.fetch(:user)
    mail(subject: "#{@user.unique_id} #{@user.name_katakana} 給与予約")
  end

  def new_weekly_payment_application(args)
    @user = args.fetch(:user)
    @application = args.fetch(:application)

    attachments.inline['attachment_1.png'] = open(@application.image_1_url).read
    attachments.inline['attachment_2.png'] = open(@application.image_2_url).read if @application.image_2.present?
    attachments.inline['attachment_3.png'] = open(@application.image_3_url).read if @application.image_3.present?
    attachments.inline['attachment_4.png'] = open(@application.image_4_url).read if @application.image_4.present?
    attachments.inline['attachment_5.png'] = open(@application.image_5_url).read if @application.image_5.present?
    
    mail(subject: "#{@user.unique_id} #{@user.name_katakana} 週払振込申請")
  end

  def new_bank_application(args)
    @user = args.fetch(:user)
    @application = args.fetch(:application)

    attachments.inline['attachment.png'] = open(@application.photo_url).read

    mail(subject: "#{@user.unique_id} #{@user.name_katakana} 振込口座申請")
  end

  def new_mynumber_declinal(args)
    @user = args.fetch(:user)
    @application = args.fetch(:application)

    mail(subject: "#{@user.unique_id} #{@user.name_katakana} マイナンバー提出拒否理由書提出")
  end

  def new_mynumber_application(args)
    @user = args.fetch(:user)
    @application = args.fetch(:application)

    attachments.inline['attachment_1.png'] = open(@application.photo_url).read

    mail(subject: "#{@user.unique_id} #{@user.name_katakana} マイナンバー提出")
  end

  def new_car_permit_application(args)
    @user = args.fetch(:user)
    @application = args.fetch(:application)

    attachments.inline['attachment_1.png'] = open(@application.license_url).read
    attachments.inline['attachment_2.png'] = open(@application.insurance_papers_url).read if @application.insurance_papers_url.present?
    attachments.inline['attachment_3.png'] = open(@application.inspection_certificate_url).read if @application.inspection_certificate_url.present?

    mail(subject: "#{@user.unique_id} #{@user.name_katakana} 車両通勤許可申請")
  end

  def new_quick_job_application(args)
    @user = args.fetch(:user)
    @application = args.fetch(:application)

    mail(subject: "#{@user.unique_id} #{@user.name_katakana} コード#{@application.code}の日ごとお仕事申込み")
  end
end
