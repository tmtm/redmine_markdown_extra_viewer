require 'redmine'
require 'bluefeather'

module Redmine::SyntaxHighlighting::BlueFeather
  def self.set_highlighter
    @orig_highlighter = Redmine::SyntaxHighlighting.highlighter
    Redmine::SyntaxHighlighting.highlighter = self
  end

  def self.highlight_by_filename(text, filename)
    if filename =~ /\.(md|markdown)\z/
      ::BlueFeather.parse text
    else
      @orig_highlighter.highlight_by_filename(text, filename)
    end
  end

  def self.highlight_by_language(text, language)
    @orig_highlighter.highlight_by_filename(text, filename)
  end
end

Redmine::Plugin.register :redmine_markdown_extra_viewer do
  name 'Redmine Markdown Extra Viewer plugin'
  author 'TOMITA Masahiro'
  description 'Redmine show Markdown Extra in repository'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://github.com/tmtm'

  Redmine::SyntaxHighlighting::BlueFeather.set_highlighter
end

