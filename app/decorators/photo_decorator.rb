class PhotoDecorator < Draper::Decorator
  delegate_all

  def image_url(version = nil)
    if version.nil?
      object.image.url.gsub(/(\/public)/, '')
    else
      object.image.url(version).gsub(/(\/public)/, '')
    end
  end
end