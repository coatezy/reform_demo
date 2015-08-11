require "reform/form/coercion"

class PostForm < Reform::Form
  include ActiveModel::ModelReflections
  include Reform::Form::Coercion

  model :post

  properties :title, :body, validates: {presence: true} 
  property :category_ids, type: Array[Integer]

  validates :category_ids, length: {minimum: 2, message: 'Select at least two categories'}

  def category_ids=(value)
    super value.select(&:present?)
  end
end
