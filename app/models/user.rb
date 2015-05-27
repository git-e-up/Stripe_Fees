class User < ActiveRecord::Base
  has_secure_password



  def fees(start_date = Date.new(2015,5,11), end_date = Date.new(2015,5,21))

    if self.api_key
      Stripe.api_key = self.api_key
      fees_in_range = []


      start_date = start_date.to_time.to_i
      
      end_date = end_date.to_time.to_i

      transaction_list =Stripe::BalanceTransaction.all(:limit => 1000)
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

      return 0 if fees_array.empty?

      final = (fees_array.inject{|sum,x| sum + x })/100.round(2)

    else
      []
    end
  end
end
