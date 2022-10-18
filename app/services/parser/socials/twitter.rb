class Parser::Socials::Twitter
  TWITTER_ENDPOINT = 'https://takehome.io/twitter'
  
  

  def tweets
    twitter_records.collect { |twitter_record| twitter_record['tweet'] }.compact
  end

  private

  def twitter_records
    Parser::Socials::EndPointExtractor.new(url: TWITTER_ENDPOINT).json
  end
end
