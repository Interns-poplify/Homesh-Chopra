class AddColumsToArticle < ActiveRecord::Migration
  def change
  	  add_column :articles,:name,:string
  	  add_column :articles,:title,:string
  	  add_column :articles,:description,:text
  end
end
