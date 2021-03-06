require 'rails_helper'

describe "Merchants best sellers by items" do
  fixtures :merchants
  fixtures :items
  fixtures :invoices
  fixtures :transactions

  context "#Index" do
    it 'returns JSON data on all merchants by items sold matching quantity params' do
      get '/api/v1/merchants/most_items?quantity=1'

      best_sellers = JSON.parse(response.body)
      best_seller = best_sellers.first

      expect(response).to be_success
      expect(best_sellers.length).to eq(1)
      expect(best_sellers.class).to eq(Array)
      expect(best_seller.class).to eq(Hash)
      expect(best_seller['id']).to eq(1)
      expect(best_seller['name']).to eq("David's Store")
    end
  end
end
