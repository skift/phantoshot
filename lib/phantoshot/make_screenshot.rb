module Phantoshot
require 'mini_magick'
include MiniMagick

   def make_screenshot(url, opts={})

      desired_width = opts[:width]
      desired_height = opts[:height]

      res = MultiJson.load( 
         phantom_command(url)
      )

      hsh = Hashie::Mash.new(res)

      # Decode it for writing out to binary
      hsh[:image_data] = Base64.decode64( hsh[:image_data] )   

      tempfile = Tempfile.new('foo.png')
      tempfile.binmode

      tempfile.write(hsh[:image_data])
      tempfile.close

      img = MiniMagick::Image.open(tempfile.path)


      if desired_width && desired_width < img[:width]
         img.resize(desired_width)
      end

      if !desired_height.nil? && desired_height < img[:height]
         img.crop("#{img[:width]}x#{desired_height}+0+0")
      end

      tempfile2 = Tempfile.new('bar.png')
      tempfile2.binmode

      img.write(tempfile2.path)

      tempfile2.close

      hsh[:width] = img[:width]
      hsh[:height] = img[:height]
      hsh[:image_data] = open(tempfile2.path){ |f| f.read }
      return hsh
   end


   # returns JSON string with these attributes:
   # :image_data (in base64), :file_format (default is PNG), and :url
   #
   def phantom_command(url)
      cmd = "phantomjs #{JS_LIB_NAME} #{url}"
      `#{cmd}`
   end
end
