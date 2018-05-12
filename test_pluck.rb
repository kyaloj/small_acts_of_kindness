begin
  require "bundler/inline"
rescue LoadError => e
  $stderr.puts "Bundler version 1.10 or later is required. Please update your Bundler"
  raise e
end

gemfile(true) do
  source "https://rubygems.org"

  git_source(:github) { |repo| "https://github.com/#{repo}.git" }

  # Activate the gem you are reporting the issue against.
  gem "activerecord", "5.2.0"
  gem "sqlite3"
end

require "active_record"
require "minitest/autorun"
require "logger"

# Ensure backward compatibility with Minitest 4
Minitest::Test = MiniTest::Unit::TestCase unless defined?(Minitest::Test)

# This connection will do for database-independent bug reports.
ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Schema.define do
  create_table :posts, force: :true do |t|
    t.string :content
    t.string :author_id
  end

  create_table :authors, id: :string, force: :true do |t|
    t.string :name
  end
end

class Post < ActiveRecord::Base
  belongs_to :author
end

class Author < ActiveRecord::Base
end

class BugTest < Minitest::Test
  def test_relation_pluck
    author = Author.create!(id: "Author 1", name: "Maupassant")
    post = Post.create!(content: "Horla", author_id: author.id)
    relation = Post.includes(:author)
    assert_equal [author.name], relation.pluck(Arel.sql("authors.name"))
    assert_equal [author.id], relation.pluck(Arel.sql("authors.id"))
  end
end