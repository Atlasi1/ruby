# frozen_string_literal: true

class Raspberry
  @@states = ["ранние", "среднеранние", "средние", "среднепоздние", "поздние"]

  def initialize(index)
    @index = index
    @state = 1
  end

  def grow!
    if @state < @@states.size
      @state += 1
    end
  end

  def ripe?
    if @state == @@states.size
      return true
    end
    false
  end

  def state
    @state
  end

  protected

  def index
    @index
  end

end

class RaspberryBush
  def initialize(count)
    @raspberries = []
    (0...count).each do |i|
      @raspberries << Raspberry.new(i)
    end
  end

  def grow_all!
    @raspberries.each do |rasp|
      rasp.grow!
    end
  end

  def ripe_all?
    @raspberries.each do |rasp|
      if rasp.ripe? == false
        return false
      end
    end
    true
  end

  def give_away_all!
    @raspberries.clear
  end
end

class Human
  def initialize(name, plant)
    @name = name
    @plant = plant
  end

  def work!
    if @plant.ripe_all? == true
      puts "Твой куст уже созрел"
    else
      @plant.grow_all!
      puts "Отлично сработано, твой куст стал еще больше!"
    end
  end

  def harvest
    if @plant.ripe_all? == true
      @plant.give_away_all!
      puts "Урожай собран"
      true
    else
      puts "Еще рано!"
      false
    end
  end

  def self.knowledge_base
    puts "Небольшая памятка для работничка:
    ранние – 60-65 дней;
среднеранние – 65-70 дней;
средние – 70-75 дней;
среднепоздние – 75-80 дней;
поздние – более 80 дней."
  end

  protected

  def plant
    @plant
  end
end

if __FILE__ == $PROGRAM_NAME
  event_harvest = false
  Human.knowledge_base
  puts "Привет, как тебя зовут?"
  name = "Артур"
  puts "Напомни, сколько у тебя было ягод?"
  count = 10
  bush = RaspberryBush.new(count)
  human = Human.new("name", bush)
  puts "Хорошо #{name}, что будешь делать с #{count} ягодками? (команды:
1 - собрать кустик если он созрел (собран - игра заканчивается)
2 - выращивать кустик
3 - прочесть базу знаний
4 - закончить работу)"
  loop do
    str = gets.chomp
    break if str == "4" || event_harvest
    case str
    when "1"
      if human.harvest
        event_harvest = true
      end
    when "2"
      human.work!
    when "3"
      Human.knowledge_base
    else
      puts "Неверная команда, попробуй еще раз"
    end
  end
end