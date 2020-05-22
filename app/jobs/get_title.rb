# Updates title in Url record
class GetTitle
  @queue = :get_title

  def self.perform(url_id)
    url           = Url.find url_id
    title         = Nokogiri::HTML::Document.parse(HTTParty.get(url.original_url).body).title
    Rails.logger.info " **** YYYYYYY RESQUE url.original_url >>> #{url.original_url} >>>>  title >>>  #{title.inspect}"
    unless title.blank?
      url.web_title = title
      url.save
      Rails.logger.info "** RESQUE SUCCESS: url.original_url >>> #{url.original_url} >>>>  title >>>  #{title.inspect} **"
    else
      Rails.logger.info "** RESQUE ERROR: url.original_url >>> #{url.original_url} >>>>  title >>>  #{title.inspect} **"
    end
  end
end
