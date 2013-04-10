ActiveAdmin.register Property do
  
  form do |f|
    f.inputs "Property" do
      f.input :property_type
    end
    f.actions
  end

end
