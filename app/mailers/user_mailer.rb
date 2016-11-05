class UserMailer < ApplicationMailer
  default from: 'notifications@swift.com'
  default to: "notifications@swift.com"

  def welcome_email(user)
    # @user = user
    # mail(to: @user.email, subject: 'Welcome to Swift')
  end

  def attendance_report(args)
    @user = args.fetch(:user)
    @attendance_report = args.fetch(:attendance_report)

    mail(subject: "#{@user.name}から#{@attendance_report.report_type}がありました。")
  end

  def reservation(user)
    @user = user
    mail(to: @user.email, subject: "#{@user.name}　追加予約")
  end

  def job_confirmation(args)
    @user = args.fetch(:user)
    @job = args.fetch(:job)
    mail(subject: 'お仕事申し込み受付')
  end

  def report_completion(args)
    @user = args.fetch(:user)
    @completion_report = args.fetch(:completion_report)
    @job_name = @completion_report.job_name
    attachments.inline['attachment.png'] = File.read(image_path(@completion_report.photo))

    mail(subject: "<%= @user.name %>「終了報告」")
  end

  def reservation_made(args)
    @reservation = args.fetch(:reservation)
    @user = args.fetch(:user)
    mail(subject: "#{@user.name}　追加予約")
  end

  def payment_reservation_made(args)
    @payment_reservation = args.fetch(:payment_reservation)
    @user = args.fetch(:user)
    mail(subject: "#{@user.name} 給与予約")
  end
end
