require 'rubygems'
require File.join(File.dirname(__FILE__), 'lib/rps_web.rb')
use Rack::Static, :urls => ['/images', '/javascripts', '/src'], :root => 'public'

run RPSWeb