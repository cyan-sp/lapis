(local schema (require :lapis.db.schema))
(local {: types} schema)

{1 (fn []
     (schema.create_table :categories
       [[:id types.serial]
        [:name types.varchar]
        [:slug types.varchar]
        "PRIMARY KEY (id)"]))

 2 (fn []
     (schema.create_table :posts
       [[:id types.serial]
        [:category_id types.foreign_key]
        [:title types.varchar]
        [:body types.text]
        [:image_url types.varchar]
        [:created_at types.time]
        [:updated_at types.time]
        "PRIMARY KEY (id)"]))
 }

