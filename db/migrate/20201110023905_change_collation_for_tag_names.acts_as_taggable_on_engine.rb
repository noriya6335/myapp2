# timestamps_acts_as_taggable_on_migration.acts_as_taggable_on_engine.rb
# This migration comes from acts_as_taggable_on_engine (originally 5)
# This migration is added to circumvent issue #623 and have special characters
# work properly
if ActiveRecord.gem_version >= Gem::Version.new('5.0')
  class ChangeCollationForTagNames < ActiveRecord::Migration[4.2]; end
else
  class ChangeCollationForTagNames < ActiveRecord::Migration; end
end
ChangeCollationForTagNames.class_eval do
  def up
    execute("ALTER TABLE tags MODIFY name varchar(255) CHARACTER SET utf8 COLLATE utf8_bin;") if ActsAsTaggableOn::Utils.using_mysql?
  end
end