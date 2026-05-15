(local lapis (require :lapis))
(local Categories (require :models.categories))
(local Posts (require :models.posts))
(local {: calendar} (require :calendar))
(require :lapis.features.etlua)
;; (local db (require :lapis.db))
(local app (lapis.Application))
(set app.layout (require :views.layout))

(app:get "/" (fn [self]
  {:render :index}))

(app:get "/categories/:slug" (fn [self]
  (let [category (Categories:find {:slug self.params.slug})
        posts    (Posts:select "WHERE category_id = ?" category.id)
        now (os.date "%Y-%m-%d" (os.time))        
        calendar (calendar 1 2)]
    (set self.category category)
    (set self.posts posts)
    (set self.now now)
    (set self.calendar calendar))
  {:render :category}))

app
