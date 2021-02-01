DataMigrate.configure do |config|
  if Rails.env.production?
    config.data_migrations_path = "db/data/"
  else
    config.data_migrations_path = "db/data_development/"
  end
end
