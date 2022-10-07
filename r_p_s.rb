puts "じゃんけん..."

def r_p_s
 puts "0（グー）1（チョキ）2（パー）それ以外の数字（戦わない）"
 player_hand = gets.to_i
 case player_hand
 when player_hand = 0
  puts "あなた：グー"
 when player_hand = 1
  puts "あなた：チョキ"
 when player_hand = 2
  puts "あなた：パー"
 when player_hand = 3
  puts "あなたは逃げ出しました"
 end

 enemy_hand = rand(3)
 case enemy_hand
 when enemy_hand = 0
  puts "あいて：グー"
 when enemy_hand = 1
  puts "あいて：チョキ"
 when enemy_hand = 2
  puts "あいて：パー"
 end

 if player_hand === enemy_hand
  puts  "あいこで"
  r_p_s
 elsif (player_hand === 0 && enemy_hand === 1)||(player_hand === 1 && enemy_hand === 2)||(player_hand === 2 && enemy_hand === 0)
  puts "あなたの勝ちです"
  @victory = true
  a_m_h
 elsif (player_hand === 1 && enemy_hand === 0)||(player_hand === 2 && enemy_hand === 1)||(player_hand === 0 && enemy_hand === 2)
  puts "あなたの負けです"
  @victory = false
  a_m_h
 else
  puts "逃げたしたので終わりです"
 end

end

def a_m_h
  puts "あっちむいて"
  puts "0(↑)1（→）2（↓）3（←）"
  player_direction = gets.to_i
  case player_direction
  when player_direction = 0
    puts "あなた：↑"
  when player_direction = 1
    puts "あなた：→"
  when player_direction = 2
    puts "あなた：↓"
  when player_direction = 3
    puts "あなた：←"
  end

  enemy_direction = rand(4)
  case enemy_direction
  when enemy_direction = 0
    puts "あいて：↑"
  when enemy_direction = 1
    puts "あいて：→"
  when enemy_direction = 2
    puts "あいて：↓"
  when enemy_direction = 3
    puts "あいて：←"
  end

  if (player_direction == enemy_direction && @victory == true)
    puts "完全勝利です。おめでとうございます！"
  elsif (player_direction == enemy_direction && @victory == false)
    puts "残念ながら敗北です。"
  else
    puts "外れたのでじゃんけんからです"
    puts "じゃんけん..."
    r_p_s
  end
end

r_p_s