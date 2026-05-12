(local db (require :lapis.db))

(fn any-rows? [query]
    (> (tonumber (. (. (db.query query) 1) :count)) 0))

;; insert category if it doesn't exist
(when (not (any-rows? "SELECT count(*) FROM categories WHERE slug = 'photography'"))
  (db.insert :categories {:name "Photography" :slug "photography"}))

;; insert post with category id
(when (not (any-rows? "SELECT count(*) FROM posts WHERE title = 'Photography is the art of frozen time.'"))
    (let [category (. (db.query "SELECT * FROM categories WHERE slug = 'photography'") 1)]
      (db.insert :posts
        {:category_id category.id
         :title "Photography is the art of frozen time."
         :body  "This is my first post !!"
         :image_url ""
         :created_at (os.date "!%Y-%m-%d %H:%M:%S")
         :updated_at (os.date "!%Y-%m-%d %H:%M:%S")})))


