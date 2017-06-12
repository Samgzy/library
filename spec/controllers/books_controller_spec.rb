require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  describe 'Get #index' do
    before {get :index}

    it { should render_template('index') }
  end



end
