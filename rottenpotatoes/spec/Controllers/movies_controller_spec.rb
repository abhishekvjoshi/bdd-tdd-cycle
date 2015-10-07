require 'spec_helper'
describe MoviesController do
  describe "adding a director" do
	it 'should add a director for a movie' do
		fake_results = [mock(Movie)]
		params = {:movie => 'Star Wars', :directorName => 'George Lucas'}
		Movie.should_receive(:find_by_director).with(params). and_return(fake_results)
		post :add_director, {:movie => 'Star Wars', :directorName => 'George Lucas'}
	end   
  end

end