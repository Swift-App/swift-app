class UserMailer < ApplicationMailer
  
  default from: 'info@swift-staff.jp'
  default to: "info@info-swift.sakura.ne.jp"  

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
end
