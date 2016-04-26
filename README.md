# LibSupport

simple list of models

requires:

* postgres with **unaccent** and **pg_trgm** extensions 
* generated views are based on bootstrap and haml 

# How to cook it

as an example I used standard app containing model Posts

## migrations

create base object table
```ruby
class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    object_table_create
    ...
```    

create a table for Posts
```ruby
    object_ref_create(:users, :indexed_columns => [:title, :descr]) do |t|
      t.string :name, :limit => 255, :null => false, index: true
````      

table 'posts' is inherited from table 'objects', so you can search among objects:
```sql
select * from objects where txt_index @@ plainto_tsquery(unaccent($$test$$))
```

## models

our model Post should include module BaseObject
```ruby
class Post < ApplicationRecord
  include LibSupport::BaseObject
  ...
```



# TODO

* documentation...
* remove bootstrap from views
* remove haml from views
