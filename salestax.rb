class Item

  attr_accessor :quantity, :name, :price

  def initialize(quantity, name, price)
    @quantity = quantity
    @name = name
    @price = price 
  end

# determine subtotal
  def subtotal
    @price * @quantity
  end

# define rate of tax
  def taxrate
    0.10
  end

# determine sales tax total
  def salestax
    subtotal * taxrate
  end

# determine total price
  def totalprice
    subtotal + salestax 
  end

end

  class Imported < Item
    def taxrate
      super + 0.05
    end
  end

  class Exempt <Item
    def taxrate
      0
    end
  end

  class Imported_Exempt <Exempt
    def taxrate
      super + 0.05
    end
  end

class Reciept

  attr_accessor :products

  def initialize(*products)
    @products = products
  end

  def taxcalculator
    sales_tax_total = 0 
    @products.each do |p|
      sales_tax_total += p.salestax
    end
    return sales_tax_total
  end

  def totalcalculator
    total = 0
    @products.each do |p|
      total += p.totalprice
    end
    return total
  end 

  def print_totals
    @products.each do |p|
        puts "#{p.quantity} #{p.name} : #{p.price}"
    end

    puts "Sales Taxes: #{sprintf('%.2f', taxcalculator)}"
    puts "Total: #{sprintf('%.2f', totalcalculator)}"

  end

end

#input 1 
book = Exempt.new(1, "book", 12.49)
CD = Item.new(1, "music CD", 14.99)
chocolate = Exempt.new(1, "chocolate bar", 0.85)

order1 = Reciept.new(book, CD, chocolate)
puts order1.print_totals

#Input 2
chocolate2 = Imported_Exempt.new(1, "imported chocolates", 10.00)
perfume= Imported.new(1, "imported perfume", 47.50)

order2 = Reciept.new(chocolate2, perfume)
puts order2.print_totals

#Input 3
importedperfume= Imported.new(1, "imported perfume", 27.99)
perfume2 = Item.new(1, "perfume", 18.99)
pills = Exempt.new(1, "headache pills", 9.75)
chocolate3 = Imported_Exempt.new(1, "imported chocolates", 11.25)

order3 = Reciept.new(importedperfume, perfume2, pills, chocolate3)
puts order3.print_totals