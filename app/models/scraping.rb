### 初期設定 ###
class Scraping
  def self.car_urls
    links = []
    agent = Mechanize.new
    next_url = ""
    num = 0

    while num < 1 do
      num += 1
      current_page = agent.get("http://www.carsensor.net/usedcar" + next_url)
      #next_urlにはページネーション値である/index2(3.4.5..).htmlが入る
      elements = current_page.search('.casetMedia__body h3 a')
      elements.each do |ele|
        links << ele[:href].split('/usedcar')[1]
        #linksには各詳細ページ末尾urlの/detail/CU5028373506/index.html?TRCD=200002 ×20が入る
      end

      dom = current_page.at('.pager__btn .pager__btn__next')
      next unless dom
      next_link = dom.attributes["onclick"].value
      break unless next_link
      next_url = next_link.split("location.href='/usedcar")[1].split("';return false;")[0]
    end
    links.each do |link|
      get_product('http://www.carsensor.net/usedcar' + link)#これが下のlink2なる
    end
  end

  def self.car_name_scraping(url)
    agent = Mechanize.new
    maker = Maker.find()#引数にidを設定
    current_page = agent.get(url)
    car_label = current_page.search('.label--checkbox')
    car_label.each do |c|
      car_type = maker.car_types.build
      car_type.name = c.text.gsub(/\(.+\)/, "")
      car_type.save
    end
  end

  private

  def self.get_product(link2)
    Car.new.save(:validate => false)
    car   = Car.last
    agent = Mechanize.new
    page  = agent.get(link2)
    get_car(page, car)
    get_image(page, car)
    get_condition(page, car)
    get_spec(page, car)
    get_new_car_spec(page, car)
    get_equipment(page, car)
  end

  def self.get_car(page, car)
    if page.present? && page.search('.specWrap__box').present?
      maker_name             = page.search('.breadcrumb__ul li')[2].text.strip.gsub("の中古車", "")
      car_type_name          = page.search('.breadcrumb__ul li')[3].text.strip.gsub("の中古車", "")
      car.maker_id           = Maker.find_by_name(maker_name).id if maker_name
      car.car_type_id        = CarType.find_by_name(car_type_name).id if car_type_name
      car.vehicle_inspection = page.search('.specWrap__box')[2].children[3].text
      car.name               = page.search('.title1').text
      car.base_price         = page.at('.basePrice .basePrice__price').children.children.inner_text
      car.total_price        = page.at('.totalPrice .totalPrice__price').children.children.inner_text
      car.model_year         = page.at('.specWrap__box .specWrap__box__num').inner_text
      car.mileage            = page.search('.specWrap__box .specWrap__box__num')[1].inner_text
      car.repaired           = page.search('.specWrap__box')[3].search('p')[1].inner_text
      car.district           = page.search('.specWrap__box')[4].search('p')[1].inner_text
      car.store_name         = page.search('.sideDetailInfo__contents__inner a').inner_text
      car.region             = page.search('.sideDetailInfo__contents__inner').search('p')[1].children.inner_text.split("住所：")[1]
      car.displacement       = page.search('.defaultTable__description')[23].inner_text
      pre_car_url            = page.search('.actionBtnWrap button.btnAct--inquiry')[1].values
      car.url                = pre_car_url[1].split("{\"ptn\":\"INQ\",\"hf\":\"")[1].split("\",\"no\":\"2\"}")[0]
      car.save(:validate => false)
    end
  end

  def self.get_spec(page, car)
    if page.present? && page.search('td.defaultTable__description').present?
      spec = car.specs.build
      spec.body_type          = page.search('td.defaultTable__description')[17].inner_text
      spec.drive_system       = page.search('td.defaultTable__description')[18].inner_text
      spec.color              = page.search('td.defaultTable__description')[19].inner_text
      spec.handle             = page.search('td.defaultTable__description')[20].inner_text
      spec.last_number        = page.search('td.defaultTable__description')[21].inner_text
      spec.mission            = page.search('td.defaultTable__description')[22].inner_text
      spec.displacement       = page.search('td.defaultTable__description')[23].inner_text
      spec.passenger_capacity = page.search('td.defaultTable__description')[24].inner_text
      spec.engine_type        = page.search('td.defaultTable__description')[25].inner_text
      spec.door               = page.search('td.defaultTable__description')[26].inner_text
      spec.save(:validate => false)
    end
  end

  def self.get_condition(page, car)
    if page.present? && page.search('td.defaultTable__description').present?
      condition = car.conditions.build
      condition.periodic_Inspection_record_book = page.search('td.defaultTable__description')[6].inner_text
      condition.registered_unused = page.search('td.defaultTable__description')[11].inner_text
      condition.model_year        = page.search('td.defaultTable__description')[0].inner_text
      condition.one_owner         = page.search('td.defaultTable__description')[1].inner_text
      condition.mileage           = page.search('td.defaultTable__description')[2].inner_text
      condition.camper            = page.search('td.defaultTable__description')[3].inner_text
      condition.repaired          = page.search('td.defaultTable__description')[4].inner_text
      condition.welfare           = page.search('td.defaultTable__description')[5].inner_text
      condition.new_property      = page.search('td.defaultTable__description')[7].inner_text
      condition.non_smoking       = page.search('td.defaultTable__description')[8].inner_text
      condition.regular_imported  = page.search('td.defaultTable__description')[9].inner_text
      condition.recycling_fee     = page.search('td.defaultTable__description')[10].inner_text
      condition.eco_car           = page.search('td.defaultTable__description')[12].inner_text

      # 下の3カテゴリーに空白ができてしまう <br>タグを抜く必要があるかもしれない
      condition.inspection            = page.search('td.defaultTable__description')[14].inner_text
      condition.statutory_maintenance = page.search('td.defaultTable__description')[15].inner_text
      condition.security              = page.search('td.defaultTable__description')[16].inner_text
      condition.save(:validate => false)
    end
  end

  def self.get_new_car_spec(page,car)
    if page.present? && page.search('td.defaultTable__description').present?
      new_car_spec                = car.new_car_specs.build
      new_car_spec.release_date   = page.search('td.defaultTable__description')[42].inner_text
      new_car_spec.wheelbase      = page.search('td.defaultTable__description')[43].inner_text
      new_car_spec.body_dimension = page.search('td.defaultTable__description')[44].inner_text
      new_car_spec.used_fuel      = page.search('td.defaultTable__description')[45].inner_text
      new_car_spec.seat_num       = page.search('td.defaultTable__description')[46].inner_text
      new_car_spec.vehicle_weight = page.search('td.defaultTable__description')[47].inner_text
      new_car_spec.indoor         = page.search('td.defaultTable__description')[48].inner_text
      new_car_spec.drive_system   = page.search('td.defaultTable__description')[49].inner_text
      new_car_spec.fuel_jc08      = page.search('td.defaultTable__description')[50].inner_text
      new_car_spec.turning_radius = page.search('td.defaultTable__description')[51].inner_text if page.search('td.defaultTable__description')[51].present?
      new_car_spec.fuel_1015      = page.search('td.defaultTable__description')[52].inner_text if page.search('td.defaultTable__description')[52].present?
      new_car_spec.save(:validate => false)
    end
  end

  def self.get_image(page, car)
    if page.present? && page.search('.subSliderMain__inner__set li a img').present?
      car_image_url = page.search('.subSliderMain__inner__set li a img')
      count = car_image_url.count
      car_image_url.each_with_index do |c, i|
        next if i == 0 || i == count - 1
        url = c.attributes["src"].value
        car_image = car.car_images.build
        if url[-5] == "S"
          url[-5] = "L"
          car_image.url = url
        else
          size = - + url.split("/").last.size
          url[size] = ""
          car_image.url = url
        end
        car_image.save
      end
    end
  end

  def self.get_equipment(page, car)
    if page.present? && page.search('.equipmentList__item--active').present?
      euipment_list = page.search('.equipmentList__item--active')
      euipment_list.each do |e|
        equipment = car.equipments.build
        equipment.name = e.text
        equipment.save
      end
    end
  end
end