@left_coin = 200
@number_of_reels = 3
@numbers_on_reels  = 3

HR = "-" * 10

@first_up_grade  = false
@second_up_grade = false

@players_points = 0

def use_coin
  @left_coin -= @insert_coin.to_i
  puts "残り#{@left_coin}コイン"
end

def pull
  puts "3回Enterを押してリールを止めましょう！"
  @reels = []

  @number_of_reels.times do
    gets
    @reels << reel_numbers
    display
  end
  reels_result
end

def display
  puts HR
  number_rows.each { |numbers_in_line| puts "|#{numbers_in_line.join("|")}|" }
  puts HR
end

def reel_numbers
  (5..7).to_a.shuffle.take(@numbers_on_reels)
end

def number_rows
  @reels.transpose
end

def center_row
  number_rows[1]
end

def top_row
  number_rows[0]
end

def bottom_row
  number_rows[2]
end

def big_bonus
  @players_points += 100
end

def small_bonus
  @players_points += 30
end

def reels_result
  if center_row == [7, 7, 7]
    puts "真ん中の列が大当たりです！おめでとうございます！"
    big_bonus
  elsif center_row.all? {|value| value == center_row[0]}
    puts "真ん中の列が当たりです！"
    small_bonus
  end

  if (top_row == [7, 7, 7] && @first_up_grade == true)
    puts "上の列が大当たりです！おめでとうございます！"
    big_bonus
    @first_up_grade = false
  elsif (top_row.all? {|value| value == top_row[0]} && @first_up_grade == true)
    puts "上の列が当たりです！"
    small_bonus
    @first_up_grade = false
  end

  if (bottom_row == [7, 7, 7] && @second_up_grade == true)
    puts "下の列が大当たりです！おめでとうございます！"
    big_bonus
    @second_up_grade = false
  elsif (bottom_row.all? {|value| value == bottom_row[0]} && @second_up_grade == true)
    puts "下の列が当たりです！"
    small_bonus
    @second_up_grade = false
  end

puts "現在のポイント：#{@players_points}"
end

def game_start!
  if (@insert_coin == 10 && @left_coin >= 10)
    use_coin
    pull
  elsif (@insert_coin == 20 && @left_coin >= 20)
    use_coin
    @first_up_grade = true
    pull
  elsif (@insert_coin == 30 && @left_coin >= 30)
    use_coin
    @first_up_grade = true
    @second_up_grade = true
    pull
  else
    puts "コインが足りません！"
  end
end

puts "スロットゲームを始めます"

loop do

  if @left_coin < 10
    puts "ゲームを終了します (獲得ポイント#{@players_points})"
    break
  end
  puts "残りコイン数#{@left_coin}枚"
  puts "コインをいくつ入れますか？"
  puts "10コインで真ん中の列、20コインで真ん中と上の列、30コインですべての列の抽選をします"
  puts "10(10コイン),20(20コイン),30(30コイン)0(やめる)"
  @insert_coin = gets.to_i
  if @insert_coin == 0
    puts "ゲームを修了します (獲得ポイント#{@players_points})"
    break
  end
  puts "#{@insert_coin}コイン入れました"
  game_start!

end


