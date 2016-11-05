class JobDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  def certifications_and_experience
    object.certifications_and_experience.empty? ? "無し" : object.certifications_and_experience
  end

  def benefits
    object.benefits.empty? ? "無し" : object.benefits
  end

  def remarks
    object.remarks.empty? ? "無し" : object.remarks
  end

end
