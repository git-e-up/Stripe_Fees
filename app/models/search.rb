class Search < ActiveRecord::Base

  def range(start_date, end_date)

    fees_in_range = []

    start_date = start_date.to_time.to_i

    end_date = end_date.to_time.to_i

    transaction_list = Stripe::BalanceTransaction.all(:limit => 100)

    fees_list  = []
    fees_array = []

    transaction_list.each do |item|
    		fees_list.push(item)
    end

    fees_list.each do |feee|
    	if (feee.created >= start_date && feee.created <= end_date)
    		fees_in_range.push(feee)
    	end
    end

    fees_in_range.each do |amount|
	     fees_array.push(amount.fee)
     end
     puts fees_array.inject{|sum,x| sum + x }

end

# range(Date.new(2015,5,10), Date.new(2015,5,21))
