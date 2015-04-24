ActiveAdmin.register_page 'Dashboard' do

  menu priority: 1, label: proc{ I18n.t('active_admin.dashboard') }

  content title: proc{ I18n.t('active_admin.dashboard') } do

    section 'Locations:' do
      table_for Location.all do
        column :name
        column :url do |location|
          link_to location.url
        end
        column 'Adding Date', :created_at
       end
    end

  end

  action_item :view_site do
    link_to 'View Site', '/'
  end

end
