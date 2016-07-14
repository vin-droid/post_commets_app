ActiveAdmin.register User do



menu :priority => 2
config.batch_actions = true
#	actions :all, :except => [:new,:edit,:destroy]
index do
	selectable_column
	column :email
	column :f_name
	column :l_name
	column :image do |img|
		image_tag img.image_url(:admin_index)
	end
	column :created_at
	actions
end


  filter :email
  filter :f_name
  show do |ad|
		  	attributes_table do	 
		  		row  :email 
		  		row  :f_name
		  		row  :l_name
		  		row  :image do |img|
		  			image_tag img.image_url(:admin_show)
		  		end
		  		row  :created_at
		  	end
        end
end




#   batch_action :notification, form: 
#   {
#   #type: %w[Offensive Spam Other],
#   message:  :textarea
#   } do |ids, inputs|
#   # inputs is a hash of all the form fields you requested
#    AdminUser.broadcast_msg_notification(ids , inputs[:message]) 
#   redirect_to collection_path, notice: "successfully send to users"
# end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
