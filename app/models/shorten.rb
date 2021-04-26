class Shorten < ApplicationRecord
	validates_presence_of :url  
  validates :url, format: URI::regexp(%w[http https])
  
  # auto slug generation
  before_save :generate_slug
  
  def generate_slug
    self.slug = SecureRandom.uuid[0..4] if self.slug.nil? || self.slug.empty?
    self.expires_at = Date.today.next_month
  end
  
  def short
    Rails.application.routes.default_url_options[:host] + "/s" + "/#{self.slug}"
  end
  
  def shorten(url_link)
    url = Shorten.where(url: url_link).first
    return url.short if url 
    url = Shorten.new(url: url_link)
    return url.short if url.save
  end
end
