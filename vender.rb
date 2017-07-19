class Drink
  attr_accessor :name, :price
  def initialize(name,price)
    @name = name
    @price = price
  end
end

class VendingMachine
  MONEY = [10, 50, 100, 500, 1000].freeze
  attr_accessor :sales
  def initialize
    @total_insert = 0
    @sales = 0
    @drink_num = Hash.new(0)
    @available_list = Array.new
  end


  def insert(money)
    if MONEY.include?(money)
      @total_insert += money
    else
      money
    end
  end

  def money_return
    puts @total_insert
    @total_insert = 0
  end

  def buy(drink)
    if available_list.include?(drink)
      puts "#{drink.name}が購入されました"
      @sales += drink.price
      @total_insert -= drink.price
    end
  end

  def change
    puts "お釣りは#{@total_insert}"
    @total_insert = 0
  end

  def item_plus(drink_name,num)
    @drink_num[drink_name] += num
  end

  def item_minus(drink_name)
    @drink_num[drink_name] -= 1
  end

  def drink_info
    @drink_num.each do |key,value|
      puts "名前#{key.name}, 値段 #{key.price}, 在庫 #{value}"
    end
  end


  def available_list #後に初期化が必要
    @drink_num.each do |key,value|
       if @total_insert >= key.price &&  value > 0
          @available_list.push(key.name)
       end
    end
  end

  def available_display(list)
    list.each do |a|
         puts "#{a}は購入可能です"
    end
  end

end

machine = VendingMachine.new
cola = Drink.new("cola",120)
p cola.name
p cola.price
bull =Drink.new("redbull",200)
water = Drink.new("water",100)
machine.item_plus(cola,5)
machine.item_plus(bull,4)
machine.drink_info

p machine.insert(50)
p machine.insert(10)
p machine.insert(5)
p machine.insert(100)
machine.insert(1000)
p machine.available_list
p machine.buy(cola)
machine.change
p machine.sales
