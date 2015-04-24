class AddAttachmentBunnerToImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer     :location_id
      t.integer     :max_show
      t.integer     :showed       , default: 0
      t.integer     :clicked      , default: 0
      t.attachment  :banner
    end
  end
end
