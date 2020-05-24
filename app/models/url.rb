class Url < ApplicationRecord

  validates :original_url, presence: true, uniqueness: true
  validates :original_url, url: true

  after_create :set_surl

  CHARS62  = ('A'..'Z').to_a + ('a'..'z').to_a + (0..9).to_a

  # Class method
  def self.get_url(shorted_url)
    return nil if shorted_url.nil?
    url = Url.find_by(shorted_url: shorted_url)
    url.increment!(:visits)
    url
  end

  def self.save_url(params)
    record = create_or_find_by params
    logger.info " >>> here params >>>  #{record.inspect}"
    record
  end

  private

  def self.check_url(params)
     find_by(params)
  end

  def set_surl
    self.shorted_url = encode_url(self.id)
    self.save
  end

  # the Bijective Function stuff
  def encode_url(number)
    return CHARS62[0] if number == 0
    (1..number).reduce('') {|n| CHARS62[number.modulo(CHARS62.length)]}.reverse
  end

  def decode_url(surl)
    i = 0
    base = CHARS62.length
    surl.each_char { |c| i = i * base + CHARS62.index(c) }
    i
  end
end
