require 'RSA'

RSpec.describe RSA do
    let(:rsa_values) { RSA.new 14, 5, 6 }
    key_values = RSA.new_key
    
    describe "testing return values of getters" do        
        it "checks n returning value" do
           expect(rsa_values.n).to eq 14 
        end

        it "checks e returning value" do
            expect(rsa_values.e).to eq 5
        end

        it "checks d returning value" do
            expect(rsa_values.d).to eq 6
        end
    end

    describe "testing return types of new_key" do
        it "checks first new_key returnig type" do
            expect(key_values[0]).to be_a(Integer)
        end
        it "checks second new_key returnig type" do
            expect(key_values[1]).to be_a(Integer)
        end
        it "checks third new_key returnig type" do
            expect(key_values[2]).to be_a(Integer)
        end
    end

    describe "testing return values of encrypt and decrypt" do
       it "checks encrypting return type" do
            expect(rsa_values.encrypt 'abcdef').to be_a(String)
       end
       it "cheks if encrypt input equals to decrypt return" do
            msg = RSA.new key_values[0], key_values[1], key_values[2]
            encrypted_msg = msg.encrypt 'abcdef'
            expect(msg.decrypt encrypted_msg).to eq'abcdef'
       end 
    end        
end
    
