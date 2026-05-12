(local lapis (require :lapis))
(local db (require :lapis.db))
(require :lapis.features.etlua)

(local app (lapis.Application))
(set app.layout (require :views.layout))

(app:get "/" (fn [self]
  {:render :index}))

(app:get "/categories/:slug" (fn [self]
  (let [category (. (db.query "SELECT * FROM categories WHERE slug = ?" self.params.slug) 1)
        posts    (db.query "SELECT * FROM posts WHERE category_id = ?" category.id)]
    (set self.category category)
    (set self.posts posts))
  {:render :category}))

app
