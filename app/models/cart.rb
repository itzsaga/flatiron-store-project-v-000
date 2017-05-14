class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    items.map(&:price).sum
  end

  def add_item(itemid)
    item = line_items.find_by(item_id: itemid)
    if line_items.include?(item)
      item.quantity + 1
      item
    else
      line_items.new(item_id: itemid)
    end
  end
end
