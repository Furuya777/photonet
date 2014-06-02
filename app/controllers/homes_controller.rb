class HomesController < FrontyardController
  def index
    @recommends = Recommend.all
    @photos = Photo.all.order_created_at
  end
end
