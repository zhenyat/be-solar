################################################################################
# Model:  Product
#
# Attributes:
#   category_id     - FK
#   name            - name:            string,  not NULL, unique
#   title           - title:           string,  not NULL
#   code            - product code:    string,  not NULL, unique
#   unit            - Product Unit:    enum
#   vendor_code     - Vendor code:     string
#   vendor_price    - Vendor_price:    decimal, not NULL >= 0
#   price           - price:           decimal, not NULL >= 0
#   hot             - Action:          boolean
#   hot_price       - Action price:    decimal
#   quantity        - quantity:        integer, not NULL >= 0
#   abstract        - abstract:        text
#   position        - sorting index:   integer, not NULL
#   status          - status:          enum { active (0) | archived (1) }
#   url             - URL:             string
#   seo_title       - SEO title:       string
#   seo_description - SEO description: text
#   seo_keywords    - SEO keywords:    text
#
#  16.02.2021 ZT
################################################################################
class Product < ApplicationRecord
  include Positionable
  include ImagesHandleable
  include Positionable
  include ImagesHandleable
  has_rich_text :content
  belongs_to :category, required: true

  enum unit:   %w(шт. коробка упаковка кг. л.)
  # enum unit:   %w(pc. box packaging kg. l.)
  enum status: %w(active archived)

  validates :category,      presence: true
  validates :name,          presence: true, uniqueness: true
  validates :code,          presence: true, uniqueness: true
  validates :vendor_code,   presence: true
  validates :vendor_price,  presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price,         presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :hot_price,     presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity,      presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title,         presence: true
  validates :abstract,      presence: true
  validates :url,           presence: true
end
