ActiveAdmin.register User do

  index do
    column :firstName
    column :lastName
    column :email
    column :admin
    default_actions
  end

  form do |f|
    f.inputs "User Details" do
      f.input :firstName
      f.input :lastName
      f.input :email
      f.input :admin, :label => "Administrator"
      f.input :groups, :as => :check_boxes

    end

    f.buttons
  end

  filter :firstName
  filter :lastName
  filter :email
  filter :admin

  create_or_edit = Proc.new {
    @user            = User.find_or_create_by_id(params[:id])
    @user.admin = params[:user][:admin]
    @user.attributes = params[:user].delete_if do |k, v| 
      (k == "admin") ||
      (["password", "password_confirmation"].include?(k) && v.empty? && !@user.new_record?)
    end
    if @user.save
      redirect_to :action => :show, :id => @user.id
    else
      render active_admin_template((@user.new_record? ? 'new' : 'edit') + '.html.erb')
    end
  }
  member_action :create, :method => :post, &create_or_edit
  member_action :update, :method => :put, &create_or_edit


  show do
    panel "Groups" do
      table_for(user.user_groups) do
        column("group") do |g|
          g.group.group_name
        end 
      end
    end
  end

end
