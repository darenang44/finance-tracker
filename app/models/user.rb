class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  has_many :friendships
  has_many :friends, through: :friendships
  # method to return full name
  # strip get rid of the white space other than the name
  def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
    "Anonymous"
  end

  # creating restrictions to see if we can add the stock
  def can_add_stock?(ticker_symbol)
    # if the under_stock_limit? and !stock_already_added?(ticker_symbol) returns true then we can add stock
    under_stock_limit? && !stock_already_added?(ticker_symbol)
  end

  # restriction to where you can only track 10 stock at a time
  def under_stock_limit?
    (user_stocks.count < 10)
  end

  # restriction where you can't track a stock twice
  def stock_already_added?(ticker_symbol)
    # we are finding the stock by using the find_by_ticker method
    stock = Stock.find_by_ticker(ticker_symbol)
    # we are returning false unless the stock is found
    return false unless stock
    # so if the stock does exist then the statement below will return true
    user_stocks.where(stock_id: stock.id).exists?
  end

end
