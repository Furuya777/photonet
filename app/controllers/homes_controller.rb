class HomesController < FrontyardController
  def index
    @photos = Photo.all.order_created_at
  end
end
