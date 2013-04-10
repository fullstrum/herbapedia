class Herb < ActiveRecord::Base

	has_and_belongs_to_many :regions, :join_table => :herbs_regions
	has_and_belongs_to_many :properties, :join_table => :herbs_properties
	has_many :herb_names
	has_one :cosmetic
	has_one :culinary
	has_one :folk_use
	has_one :medicinal
	has_one :other_use


	attr_accessible :description, :history, :toxicity, :family,
	   :cultivation, :region_ids, :herb_names_attributes, :property_ids,
	   :medicinal_attributes, :culinary_attributes, :folk_use_attributes,
	   :cosmetic_attributes, :other_use_attributes
	accepts_nested_attributes_for :herb_names
	accepts_nested_attributes_for :properties
	accepts_nested_attributes_for :culinary
	accepts_nested_attributes_for :medicinal
	accepts_nested_attributes_for :folk_use
	accepts_nested_attributes_for :cosmetic
	accepts_nested_attributes_for :other_use

	before_save :format_text_entry
	#after_initialize :add_nested_attributes

	def add_nested_attributes
	  self.culinary ||= culinary.new
	end


	def format_text_entry
		#Remove New Line chars from text, unless newline repeated (allows for paragraph)
		self.description = description.gsub(/(?<!\r\n)\r\n(?!\r\n)/, " ")
	end

	def page_title
		self.herb_names.each { |n|
			if n.primary == true
				@page_title = n.name
			end
		}

		if @page_title.nil?
			return "Herb"
		else
			return @page_title
		end
	end
end
