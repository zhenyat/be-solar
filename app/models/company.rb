################################################################################
# Model:  Company
#
# Purpose:
#
# Company attributes:
#   name              - name:           string,  not NULL, unique
#   title             - title:          string,  not NULL
#   email             - email:          string,  not NULL, unique
#   phone             - phone:          string
#   address           - address:        string
#   url               - url:            string
#   position          - sorting index:  integer, not NULL
#   status            - status:         enum { active (0) | archived (1) }
#   seo_title         - seo_title:      string
#   seo_description   - seo_description:  text
#   seo_keywords      - seo_keywords:     text
#
#  31.12.2020 ZT
################################################################################
class Company < ApplicationRecord
  include Emailable
  include ImagesHandleable
  has_rich_text :content
  
  enum status: %w(active archived)

  validates :name,      presence: true, uniqueness: true
  validates :title,     presence: true
  validates :phone,     presence: true
  validates :url,       presence: true
  validates :seo_title, presence: true, uniqueness: true
end
