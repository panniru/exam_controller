class CreateUploadPdfs < ActiveRecord::Migration
  def change
    create_table :upload_pdfs do |t|
      t.string :department
      t.string :file_path

      t.timestamps
    end
  end
end
