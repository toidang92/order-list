# app/services/status/error.rb
class Status::Error < Status::Reponse
  def success?
    false
  end

  def error?
    true
  end
end