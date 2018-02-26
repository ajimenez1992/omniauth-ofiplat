$LOAD_PATH.unshift File.expand_path('..', __FILE__)
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'simplecov'
if ENV['COVERAGE']
  SimpleCov.start do
    minimum_coverage(89.8)
  end
end
require 'rspec'
require 'rack/test'
require 'webmock/rspec'
require 'omniauth'
require 'omniauth-ofiplat'
require 'sinatra'

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.include WebMock::API
  config.include Rack::Test::Methods
  config.extend OmniAuth::Test::StrategyMacros, type: :strategy

  def app
    @app || make_application
  end

  def make_application(options = {})
    domain = 'sql2008:62714'
    domain = options.delete(:domain) if options.key?(:domain)

    Sinatra.new do
      configure do
        enable :sessions
        set :show_exceptions, false
        set :session_secret, 'TEST'
      end

      use OmniAuth::Builder do
        provider :ofiplat, 
          'http://sql2008:62714', #domain
          'http://localhost:3000', #wreply
          'OfiTourCMS', #app
          DateTime.now.to_s, #wct
          '/', #ru
          'passive', #id
          'rm=0', #wctx
          'urn:ofitest', #wtrealm
          'wsignin1.0' #wa
      end

      get '/auth/ofiplat/callback' do
        MultiJson.encode(env['omniauth.auth'])
      end
    end
  end
end

OmniAuth.config.logger = Logger.new('/dev/null')
