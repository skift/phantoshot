module Phantoshot
   def make_screenshot(url, opts={})

      width = opts[:width] || 600
      height = opts[:height] || 400

      res = MultiJson.load( phantom_command(url, width, height) )

      hsh = Hashie::Mash.new(res)

      # Decode it for writing out to binary
      hsh[:image_data] = Base64.decode64( hsh[:image_data] )      
      return hsh
   end


   # returns JSON string with these attributes:
   # :image_data (in base64), :width, :height, :file_format (default is PNG), and :url
   #
   def phantom_command(url, width, height)
      cmd = "phantomjs #{JS_LIB_NAME} #{url} #{width} #{height}"
      `#{cmd}`
   end
end
