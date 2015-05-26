class User < ActiveRecord::Base
  has_secure_password
  # def password=(password)
  #   self.password_digest = BCrypt::Password.create(password)
  # end
  #
  # def is_password?(password)
  #   BCrypt::Password.new(self.password_digest) == password
  # end

  def fees(start_date= Date.new(2015,5,10), end_date= Date.new(2015,5,21))

    if self.api_key
      Stripe.api_key = self.api_key
      fees_in_range = []


      start_date = start_date.to_time.to_i

      end_date = end_date.to_time.to_i

      transaction_list =Stripe::BalanceTransaction.all(:limit => 100)
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

    else
      []
    end
  end
end
