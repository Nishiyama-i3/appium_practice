module ConfigHelper
  def caps
    {
      automationName:'uiautomator2',
      platformName:'Android',
      disableWindowAnimation: true,
      deviceName:'Android Emulator',
      app:ENV['APP_PATH'] || "./#{Dir['*.apk'].last}",
      unicodeKeyboard:  true,
      newCommandTimeout: 600,
      fullReset: true,
      avd: "Pixel_3a_API_30_x86"
    }
  end

  def capability
    appium_lib = {
      appium_lib: {
        wait: 40
      }
    }

    {
      caps: caps
    }.merge(appium_lib)
  end

  def environment
    ENV['ENVIRONMENT'] || 'development'
  end

  def config_file
    File.join("#{PROJECT_ROOT}", "config/#{environment}.yml")
  end

  def asset_file
    File.join("#{PROJECT_ROOT}", "config/asset-#{environment}.yml")
  end
end