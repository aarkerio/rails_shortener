require "open-uri"

class GetTitle
  @queue = :get_title

  def self.perform(url_id)
    url           = Url.find url_id
    title         = open(url.original_url).read.scan(/<title>(.*?)<\/title>/)
    logger.info " url.original_url >>> #{url.original_url} >>>>  title >>>  #{title.inspect}"
    url.web_title = title
    url.save
  end
end
