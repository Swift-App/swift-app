class UserMailer < ApplicationMailer
  default from: 'notifications@swift.com'
  default to: "notifications@swift.com"
  # default to: Proc.new {AdminUser.pluck(:email)};

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Swift')
  end

  def reservation(user)
    @user = user
    mail(to: @user.email, subject: 'Job reservation')
  end

  def job_confirmation(user)
    @user = user
    mail(to: @user.email, subject: 'Job confirmation')
  end

  def report_completion(args)
    @user = args.fetch(:user)
    @completion_report_params = args.fetch(:completion_report_params)
    @job = job.find(@completion_report_params.job_id)
    attachments.inline['photo.png'] = File.read(image_path(@completion_report_params[:photo]))
    mail(to: @user.email, subject: "Completion of report")
  end

  def reservation_made(args)
    @form_params = args.fetch(:params)
    @user = args.fetch(:user)
    mail(subject: "Reservation made by #{@user.email}")
  end
end
