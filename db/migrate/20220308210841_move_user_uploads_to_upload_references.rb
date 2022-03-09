# frozen_string_literal: true

class MoveUserUploadsToUploadReferences < ActiveRecord::Migration[6.1]
  def up
    execute <<~SQL
      INSERT INTO upload_references(upload_id, target_type, target_id)
      SELECT upload_id, 'User', user_id
      FROM user_uploads
    SQL
  end

  def down
  end
end
