class Parser::Socials::Instagram
  INSTAGRAM_ENDPOINT = 'https://takehome.io/instagram'

  def photos
    instagram_records.collect { |instagram_record| instagram_record['picture'] }.compact
  end

  private

  def instagram_records
    Parser::Socials::EndPointExtractor.new(url: INSTAGRAM_ENDPOINT).json
  end
end
