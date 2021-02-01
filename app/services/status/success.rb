# app/services/status/success.rb
class Status::Success < Status::Reponse
  def success?
    true
  end

  def error?
    false
  end
end