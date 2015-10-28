module TweetsHelper
  def tweet_content(content)
    content.gsub(/@(\w+)/, "<a target='_blank' href='http://twitter.com/\\1'>@\\1</a>").html_safe
  end
end
