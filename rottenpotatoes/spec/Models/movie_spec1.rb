require 'spec_helper'
describe Movie do
	def add_director(params)
		Movie.all.each do |m|
			if m[:title] == params[:movie]
				m[:director] = params[:directorName]
			end
		end
		
	end
end