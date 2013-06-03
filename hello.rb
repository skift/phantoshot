require 'pry'
require 'cgi'

def make_screenshot(url)
  `phantomjs hello.js #{url}`
end