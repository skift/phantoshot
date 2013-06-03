require 'spec_helper'

include Phantoshot

describe Phantoshot do 
   it "should run this test" do 
      expect(true).to be true
   end



   describe "make_screenshot" do 

      context "basic setup" do 
         it "should require a single String parameter" do
            expect{ make_screenshot }.to raise_error
         end

         it "should return Hashie::Mash object" do 
            # expect( make_screenshot('http://www.example.com') ).to be_a Hashie::Mash
         end
      end

      context "image production" do 
         it "should return an image_data attribute in the data_hash" do 
           hsh = make_screenshot(HTML_FIXTURE_FILENAME)
           expect( hsh.image_data ).to be_a String            
         end
      end


      context "call with parameters" do 
         before(:each) do 
            @imgfile = Tempfile.new('foo.png')
         end

         it "should accept width and height options" do 
            response_hash = make_screenshot(HTML_FIXTURE_FILENAME, width: 600, height: 400).image_data
            
            ## let's have the hash contain height, width attributes
            expect(response_hash.width).to eq 600
            expect(response_hash.height).to eq 400

            @imgfile.write( response_hash.imgdata )
            @imgfile.close

            expect( FastImage.size(@imgfile.path)[0] ).to eq 600
            expect( FastImage.size(@imgfile.path)[1] ).to eq 400
         end



#         it "should accept height option"

         after(:each) do 
            @imgfile.unlink
         end
      end

   end
end