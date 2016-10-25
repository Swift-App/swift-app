# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!([{email: 'admin@example.com', password: 'password', password_confirmation: 'password'},{email: 'aadeshere1@gmail.com', password: 'helloworld', password_confirmation: 'helloworld'}]) unless AdminUser.any?

Job.create([
            { title: "簡単作業！！ピッキング",
              description: "創業86年以上の地元大手歯科診療所での受付・事務アシスタント。
                            医師・歯科衛生士・歯科助手の方のサポートが必要になり追加募集です。
                            医院歴が長いため、業務サポートも万全です。10:00～の勤務可能ですので朝も余裕があります。
                            予約対応・確認、カルテの整理・対応、事務処理、患者の方の案内など（レセプト業務は含まれません。）が主な業務になりますので未経験でも安心してご応募下さいね。
                            歯科医院でのアルバイト経験をお持ちの方、歯科助手などの資格をお持ちの方優遇します。

                            急募になりますので時間帯・シフト調整必要な方はお気軽に相談下さい。",
              pay_amount: "1000円 ~/時給",
              job_type: "人材派遣",
              content: "歯科診療所での受付及び付随業務全般",
              location: "大阪市天王寺区",
              nearest_station: "各線鶴橋駅から徒歩２分",
              number_of_positions: "1人",
              work_date: "シフト",
              hours: "10:00～17:00、9:00～19:00、10:00～20:00など、要相談",
              holidays: "シフトによる",
              certifications_and_experience: "未経験可 オフィスマナーをお持ちの方 初歩的なＰＣ入力が可能な方",
              benefits: "月162時間以内のシフト制（お休み：日・祝・隔週土曜日）※相談下さい。",
              employment_type: "人材派遣",
              person_in_charge: "高橋　06-6376-4400",
              remarks: "シフトは原則月～金＋隔週土曜日出勤ですが、急募の為ご相談可能です。
                        歯科医院でのアルバイト経験者の方、歯科助手の資格をお持ちの方など優遇します。
                        お気軽にお問合せ下さいね。",
              branch_in_charge: "〒530-0012　大阪市北区芝田1-4-14　芝田町ビル4F",
              pay_range: "pay range",
              area: "tokyo",
              duration: "2 days",
              category: "category",
              shift_category: "Shift category"
            },
            { title: "簡単作業！！ピッキング",
              description: "創業86年以上の地元大手歯科診療所での受付・事務アシスタント。
                            医師・歯科衛生士・歯科助手の方のサポートが必要になり追加募集です。
                            医院歴が長いため、業務サポートも万全です。10:00～の勤務可能ですので朝も余裕があります。
                            予約対応・確認、カルテの整理・対応、事務処理、患者の方の案内など（レセプト業務は含まれません。）が主な業務になりますので未経験でも安心してご応募下さいね。
                            歯科医院でのアルバイト経験をお持ちの方、歯科助手などの資格をお持ちの方優遇します。

                            急募になりますので時間帯・シフト調整必要な方はお気軽に相談下さい。",
              pay_amount: "1000円 ~/時給",
              job_type: "人材派遣",
              content: "歯科診療所での受付及び付随業務全般",
              location: "大阪市天王寺区",
              nearest_station: "各線鶴橋駅から徒歩２分",
              number_of_positions: "1人",
              work_date: "シフト",
              hours: "10:00～17:00、9:00～19:00、10:00～20:00など、要相談",
              holidays: "シフトによる",
              certifications_and_experience: "未経験可 オフィスマナーをお持ちの方 初歩的なＰＣ入力が可能な方",
              benefits: "月162時間以内のシフト制（お休み：日・祝・隔週土曜日）※相談下さい。",
              employment_type: "人材派遣",
              person_in_charge: "高橋　06-6376-4400",
              remarks: "シフトは原則月～金＋隔週土曜日出勤ですが、急募の為ご相談可能です。
                        歯科医院でのアルバイト経験者の方、歯科助手の資格をお持ちの方など優遇します。
                        お気軽にお問合せ下さいね。",
              branch_in_charge: "〒530-0012　大阪市北区芝田1-4-14　芝田町ビル4F",
              pay_range: "pay range",
              area: "tokyo",
              duration: "2 days",
              category: "category",
              shift_category: "Shift category"
            }
          ])AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')