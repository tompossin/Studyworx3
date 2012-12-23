class AddAttachmentLogoHeaderFeaturedToSchools < ActiveRecord::Migration
  def self.up
    change_table :schools do |t|
      t.has_attached_file :logo
      t.has_attached_file :header
      t.has_attached_file :featured
    end
  end

  def self.down
    drop_attached_file :schools, :logo
    drop_attached_file :schools, :header
    drop_attached_file :schools, :featured
  end
end
