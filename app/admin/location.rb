ActiveAdmin.register Location do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :url, images_attributes: [:id, :banner, :max_show, :url, :_destroy]

  form html: {enctype: 'multipart/form-data'} do |f|
    f.inputs "Details" do
      f.input :name
      f.input :url
    end

    f.inputs do
      f.has_many :images, allow_destroy: true, heading: 'Images' do |cf|
        cf.input :banner, as: :file
        cf.input :max_show
      end
    end
    f.actions
  end

  show do |location|
    attributes_table do

      row :name
      row :id
      row :url do |location|
        link_to location.url
      end
      row :created_at

      if location.images.present?
        location.images.each do |image|
          row "Image ID #{image.id}" do
            link_to((image_tag image.banner.url(:thumb)), image.banner.url)
          end
          row :max_show do
            image.max_show
          end
          row :showed do
            image.showed
          end
          row :clicked do
            image.clicked
          end
        end
      end

    end
  end

end
