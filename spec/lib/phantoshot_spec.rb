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
            response = make_screenshot(HTML_FIXTURE_FILENAME, width: 300, height: 200)
            
            ## let's have the hash contain height, width attributes
            expect(response.width).to eq 300
            expect(response.height).to eq 200
            expect(response.url).to eq HTML_FIXTURE_FILENAME
            expect(response.file_format).to eq 'PNG'

            @imgfile.write( response.image_data )
            @imgfile.close

            expect( FastImage.size(@imgfile.path)[0] ).to eq 300
            expect( FastImage.size(@imgfile.path)[1] ).to eq 200
         end

         after(:each) do 
            @imgfile.unlink
         end
      end


      context "Error handling: should have an :error attribute when phantom_command fails" do 

         it "should return 'Error': Invalid source address' when nonexistent address is given"

      end


   end
end