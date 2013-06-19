module Phantoshot
require 'rmagick'
include Magick

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

      img = Image.read(tempfile.path)[0]
      org_width = img.columns
      org_height = img.rows

      if desired_width
         img = img.resize_to_fit(desired_width, org_height)
      end

      if desired_height
         img = img.crop(0, 0, img.columns, desired_height)
      end

      tempfile2 = Tempfile.new('bar.png')
      tempfile2.binmode

      img.write(tempfile2.path)

      tempfile2.close

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
