class PlantDetailsPage
  def displayed?
    flag = exists { add_button }
    #このメソッドを呼び出すとMyGardenPage.pngというファイル名の#スクリーンショットが保存されます
    screenshot("#{self.class.name}.png")
    
    flag
  end
  ##操作#（2）plantリストページを開く
  def back_to_plant_list
    back_to_plant_list_button.click
    PlantListPage.new()
  end

  def add_button_tap
    add_button.click
  end
  private
  ## UI要素
  def back_to_plant_list_button
    find_element(accessibility_id: "Navigate up")
  end

  def add_button
    find_element(id: "com.google.samples.apps.sunflower:id/fab")
  end
end