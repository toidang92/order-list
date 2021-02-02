class SearchForm
  include ActiveModel::Model

  DEFAULT_SORT = :created_at_desc

  SORT_MAPS = {
    created_at_desc: { created_at: :desc },
    created_at_asc: { created_at: :asc }
  }.freeze

  attr_accessor :email
  attr_accessor :status
  attr_accessor :sort
  attr_accessor :page

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def persisted?
    false
  end

  def sort_query
    return SORT_MAPS[DEFAULT_SORT] unless sort
    SORT_MAPS[sort.to_sym] || SORT_MAPS[DEFAULT_SORT]
  end

  def page
    @page || 1
  end
end
