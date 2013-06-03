
module Phantoshot
   def make_screenshot(url, opts={})      
      res = MultiJson.load( phantom_command(url) )  

      hsh = Hashie::Mash.new(res)
      hsh.image_data = Base64.decode64( hsh.image_data )
      
      return hsh 
   end


   # returns JSON string
   def phantom_command(url)
      cmd = "phantomjs #{JS_LIB_NAME} #{url}"
      `#{cmd}`
   end
end
