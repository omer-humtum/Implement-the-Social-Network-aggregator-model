require 'net/http'

class Parser::Socials::EndPointExtractor
  attr_reader :url

  def initialize(url:)
    @url = url
  end

  def json
    JSON.parse(body)
  rescue StandardError
    []
  end

  private

  def body
    response.body if response.present?
  end

  def response
    @response ||= Net::HTTP.get_response(URI.parse(url))
  end
end
