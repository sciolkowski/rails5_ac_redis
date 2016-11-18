class Mailer < ActionMailer::Base
  default from: 'noreply@magnumservice.pl'
  layout 'mailer'

  # def user_contact (params = {})
  #   setup_email(params[:email])
  #   @subject += "- wiadomość od użytkownika"
  #   @to       = admin_emails
  #   @from     = params[:email]
  #   @message  = params[:message]
  #   @firstname = params[:firstname]
  #   @lastname = params[:lastname]
  #   send_mail
  # end

  private
  def setup_email(email)
    @subject = "[Magnum Service] "
    @to      = email.nil? ? "Magnum Service <noreply@magnumservice.pl>" : "#{email}"
    @from    = "Magnum Service <noreply@magnumservice.pl>"
    @sent_on = Time.now
    headers 'Return-Path' => "noreply@magnumservice.pl"
  end

  def send_mail(options = {})
    options[:subject] ||= @subject
    options[:from] ||= @from
    options[:bcc] ||= @bcc
    options[:to] ||= @to
    options[:cc] ||= @cc
    mail options
  end

  def admin_emails
    Admin.all.map(&:email).join(', ')
  end
end
