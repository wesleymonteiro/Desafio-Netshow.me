class Video < ApplicationRecord
  belongs_to :user

  validates :title, :views, :url, presence: true
  validate :valid_url?

  default_scope { order("views DESC") }

  def valid_url?
    raise_url_error unless url.present? && url.end_with?(".m3u8")
    uri = URI.parse(url)
    raise_url_error unless uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    raise_url_error
  end

  def raise_url_error()
    errors.add(:url, "must be a valid url and has '.m3u8' extension")
  end
end
