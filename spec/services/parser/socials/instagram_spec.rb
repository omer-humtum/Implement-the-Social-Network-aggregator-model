require 'rails_helper'

RSpec.describe Parser::Socials::Instagram do
  subject(:instagram_parser) { Parser::Socials::Instagram.new }

  let(:instagram_json) do
    [
      { 'name' => 'Foo', 'picture' => 'Hello!!' },
      { 'name' => 'Bar', 'picture' => 'World!!' }
    ]
  end

  before do
    allow_any_instance_of(Parser::Socials::EndPointExtractor).to receive(:json).and_return(instagram_json)
  end

  describe '#photos' do
    subject(:photos) { instagram_parser.photos }
    it 'returns all the pictures' do
      expect(photos).to eq(['Hello!!', 'World!!'])
    end
  end
end
