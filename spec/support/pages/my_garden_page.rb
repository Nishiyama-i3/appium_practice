class MyGardenPage
  #（1）表示されているかどうか#ここでは指定した１つの要素が存在するかで判断をしている
  def displayed?
    flag = exists { navigate_button }
    #このメソッドを呼び出すとMyGardenPage.pngというファイル名の#スクリーンショットが保存されます
    screenshot("#{self.class.name}.png")
    
    flag
  end

  def plant_added?
    flag = exists { plant_image }
    #このメソッドを呼び出すとMyGardenPage.pngというファイル名の#スクリーンショットが保存されます
    screenshot("PlantImage.png")
    
    flag
  end
  ##操作#（2）plantリストページを開く
  def go_to_menu
    navigate_button.click
    Menu.new()
  end
  private
  ## UI要素
  def navigate_button
    find_element(accessibility_id: "Navigate up")
  end

  def plant_image
    find_elements(accessibility_id: 'Picture of plant')
  end
end