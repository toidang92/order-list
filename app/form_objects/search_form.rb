class SearchForm
  include ActiveModel::Model

  ORDER_MAPS = {
    created_at_desc: { created_at: :desc },
    created_at_asc: { created_at: :asc },
  }.freeze

  attr_accessor :email
  attr_accessor :order
  attr_accessor :page

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def persisted?
    false
  end

  def order_query
    ORDER_MAPS[order]
  end

  def page
    @page || 1
  end
end
