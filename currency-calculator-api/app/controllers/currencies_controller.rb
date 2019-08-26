class CurrenciesController < ApplicationController

  def index
    render json: { data: currency_list.to_json }
  end

  def refresh
    if RateUpdater.parse_currencies_from_xml
      render json: { data: 'refresh' }
    else
      render json: { data: 'error' }
    end
  end

  private

  def currency_list
    @currency_list = Currency.order(:id)
  end

end

