ActiveAdmin.register PaymentReservation do


  index do
    selectable_column
    column :created_at do |reservation|
      reservation.created_at.strftime("%m/%d/%Y %l:%M %p")
    end
    column :user do |reservation|
      reservation.user_unique_id
    end        
    column :date_1 do |reservation|
      reservation.date_1.try(:strftime, ("%m/%d/%Y")) || "無し"
    end
    column :date_2 do |reservation|
      reservation.date_2.try(:strftime, ("%m/%d/%Y")) || "無し"
    end
    column :date_3 do |reservation|
      reservation.date_3.try(:strftime, ("%m/%d/%Y")) || "無し"
    end
    column :date_4 do |reservation|
      reservation.date_4.try(:strftime, ("%m/%d/%Y")) || "無し"
    end
    column :date_5 do |reservation|
      reservation.date_5.try(:strftime, ("%m/%d/%Y")) || "無し"
    end
    column :comments
  end

  filter :created_at
  filter :user
  filter :date_1
  filter :date_2
  filter :date_3
  filter :date_4
  filter :date_5

end
