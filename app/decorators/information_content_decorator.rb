class InformationContentDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def information_area_string
    case object.information_area
    when Settings.information_content.upper.area
      Settings.information_content.upper.name
    when Settings.information_content.middle.area
      Settings.information_content.middle.name 
    when Settings.information_content.lower.area
      Settings.information_content.lower.name
    end
  end

  def nl2br
    object.content.gsub(/\r\n|\r|\n/, "<br />")
  end

end
