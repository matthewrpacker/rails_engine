require 'rails_helper'

describe "InvoiceItems" do
  fixtures :invoice_items

  it 'returns JSON data on all invoice_items' do
    get '/api/v1/invoice_items'

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(response).to be_success
    expect(invoice_items.length).to eq(2)
    expect(invoice_item['id']).to eq(1)
    expect(invoice_item['item_id']).to eq(539)
    expect(invoice_item['invoice_id']).to eq(1)
    expect(invoice_item['quantity']).to eq(5)
    expect(invoice_item['unit_price']).to eq(13635)
  end

  it 'returns JSON data on a specific invoice item' do
    get '/api/v1/invoice_items/2'

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item['id']).to eq(2)
    expect(invoice_item['item_id']).to eq(528)
    expect(invoice_item['invoice_id']).to eq(1)
    expect(invoice_item['quantity']).to eq(9)
    expect(invoice_item['unit_price']).to eq(23324)
  end
end