ActiveAdmin.register HerbName do

  form do |f|
    f.inputs "Herb Name" do
      f.input :name
      f.input :primary
      f.input :pronunciation
      f.input :name_type, :as => :select
    end
    f.buttons
  end
end
