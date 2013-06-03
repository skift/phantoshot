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
         it "should accept width option"
         it "should accept height option"
      end

   end
end