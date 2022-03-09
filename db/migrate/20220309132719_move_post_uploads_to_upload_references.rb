# frozen_string_literal: true

class MovePostUploadsToUploadReferences < ActiveRecord::Migration[6.1]
  def up
    execute <<~SQL
      INSERT INTO upload_references(upload_id, target_type, target_id)
      SELECT upload_id, 'Post', post_id
      FROM post_uploads
    SQL
  end

  def down
  end
end
