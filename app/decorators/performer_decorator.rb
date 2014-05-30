class PerformerDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def gender_string
    case object.gender
    when Settings.gender.male.id
      Settings.gender.male.name
    when Settings.gender.female.id
      Settings.gender.female.name
    end
  end
end
