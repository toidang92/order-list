class SearchForm
  include ActiveModel::Model

  attr_reader :email
  attr_reader :order

  validates_length_of :email, minimum: 3, message: 'Please enter at least 3 letters to search'

  def initialize(email)
  end

  def persisted?
    false
  end

  def build_query
  end
end
