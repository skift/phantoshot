
module Phantoshot
   def make_screenshot(url, opts={})      
      res = MultiJson.load( phantom_command(url) )  

      hsh = Hashie::Mash.new(res)
      
      return hsh 
   end


   # returns JSON string
   def phantom_command(url)
      cmd = "phantomjs #{JS_LIB_NAME} #{url}"
      `#{cmd}`
   end
end
