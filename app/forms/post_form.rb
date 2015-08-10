class PostForm < Reform::Form
  include ActiveModel::ModelReflections

  model :post

  properties :title, :body, validates: {presence: true} 
  property :category_ids

  validates :category_ids, length: {minimum: 2, message: 'Select at least two categories'}

  def category_ids=(value)
    super value.select(&:present?)
  end
end
