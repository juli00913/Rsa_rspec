require 'prime'

class RSA
    def initialize n, e, d
      @n = n
      @e = e
      @d = d
    end
    
    def n
        @n
    end
    def e
       @e
    end
    
    def d
       @d
    end
    
    def self.new_key
        p = rand(2..256)
        q = rand(2..256) 
        
        p = Prime.take(p).last
        q = Prime.take(q).last
        
        n = p*q
        phi_n = (p-1) * (q-1) 
        e = 3

        d = (2 * phi_n + 1) / e

        [n, e, d]
    end
    
    def encrypt message
        encrypt_msg = ''
        message.each_byte do |c|
            c = c**e % n 
            encrypt_msg += c.to_s + ' '
        end
        puts encrypt_msg
        encrypt_msg
    end
    
    def decrypt message
        decrypted_msg = ''
        msg = message.split(" ")
        msg.each do |i| 
            num = (i.to_i ** d) % n
            decrypted_msg += num.chr
        end 
        
        puts decrypted_msg
        decrypted_msg
    end 
end

#values = RSA.new_key
#msg = RSA.new values[0], values[1], values[2]
#encrypted = msg.encrypt "hello"
#msg.decrypt encrypted 
