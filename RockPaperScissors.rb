#定数定義
Win = 1
Lose = 2
Draw = 3


#メソッド定義
#1-1 メイン処理メソッド
def main
    puts "じゃんけん..."
    myselfJankenStr, isAbstention = set_janken_status()
    opponentJankenStr = random_set_opponent_janken_status()
    if isAbstention == false
        puts "ホイ！"
        puts "--------------------"
        puts "あなたは#{myselfJankenStr}を出しました。"
        puts "相手は#{opponentJankenStr}を出しました。"
        jankenWinStatus = judge_janken_win_lose(myselfJankenStr, opponentJankenStr)
        if jankenWinStatus == Win
            puts "じゃんけん結果：あなたの勝ち"
            puts "--------------------"
            puts "あっち向いて...（指を差す方向を決めてください）"
            myselfHoiStr = set_hoi_status()
            opponentHoiStr = random_set_opponent_hoi_status()
            puts "ホイ！"
            puts "--------------------"
            puts "あなたは#{myselfHoiStr}を指しました。"
            puts "相手は#{opponentHoiStr}を向いています。"
            if myselfHoiStr == opponentHoiStr
                puts "あっち向いてホイ結果：あなたの勝ち"
            else
                puts "あっち向いてホイ結果：相手の勝ち"
            end
            puts "--------------------"

        elsif jankenWinStatus == Lose
            puts "じゃんけん結果：あなたの負け"
            puts "--------------------"
            puts "あっち向いて...（顔を向ける方向を決めてください）"
            myselfHoiStr = set_hoi_status()
            opponentHoiStr = random_set_opponent_hoi_status()
            puts "ホイ！"
            puts "--------------------"
            puts "あなたは#{myselfHoiStr}を向きました。"
            puts "相手は#{opponentHoiStr}を指しています。"
            if myselfHoiStr != opponentHoiStr
                puts "あっち向いてホイ結果：あなたの勝ち"
            else
                puts "あっち向いてホイ結果：相手の勝ち"
            end
        else
            puts "あいこです。"
            main()
        end
    else
        puts "棄権しました。\nアプリを終了します。"
    end
end
#1-2 じゃんけん入力処理メソッド
def set_janken_status
    puts "1:グー 2:チョキ 3:パー 4:戦わない"
    jankenStatus = gets.to_i
    case jankenStatus
        when 1
            jankenStr = "グー"
            isAbstention = false
        when 2
            jankenStr = "チョキ"
            isAbstention = false
        when 3
            jankenStr = "パー"
            isAbstention = false
        when 4
            isAbstention = true
    else
            puts "入力に誤りがあります。\n次の数字を半角で入力して下さい。"
            jankenStr, isAbstention = set_janken_status()
    end  
    return jankenStr , isAbstention
end
#１−２　対戦相手じゃんけん処理メソッド
def random_set_opponent_janken_status
    random = Random.new
    jankenStatus = random.rand(1..3)
    case jankenStatus
        when 1
            jankenStr = "グー"
        when 2
            jankenStr = "チョキ"
        when 3
            jankenStr = "パー"
    else
    #no proc
    end  

    return jankenStr
end
#1-3 じゃんけん勝敗判定処理メソッド
def judge_janken_win_lose(myself, opponent)
    if ((myself == "グー") && (opponent == "チョキ")) || ((myself == "チョキ") && (opponent == "パー")) || ((myself == "パー") && (opponent == "グー"))
        jankenWinStatus = Win
    elsif ((myself == "グー") && (opponent == "パー")) || ((myself == "チョキ") && (opponent == "グー")) || ((myself == "パー") && (opponent == "チョキ"))
        jankenWinStatus = Lose
    else
        jankenWinStatus = Draw
    end
    return jankenWinStatus
end



#1-4 あっち向いてホイ入力処理メソッド
def set_hoi_status
    puts "1:上 2:下 3:左 4:右"
    hoiStatus = gets.to_i
    case hoiStatus
        when 1
            hoiStr = "上"
        when 2
            hoiStr = "下"
        when 3
            hoiStr = "左"
        when 4
            hoiStr = "右"
    else
        puts "入力に誤りがあります。\n次の数字を半角で入力して下さい。"
        hoiStr = set_hoi_status()
    end  
    return hoiStr
end

#１−5 対戦相手あっち向いてホイ処理メソッド
def random_set_opponent_hoi_status
    random = Random.new
    hoiStatus = random.rand(1..4)
    case hoiStatus
        when 1
            hoiStr = "上"
        when 2
            hoiStr = "下"
        when 3
            hoiStr = "左"
        when 4
            hoiStr = "右"
    else
    #no proc
    end  

    return hoiStr
end

#メイン処理
puts "これはじゃんけんアプリです"
main()