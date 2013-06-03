module Phantoshot

   def make_screenshot(url, opts={})      
      phantom_command(url)   

      hsh = Hashie::Mash.new 
      return hsh 
   end



   def phantom_command(url)
      cmd = "phantomjs #{JS_LIB_NAME} #{url}"
      puts cmd 
      `#{cmd}`
   end

end
