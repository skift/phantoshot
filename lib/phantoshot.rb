require "phantoshot/version"
require "phantoshot/make_screenshot"

require 'hashie'
require 'multi_json'
require 'base64'

module Phantoshot
   JS_LIB_NAME = File.join(File.dirname(__FILE__), "/phantom-shot-script.js")
end

include Phantoshot
