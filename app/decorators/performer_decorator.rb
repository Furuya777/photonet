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
    Settings.gender.male.name if object.gender == Settings.gender.male.id
    Settings.gender.female.name if object.gender == Settings.gender.female.id
  end
end
