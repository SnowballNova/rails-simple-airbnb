class Flat < ApplicationRecord

  validates :picture_url, format: URI::regexp(%w[http https]), allow_blank: true
end
