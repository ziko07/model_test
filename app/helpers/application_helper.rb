module ApplicationHelper

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
  end

  def correct_answer(question, answer)
    question.correct_answer.to_s == answer.id.to_s
  end

  def chosen_answer(test_id, question, answer)
    question_set = question.question_sets.find_by_model_test_id(test_id)
    correct = correct_answer(question, answer)
    if question_set.present?
      if question_set.correct_answer.to_s == answer.id.to_s
        if correct
          return 'alert-info'
        else
          return 'alert-danger'
        end
      end
    end
    if correct
      'alert-success'
    end
  end

  def user_notification(current_user)
    message = ''
    if current_user.present?
      rejected_payment = current_user.rejected_payments
      if rejected_payment.present?
        message << "<div class='col-lg-8 col-lg-offset-2 alert alert-danger clearfix'> #{close_button('remove-rejected-payments',current_user.id)} Your have #{rejected_payment.count} payment rejected due to invalid transaction number </div>"
      end

      pending_payment = current_user.pending_payments
      if pending_payment.present?
        message << "<div class='col-lg-8 col-lg-offset-2 alert alert-warning clearfix' > #{close_button} Your have #{pending_payment.count} pending payment needs to admin approval </div>"
      end
      raw message << "<div class='clear-float'> </div>"
    end
  end

  def close_button(klass = '',id = '')
    "<button type='button' class='close #{klass}' data-user-id= #{id} data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
  end

  def model_test_link(user, subject)
    if user.present? && user.approved_payments
       url = start_test_path(subject.exam_id, subject.id)
    else
      url = new_payment_path
    end
    link_to url do
      raw "<h3> #{subject.title} </h3> <i> #{subject.description} </i> <br/> <i class='fa fa-arrow-circle-right'></i> Start Test Now "
    end
  end

  def payment_approved(user_id)
    @user = User.find_by_id(user_id)
    @payment = @user.payments.last
    if @payment.is_approved
      return true
    else
      false
    end
  end

end
