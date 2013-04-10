ActiveAdmin.register Group do
  
  form do |f|
    f.inputs "Group" do
      f.input :group_name
      f.input :regions, :as => :check_boxes
    end
    f.buttons
  end

  show do
    panel "Regions" do
      table_for(group.regions) do
        column("region") do |r|
          r.region_name
        end 
      end
    end
  end

end
