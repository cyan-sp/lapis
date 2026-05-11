(local lapis (require :lapis))
(local {: respond_to} (require :lapis.application))
(require :lapis.features.etlua)

(local app (lapis.Application))
(set app.layout (require :views.layout))

(app:get "/" (fn [self]
  {:render :index}))

(app:get "/greet/:name" (fn [self]
  {:render false
   :json {:message (.. "Hello, " self.params.name "!")}}))

(app:match "/form" (respond_to
  {:GET  (fn [self] "
    <form method='POST' action='/form'>
      <input name='msg' placeholder='message' />
      <button>Send</button>
    </form>")
   :POST (fn [self]
     (.. "You said: " self.params.msg))}))

app
