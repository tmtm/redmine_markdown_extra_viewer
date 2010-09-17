require 'redmine'
require 'bluefeather'

RepositoriesController.class_eval do
  alias markdown_extra_viewer_orig_entry entry
  def entry
    markdown_extra_viewer_orig_entry
    if not performed? and @path =~ /\.(md|markdown)\z/
      @content = BlueFeather.parse @content
      render :action => "entry_markdown"
    end
  end
end

Redmine::Plugin.register :redmine_markdown_extra_viewer do
  name 'Redmine Markdown Extra Viewer plugin'
  author 'TOMITA Masahiro'
  description 'Redmine show Markdown Extra in repository'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://github.com/tmtm'
end
