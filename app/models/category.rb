################################################################################
# Model:  Category
#
# Purpose: Categories of product with a tree
#
# Category attributes:
#   name            - name:           string,  not NULL, unique
#   title           - title:          string,  not NULL
#   abstract        - abstract:       text
#   position        - sorting index:  integer, not NULL
#   status          - status:         enum { active (0) | archived (1) }
#   url             - url:  string
#   seo_title       - seo_title:  string
#   seo_description - seo_description:  text
#   seo_keywords    - seo_keywords:  text
#
#  05.02.2021 ZT
################################################################################
class Category < ApplicationRecord
  include Positionable
  include ImagesHandleable
  include Heritable

  enum status: %w(active archived)

  validates :name,     presence: true, uniqueness: true
  validates :title,    presence: true
  validates :abstract, presence: true
  validates :url,      presence: true
end
