module StatusService
  def self.included(cls)
    cls.extend StatusService
  end

  def success(agrs = {})
    Status::Success.new(agrs)
  end

  def error(agrs = {})
    Status::Error.new(agrs)
  end
end

# Base service class
class BaseService
  include StatusService

  def self.call(**args)
    new.call(**args)
  end
end
