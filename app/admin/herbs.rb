ActiveAdmin.register Herb do


  controller do
    def new
      @herb = Herb.new
      @herb.build_culinary
      @herb.build_medicinal
      @herb.build_folk_use
      @herb.build_cosmetic
      @herb.build_other_use
    end
    def edit
      @herb = Herb.find(params[:id])
      if @herb.culinary.blank?
        @herb.build_culinary
      end
      if @herb.medicinal.blank?
        @herb.build_medicinal  
      end
      if @herb.folk_use.blank?
        @herb.build_folk_use 
      end
      if @herb.cosmetic.blank?
        @herb.build_cosmetic
      end
      if @herb.other_use.blank?
        @herb.build_other_use
      end
    end
  end

  # form do |f|
  # 	f.has_many :herb_names do |n|
  # 		n.inputs "Names" do
  # 			n.input :name
  #     	n.input :primary
  #     	n.input :pronunciation
  #     	n.input :name_type, :as => :select
  #     end
  #   end
  #   f.inputs "Herb" do
  #     f.input :description
  #     f.input :history
  #     f.input :family
  #     f.input :cultivation
  #     f.inputs :name => "Medicinal", :for => :medicinal do |med| 
  #       med.input :content,  :label => "Medicinal Uses", :required => true
  #       med.has_many :recipes do |r|
  #         r.inputs "Recipe" do
  #           r.has_many :recipe_ingredients do |i|
  #             i.inputs "Ingredients" do
  #               i.input :quantity
  #               i.input :measure
  #               #if i.object.new_record?
  #               #  i.build_ingredient
  #               #end
  #               #i.input :ingredient
  #               i.input :prep_notes
  #             end
  #           end
  #           r.input :directions
  #         end
  #       end
  #     end 
  #     f.input :properties, :as => :select
  #     f.input :toxicity
  #     f.input :regions, :as => :check_boxes
  #   end
  #   f.inputs :name => "Culinary", :for => :culinary do |cul| 
  #     cul.input :content,  :label => "Culinary Uses"
  #   end 
  #   f.inputs :name => "Cosmetic", :for => :cosmetic do |cos| 
  #     cos.input :content,  :label => "Cosmetic Uses"
  #   end 
  #   f.inputs :name => "Folk", :for => :folk_use do |folk| 
  #     folk.input :content,  :label => "Folk Uses"
  #   end 
  #   f.inputs :name => "Other", :for => :other_use do |other| 
  #     other.input :content,  :label => "Other Uses"
  #   end 

  #   f.actions
  # end

  form :partial => "herb_form_for"

  show :title => :page_title do
  	panel "Names" do
      table_for(herb.herb_names) do
        column("Name") do |n|
          n.name
        end
        column("Pronunciation") do |n|
          n.pronunciation
        end
        column("Name Type") do |n|
          n.name_type
        end	
        column("Primary") do |n|
          n.primary
        end
      end
    end
 	div do
   	  simple_format herb.description
    end
    panel "Regions" do
      table_for(herb.regions) do
        column("region") do |r|
          r.region_name
        end 
      end
    end
  end

  def herb_name_title
  	self.herb_names.each { |n|
		if n.primary = true
			return n.name
		end
	}
  end

end
