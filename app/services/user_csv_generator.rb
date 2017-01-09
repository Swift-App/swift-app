class UserCsvGenerator
  HEADERS = %w(登録番号 氏名 フリガナ 沿線コード 駅コード 最寄到着時間 ランク ＴＥＬ ＴＥＬ２  FAX Email 性別  郵便番号  住所  扶養家族  車両  支払方法  銀行口座データ 銀行口座表記  備考欄 備考２ 貸出し注意 広告  マナー 言葉使い  定番希望  ピアス ひげ  頭髪ランク 同居人 Tシャツ  トレーナー 作業ズボン 自動車免許 フォーク免許  引越希望  工場希望  PC希望  販売希望  倉庫希望  事務希望  配送希望  イベント希望  サンプリング希望  ホール希望 引越経験  工場経験  PC経験  建築経験  販売経験  倉庫経験  事務経験  配送経験  イベント経験  サンプリング経験  ホール経験 スーツ 作業着 黒ズボン  チノパン  白シャツ  ヘルメット 革靴  安全靴 生年月日  身長  体重  血液型 ウエスト  靴 追っかけ  写真  登録日 登録支店  雇用契約日 雇用失効日 昼間学生  高齢者 収入500 NO生計者)

  def initialize(user)
    @user = user
  end

  def generate!
    CSV.generate(headers: true) do |csv|
      csv << HEADERS

      content = []

      content << @user.unique_id
      content << @user.name
      content << @user.name_katakana
      content << "" # 沿線コード
      content << "" # 駅コード
      content << "" # 最寄り到着時間
      content << "" #ランク
      content << @user.phone
      content << "" # TEL2
      content << "" # FAX
      content << @user.email
      content << @user.gender
      content << @user.postal_code
      content << @user.address
      content << "" # 扶養家族
      content << "" # 車輛
      content << "" # 支払い方法
      content << "" # 銀行口座データ
      content << "" # 銀行口座表記
      content << "" # 備考欄
      content << "" # 備考2
      content << "" # 貸し出し注意 
      content << "" # 広告
      content << "" # マナー違反
      content << "" # 言葉遣い
      content << "" # 定番希望
      content << "" # ピアス
      content << "" # ひげ
      content << "" # 頭髪ランク
      content << "" # 同居人
      content << "" # Tシャツ
      content << "" # トレーナー
      content << "" # 作業ズボン
      content << "" # 自動車免許
      content << "" # フォーク免許

      request_moving_assistant = @user.request_moving_assistant == true ? "TRUE" : "FALSE"
      content <<  request_moving_assistant# 引っ越し      
      content << "" # 工場希望
      content << "" # PC希望

      request_sales = @user.request_sales == true ? "TRUE" : "FALSE"
      content << request_sales
      content << "" # 倉庫希望
      content << "" # 事務希望

      request_assistant_distribution = @user.request_assistant_distribution == true ? "TRUE" : "FALSE"
      content << request_assistant_distribution
      content << "" # イベント希望

      request_sampling = @user.request_sampling == true ? "TRUE" : "FALSE"
      content << request_sampling

      request_hall = @user.request_hall == true ? "TRUE" : "FALSE"
      content << request_hall
      content << "" # 引越し経験
      content << "" # 工場経験
      content << "" # PC経験
      content << "" # 建築経験
      content << "" # 販売経験
      content << "" # 倉庫経験
      content << "" # 事務経験
      content << "" # 配送経験
      content << "" # イベント経験
      content << "" # サンプリング経験
      content << "" # ホール経験
      content << "" # スーツ
      content << "" # 作業着
      content << "" # 黒ズボン
      content << "" # チノパン
      content << "" # 白シャツ
      content << "" # ヘルメット
      content << "" # 革靴
      content << "" # 安全靴
      content << @user.birthday.strftime("%-m/%-d/%y")
      content << "" # 身長
      content << "" # 体重
      content << "" # 血液型
      content << "" # ウエスト
      content << "" # 靴
      content << "" # 追っかけ
      content << "" # 写真
      content << @user.created_at.strftime("%-m/%-d/%y") # 登録日
      content << "" # 登録支店
      content << "" # 雇用契約日
      content << "" # 雇用失効日

      daytime_student = @user.daytime_student == true ? "TRUE" : "FALSE" # 昼間学生
      content << daytime_student

      elder = @user.elder == true ? "TRUE" : "FALSE" # 高齢者
      content << elder

      earnings_over_500 = @user.earnings_over_500 == true ? "TRUE" : "FALSE" # 収入500
      content << earnings_over_500

      householder_present = !@user.householder_present == true ? "TRUE" : "FALSE" # NO生計者
      content << householder_present

      csv << content
    end
  end
end