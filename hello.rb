require 'pry'
require 'cgi'

def make_screenshot(url)
  `phantomjs hello.js #{url}`
end

make_screenshot('http://www.example.com')