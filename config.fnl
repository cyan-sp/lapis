(local config (require :lapis.config))

(config.config :development
  {:port 8080
   :num_workers 1
   :postgres {:host "127.0.0.1"
              :port 5432
              :database "lapis"
              :user "cyan"
              :password "toast"}})
