class SearchForm
  include ActiveModel::Model

  attr_accessor :email

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def persisted?
    false
  end
end
