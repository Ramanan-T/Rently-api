ActiveAdmin.register Company do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :company_name, :company_contact, :company_address
  #
  # or
  #
  # permit_params do
  #   permitted = [:company_name, :company_contact, :company_address]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  filter :company_name
  index do
    selectable_column
    id_column
    column :company_name
    column :company_contact
    column :company_address
    column :created_at
    actions
  end
  form do |f|
    f.inputs :company_contact, :company_name,:company_address
   
   actions
  end
end
