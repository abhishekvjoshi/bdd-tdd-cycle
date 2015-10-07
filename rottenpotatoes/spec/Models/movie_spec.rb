require 'spec_helper'

describe Movie do
	it 'should add a director for a movie' do
		Movie.all.each do |m|
			if m[:title] == params[:movie]
				m[:director] = params[:directorName]
			end
		end
	end 
end
