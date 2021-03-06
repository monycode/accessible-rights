class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_answer.subject
  #
  def new_answer
    @answer = params[:answer]
    make_bootstrap_mail(to: @answer.question.user.email, subject: 'Your Question has been answered')
    # This will render a view in `app/views/user_mailer`!
  end
end
