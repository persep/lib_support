# LibSupport

simple list models

requires:

* postgres with **unaccent** and **pg_trgm** extensions 
* generated views are based on bootstrap and haml 

# How to cook it

## migrations

first, you should create base object table
```ruby
class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    object_table_create
    ...
```    

then table for model with indexed_columns
```ruby
    object_ref_create(:users, :indexed_columns => [:email, :name]) do |t|
      t.string :name, :limit => 255, :null => false, index: true
````      


# TODO

* documentation...
* remove bootstrap from views
* remove haml from views
