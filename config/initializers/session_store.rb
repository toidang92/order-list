# Be sure to restart your server when you modify this file.

Rails.application.config.session_store  :redis_store,
                                        servers: ENV['REDIS_SESSION_URL'],
                                        expire_after: 30.days,
                                        key: "_cv_session",
                                        secure: Rails.env.production?
