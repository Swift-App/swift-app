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

    mail(subject: "#{@user.name}が出発報告をしました")
  end

  def reservation(user)
    @user = user
    mail(to: @user.email, subject: 'Job reservation')
  end

  def job_confirmation(args)
    @user = args.fetch(:user)
    @job = args.fetch(:job)
    mail(subject: 'お仕事申し込み受付')
  end

  def report_completion(args)
    @user = args.fetch(:user)
    @completion_report_params = args.fetch(:completion_report_params)
    @job = Job.find(@completion_report_params.job_id)
    attachments.inline['photo.png'] = File.read(image_path(@completion_report_params[:photo]))

    mail(subject: "仕事終了報告")
  end

  def reservation_made(args)
    @reservation = args.fetch(:reservation)
    @user = args.fetch(:user)
    mail(subject: "#{@user.name}がお仕事予約しました")
  end
end
