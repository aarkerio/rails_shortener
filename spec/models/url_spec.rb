require 'rails_helper'

RSpec.describe Url, type: :model do

  let(:url)  { FactoryBot.create :url }

  context 'Create a new shortener' do
    let(:url_1) { FactoryBot.build :url, original_url: "htggtps://ja.coder.work/so/ruby-on-rails/1506858" }
    let(:url_2) { FactoryBot.build :url, original_url: "https://ja.coder.work/so/ruby-on-rails/1506858" }
    describe '#validates format' do
      it 'fails to save: bad formatted string' do
        result = url_1.save
        Rails.logger.info " >>>>  params url_1 >>>  #{url_1.inspect}"
        expect(result).to be false
      end
    end

    describe '#validates format' do
      it 'saves the new' do
        result = url_2.save
        Rails.logger.info " >>>>  params url_2 >>>  #{url_2.inspect}"
        expect(result).to be true
      end
    end
  end

end
