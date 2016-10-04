class UserMailer < ApplicationMailer
  default from: 'notifications@swift.com'

  def welcome_email(user)
    mail(to: @user.email, subject: 'Welcome to Swift')
  end

  def reservation

  end

  def job_confirmation

  end

  def report_completion(completion_report_params,user)
    @user = user
    @completion_report_params = completion_report_params
    @job = job.find(@completion_report_params.job_id)
    attachments.inline['photo.png'] = File.read(image_path(@completion_report_params[:photo]))
    mail(to: @user.email, subject: "Completion of report")
  end 
end
