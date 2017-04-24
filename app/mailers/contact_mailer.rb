class ContactMailer < ApplicationMailer

  def contact(post)

    @post = post
    mail(to: 'contact@test.fr', subject: 'Sujet de test')

  end


end
