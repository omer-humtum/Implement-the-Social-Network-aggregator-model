class Parser::Socials::Facebook
  FACEBOOK_ENDPOINT = 'https://takehome.io/facebook'
  
  

  def statuses
    facebook_records.collect { |facebook_record| facebook_record['status'] }.compact
  end

  private

  def facebook_records
    Parser::Socials::EndPointExtractor.new(url: FACEBOOK_ENDPOINT).json
  end
end
