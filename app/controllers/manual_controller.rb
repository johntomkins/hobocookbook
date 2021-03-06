class ManualController < ApplicationController

  caches_page :manual_section, :manual_subsection
  def self.create_ordered_hash(llist)
    ActiveSupport::OrderedHash[llist]
  end

  COOKBOOK_GITHUB =   "https://github.com/tablatom/hobocookbook/edit/master"
  HOBO_GITHUB =       "https://github.com/tablatom/hobo/edit/master/hobo"
  HOBOFIELDS_GITHUB = "https://github.com/tablatom/hobo/edit/master/hobo_fields"
  HOBOSUPPORT_GITHUB ="https://github.com/tablatom/hobo/edit/master/hobo_support"

  TITLES = self.create_ordered_hash(
   [# ['to-do',        "To Do List"],
    ["toc",               ["Table of Contents", "manual/toc.markdown", Rails.root, COOKBOOK_GITHUB]],
    ["download",          ["Download and Install", "manual/download.markdown", Rails.root, COOKBOOK_GITHUB]],
    ["changes13",         ["Changes in 1.3", "CHANGES-1.3.txt", Hobo.root, HOBO_GITHUB]],
    ["changes14",         ["Changes in 1.4", "CHANGES-1.4.txt", Hobo.root, HOBO_GITHUB]],
    ["faq",               ["FAQ and Misunderstandings", "manual/FAQ.markdown", Rails.root, COOKBOOK_GITHUB]],
    ["hobo_support",      ["Hobo Support", "test/hobosupport.rdoctest", HoboSupport.root, HOBOSUPPORT_GITHUB]],
    ["hobo_fields",       ["Hobo Fields", "test/doc-only.rdoctest", HoboFields.root, HOBOFIELDS_GITHUB]],
    ["scopes",            ["Automatic Named Scopes", "doctests/hobo/scopes.rdoctest", Hobo.root, HOBO_GITHUB]],
    ["permissions",       ["The Permission System", "manual/permissions.markdown", Rails.root, COOKBOOK_GITHUB]],
    ["multi_model_forms", ["Accessible Associations", "doctests/hobo/multi_model_forms.rdoctest", Hobo.root, HOBO_GITHUB]],
    ["users_and_authentication",  ["Users and Authentication", "manual/users_and_authentication.markdown", Rails.root, COOKBOOK_GITHUB]],
    ["model",             ["Miscellaneous Model Extensions", "doctests/hobo/model.rdoctest", Hobo.root, HOBO_GITHUB]],
    ["controllers",       ["Controllers and Routing", "manual/controllers.markdown", Rails.root, COOKBOOK_GITHUB]],
    ["dryml-guide",       ["The DRYML Guide", "manual/dryml-guide.markdown", Rails.root, COOKBOOK_GITHUB]],
    ["ajax",              ["Ajax in Hobo", "manual/ajax.markdown", Rails.root, COOKBOOK_GITHUB]],
    ["lifecycles",        ["Lifecycles", "manual/lifecycles.markdown", Rails.root, COOKBOOK_GITHUB]],
    ["viewhints",         ["View Hints", "manual/viewhints.markdown", Rails.root, COOKBOOK_GITHUB]],
    ["generators",        ["Generators", "manual/generators.markdown", Rails.root, COOKBOOK_GITHUB]],
    ["i18n",              ["Internationalization", "manual/i18n.markdown", Rails.root, COOKBOOK_GITHUB]],
    ["plugins",           ["Creating Plugins", "manual/plugins.markdown", Rails.root, COOKBOOK_GITHUB]],
   ])

  SUBTITLES = {
    "hobo_fields" => self.create_ordered_hash(
     [["rich_types",         ["Rich Types", "test/rich_types.rdoctest", HoboFields.root, HOBOFIELDS_GITHUB]],
      ["api",                ["API", "test/api.rdoctest", HoboFields.root, HOBOFIELDS_GITHUB]],
      ["migration_generator",["Migration Generator", "test/migration_generator.rdoctest", HoboFields.root, HOBOFIELDS_GITHUB]],
      #["generators",         "Generators"],
      #["interactive_primary_key", "Interactive Primary Key"],
      ["migration_generator_comments", ["Migration Generator Comments", "test/migration_generator_comments.rdoctest", HoboFields.root, HOBOFIELDS_GITHUB]]
     ]),
    "hobo_support" => self.create_ordered_hash(
     [["chronic",           ["Chronic", "test/hobosupport/chronic.rdoctest", HoboSupport.root, HOBOSUPPORT_GITHUB]],
      ["enumerable",        ["Enumerable", "test/hobosupport/enumerable.rdoctest", HoboSupport.root, HOBOSUPPORT_GITHUB]],
      ["hash",              ["Hash", "test/hobosupport/hash.rdoctest", HoboSupport.root, HOBOSUPPORT_GITHUB]],
      ["implies",           ["Implies", "test/hobosupport/implies.rdoctest", HoboSupport.root, HOBOSUPPORT_GITHUB]],
      ["metaid",            ["Metaid", "test/hobosupport/metaid.rdoctest", HoboSupport.root, HOBOSUPPORT_GITHUB]],
      ["methodphitamine",   ["Methodphitamine", "test/hobosupport/methodphitamine.rdoctest", HoboSupport.root, HOBOSUPPORT_GITHUB]],
      ["module",            ["Module", "test/hobosupport/module.rdoctest", HoboSupport.root, HOBOSUPPORT_GITHUB]],
      ["xss",               ["XSS", "test/hobosupport/xss.rdoctest", HoboSupport.root, HOBOSUPPORT_GITHUB]],
     ]),
    "generators" => self.create_ordered_hash(
     [["admin_subsite",      ["admin_subsite", "manual/generators/admin_subsite.markdown", Rails.root, COOKBOOK_GITHUB]],
      ["assets",             ["assets", "manual/generators/assets.markdown", Rails.root, COOKBOOK_GITHUB]],
      ["controller",         ["controller", "manual/generators/controller.markdown", Rails.root, COOKBOOK_GITHUB]],
      ["front_controller",   ["front_controller", "manual/generators/front_controller.markdown", Rails.root, COOKBOOK_GITHUB]],
      ["i18n",               ["i18n", "manual/generators/i18n.markdown", Rails.root, COOKBOOK_GITHUB]],
      ["install_plugin",     ["install_plugin", "manual/generators/install_plugin.markdown", Rails.root, COOKBOOK_GITHUB]],
      ["migration",          ["migration", "manual/generators/migration.markdown", Rails.root, COOKBOOK_GITHUB]],
      ["model",              ["model", "manual/generators/model.markdown", Rails.root, COOKBOOK_GITHUB]],
      ["resource",           ["resource", "manual/generators/resource.markdown", Rails.root, COOKBOOK_GITHUB]],
      ["routes",             ["routes", "manual/generators/routes.markdown", Rails.root, COOKBOOK_GITHUB]],
      ["setup_wizard",       ["setup_wizard", "manual/generators/setup_wizard.markdown", Rails.root, COOKBOOK_GITHUB]],
      ["subsite",            ["subsite", "manual/generators/subsite.markdown", Rails.root, COOKBOOK_GITHUB]],
      ["subsite_taglib",     ["subsite_taglib", "manual/generators/subsite_taglib.markdown", Rails.root, COOKBOOK_GITHUB]],
      ["test_framework",     ["test_framework", "manual/generators/test_framework.markdown", Rails.root, COOKBOOK_GITHUB]],
      ["user_controller",    ["user_controller", "manual/generators/user_controller.markdown", Rails.root, COOKBOOK_GITHUB]],
      ["user_mailer",        ["user_mailer", "manual/generators/user_mailer.markdown", Rails.root, COOKBOOK_GITHUB]],
      ["user_model",         ["user_model", "manual/generators/user_model.markdown", Rails.root, COOKBOOK_GITHUB]],
      ["user_resource",      ["user_resource", "manual/generators/user_resource.markdown", Rails.root, COOKBOOK_GITHUB]]])

  }

  def manual_section
    section      = params[:section].gsub(/[^a-z0-9_\-]/, '')
    if TITLES[section].nil?
      redirect_to :action => :index
      return
    end
    filename     = "#{TITLES[section][2]}/#{TITLES[section][1]}"
    @title       = TITLES[section][0]
    @subtitles   = SUBTITLES[section].nil? ? nil : ActiveSupport::OrderedHash[*SUBTITLES[section].map {|k,v| [k, v[0]]}.flatten]
    @content     = HoboFields::Types::MarkdownString.new(File.read(filename))
    @last_update = last_update filename
    @edit_link   = "#{TITLES[section][3]}/#{TITLES[section][1]}"
  end

  def manual_subsection
    section      = params[:section].gsub(/[^a-z0-9_\-]/, '')
    subsection   = params[:subsection].gsub(/[^a-z0-9_\-]/, '')
    if SUBTITLES[section].nil? || SUBTITLES[section][subsection].nil?
      redirect_to :action => :index
      return
    end
    filename     = "#{SUBTITLES[section][subsection][2]}/#{SUBTITLES[section][subsection][1]}"
    @title       = TITLES[section][0]
    @subtitles   = ActiveSupport::OrderedHash[*SUBTITLES[section].map {|k,v| [k, v[0]]}.flatten]
    @current_subtitle    = SUBTITLES[section][subsection][0]
    @content     = HoboFields::Types::MarkdownString.new(File.read(filename))
    @last_update = last_update filename
    @edit_link   = "#{SUBTITLES[section][subsection][3]}/#{SUBTITLES[section][subsection][1]}"
    render :manual_subsection
  end

  def index
    redirect_to :action => "manual_section", :section => "toc"
  end

  def self.titles
    ActiveSupport::OrderedHash[*TITLES.map {|k,v| [k, v[0]]}.flatten]
  end

end

