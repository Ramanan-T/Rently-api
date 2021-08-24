ActiveAdmin.register Code do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
 
  #
  # or
  #
  # permit_params do
  #   permitted = [:code, :smartlock_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    
    column :smartlock
    column :code
    column :created_at
    column :updated_at
    actions
  end
  permit_params :code,:smartlock_id
 filter :smartlock_serial_num,:as=>:string
  form do |f|
    f.inputs :code ,:smartlock_id
   actions
  end
end
