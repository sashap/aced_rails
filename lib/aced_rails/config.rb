module AcedRails
  def self.configure
    yield Config
  end

  module Config
    mattr_accessor  :themes,
                    :keybindings,
                    :modes,
                    :type,
                    :uncompressed_envs,
                    :extensions,
                    :addons

    @@themes = @@keybindings = @@modes = @@extensions = @@addons = []
    @@type = :normal
    @@uncompressed_envs = ['development']

    def self.get_assets_files
      prefix = 'src-min'
      if @@type == :noconflict
        prefix = 'src-min-noconflict'
      end

      if @@uncompressed_envs.include?(Rails.env)
        prefix = 'src'
      end

      result = ["aced-api.js", "jquery.random.js", "ace/#{prefix}/ace.js"]

      @@themes.each do |theme|
        result << "ace/#{prefix}/theme-#{theme}.js"
      end
      @@keybindings.each do |keybinding|
        result << "ace/#{prefix}/keybinding-#{keybinding}.js"
      end
      @@modes.each do |mode|
        result << "ace/#{prefix}/mode-#{mode}.js"
      end
      
      @@extensions.each do |ext|
        result << "ace/#{prefix}/ext-#{ext}.js"
      end

      @@addons.each do |addon|
        result << "ace/ace-#{addon}.js"
      end

      result
    end
    
  end
end