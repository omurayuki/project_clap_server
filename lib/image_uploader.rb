require 'httpclient'

module ImageUpload
  def self.request_imgur_url(image_base64)
    http_client = HTTPClient.new
    request = http_client.post(URI.parse(Constants::IMGUR_URL), { image: image_base64 }, 'Authorization' => "Client-ID #{ENV['IMAGUR_ACCESS_KEY_ID']}")
    result = JSON.load(request.body)
    result.dig('data', 'link')
  rescue StandardError => e
    raise e.message
  end
end