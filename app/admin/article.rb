ActiveAdmin.register Article do
  permit_params :category_id, :subcategory_id, :title, :description, :contact
end
