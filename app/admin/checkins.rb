ActiveAdmin.register Checkin do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :renter_id, :property_id, :serial_code
  #
  # or
  #
  # permit_params do
  #   permitted = [:renter_id, :property_id, :serial_code]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs :renter_id,:property_id,:serial_code
    actions
    end
end
