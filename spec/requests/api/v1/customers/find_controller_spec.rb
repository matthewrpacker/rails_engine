require 'rails_helper'

describe "Customers" do
  fixtures :customers

  it 'returns JSON data on all customers matching first_name params' do
    get '/api/v1/customers/find_all?first_name=Cecelia'

    customers = JSON.parse(response.body)
    customer1 = customers.first
    customer2 = customers.last

    expect(response).to be_success
    expect(customers.length).to eq(2)
    expect(customer1['id']).to eq(2)
    expect(customer1['first_name']).to eq('Cecelia')
    expect(customer1['last_name']).to eq('Osinski')
    expect(customer2['id']).to eq(3)
    expect(customer2['first_name']).to eq('Cecelia')
    expect(customer2['last_name']).to eq('Ondricka')
  end

  it 'returns JSON data on all customers matching last_name params' do
    get '/api/v1/customers/find_all?last_name=Ondricka'

    customers = JSON.parse(response.body)
    customer1 = customers.first
    customer2 = customers.last

    expect(response).to be_success
    expect(customers.length).to eq(2)
    expect(customer1['id']).to eq(1)
    expect(customer1['first_name']).to eq('Joey')
    expect(customer1['last_name']).to eq('Ondricka')
    expect(customer2['id']).to eq(3)
    expect(customer2['first_name']).to eq('Cecelia')
    expect(customer2['last_name']).to eq('Ondricka')
  end

  it 'returns JSON data on a specific customer' do
    get '/api/v1/customers/find?first_name=Cecelia'

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer['id']).to eq(2)
    expect(customer['first_name']).to eq('Cecelia')
    expect(customer['last_name']).to eq('Osinski')
  end

  it 'returns JSON data on a specific customer' do
    get '/api/v1/customers/find?last_name=Ondricka'

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer['id']).to eq(1)
    expect(customer['first_name']).to eq('Joey')
    expect(customer['last_name']).to eq('Ondricka')
  end
end