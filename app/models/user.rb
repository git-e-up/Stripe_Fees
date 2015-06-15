class User < ActiveRecord::Base
  has_secure_password



  def fees(start_date = Date.new(2010,5,11), end_date = Date.new(2010,5,21))

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
         fees_array.push(amount.fee/100.round(2))
      end



      return 0 if fees_array.empty?



      final = (fees_array.inject{|sum,x| sum + x }).round(2)

      final_2 = '%.2f' % final

    else
      []
    end
  end

  def fees_2(start_date = Date.new(2010,5,11), end_date = Date.new(2010,5,21))

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
         fees_array.push(amount.fee/100.round(2))
      end
############
      # another = []
      #
      # fees_array.each do |dollaz|
      #
      #   another.push("hello"+fees_array[dollaz].to_s)
      # end


      return 0 if fees_array.empty?

      # fees_dollars = fees_array.each.to_i/100



      final = (fees_array.inject{|sum,x| sum + x }).round(2)

      final_2 = '%.2f' % final

      fees_array.reject! {|x| x == 0}

      fees_x = []
      fees_string = ""

      fees_array.each {|x| fees_x << '%.2f' % x}

      fees_x.each {|x| fees_string << "$#{x}, "}


      neat = {total_fees: "$"+final_2.to_s, fees_array: fees_string.to_s}

      return "Your total fees of " +neat[:total_fees]+ ' are composed of the following fees within the search range: ' + neat[:fees_array] +". "




    else
      []
    end
  end
end
