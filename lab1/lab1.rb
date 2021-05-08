# reduce method 
# round 
# +- in the result

class ComplexNumber

    attr_reader :real, :imaginary

    @@Operations={
        "addOps" => 0,
        "MulOps" => 0,
        "bulk_add" => 0,
        "bulk_multiply" => 0,
    }

    def initialize(real, imaginary)
        @real = real.to_f.round(10)
        @imaginary = imaginary.to_f.round(10) 
    end

    def +(cn1)
        @@Operations["addOps"]+=1
        ComplexNumber.new(real + cn1.real , imaginary + cn1.imaginary)
    end
    
    def *(cn1)
        @@Operations["MulOps"]+=1
        new_real = real * cn1.real - imaginary * cn1.imaginary
        new_complex = imaginary * cn1.real + real * cn1.imaginary
        ComplexNumber.new(new_real,new_complex)
    end

    def bulk_add(cns)
        @@Operations["bulk_add"]+=1
        res = ComplexNumber.new(real, imaginary)
        cns.each do |cn|
            res = res+cn
        end
        res
    end

    def bulk_multiply(cns)
        @@Operations["bulk_multiply"]+=1
        res = ComplexNumber.new(real, imaginary)
        cns.each do |cn|
            res = res*cn
        end
        res
    end

    def self.get_stats
        puts "\nAdd Operations #{@@Operations["addOps"]}\n Multiply Operations #{@@Operations["MulOps"]}\n bulk_add Operations #{@@Operations["bulk_add"]}\n multiply_bulk Operations #{@@Operations["bulk_multiply"]}"
    end

    def prints
        puts "#{@real}+#{@imaginary}i"
    end
end

x = ComplexNumber.new(3,2)
x1= ComplexNumber.new(1,7)
y = x+x1
y.prints

z = x*x1
z.prints

w = z.bulk_add([y,x])
w.prints

v = z.bulk_multiply([y,x,w])
v.prints

ComplexNumber.get_stats