require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
mode = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。

def make_memo
  puts "新規ファイル名を入力してください"
  file_name = gets.chomp
  puts "メモの内容を記入してください"
  memo = gets.chomp
  CSV.open("#{file_name}.csv", "w") do |m|
    m << [memo]
  end
end

def edit_memo
  puts "編集するファイル名を拡張子を除き記入してください"
  file_name = gets.chomp
  puts "編集後のメモの内容を記入してください"
  memo = gets.chomp
  CSV.open("#{file_name}.csv", "a") do |m|
    m << [memo]
  end
end

def delete_memo
  puts "削除するファイル名を拡張子を除き記入してください"
  file_name = gets.chomp
  File.delete("#{file_name}.csv")
end

if mode == 1
  puts "新規でメモを作成します"
  make_memo()
elsif mode == 2
  puts "既存のメモを編集します"
  edit_memo()
elsif mode == 3
  puts "メモを削除します"
  delete_memo()
else
  puts "残念ながらエラーです"
end
