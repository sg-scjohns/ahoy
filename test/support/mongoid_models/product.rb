class Product
  include Mongoid::Document

  field :name, type: String

  visitable :ahoy_visit

  after_create :track_create

  def track_create
    Ahoy.instance.track("Created product", product_id: id)
  end
end
