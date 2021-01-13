require_relative 'config/environment'

class App < Sinatra::Base
    
    get '/' do

        erb :user_input
    end

    post '/piglatinize' do
        @words = PigLatinizer.new
        @words.words = params[:user_phrase]
        @piglatin = @words.translate
        erb :piglatinize
    end



end