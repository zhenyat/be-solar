begin
  if (Category.present? and not Category.exists?)
    backpacks_and_bags = Category.create(
      name:     'backpacks_and_bags', 
      title:    'Рюкзаки и экосумки из конопли',
      abstract: 'Продуманные рюкзаки и сумки из конопли. Экологичные авоськи. Эргономичные сумки на пояс.',
      url:      'ryukzaki-i-ekosumki-iz-konopli',
      seo_title: 'Рюкзаки и экосумки из конопли',
      seo_description: 'Продуманные рюкзаки и сумки из конопли. Экологичные авоськи. Эргономичные сумки на пояс',
      seo_keywords:    'рюкзак,сумка,сумка на пояс,конопля,hemp,багмати,экологичные сумки,сумка купить Москва,конопляная сумка купить Москва'
    )
    backpacks = Category.create(
      parent:   backpacks_and_bags,
      name:     'backpacks', 
      title:    'Рюкзаки из конопли',
      abstract: 'Стильные рюкзаки, удобные для любого возраста',
      url:      'ryukzaki-iz-konopli',
      seo_title: 'Рюкзаки из конопли',
      seo_description: 'Стильные рюкзаки из конопли',
      seo_keywords:    'рюкзак из конопли купить Москва, hemp backpack, рюкзак купить Москва'
    )
    bags = Category.create(
      parent:   backpacks_and_bags,
      name:     'bags', 
      title:    'Сумки из конопли',
      abstract: 'Сумки, изготовленные из конопли',
      url:      'sumki-iz-konopli',
      seo_title: 'Сумки из конопли',
      seo_description: 'Сумки, изготовленные из конопли',
      seo_keywords:    'Сумка из конопли купить Москва, hemp bag, сумка купить Москва'
    )
    belt_bags = Category.create(
      parent:   backpacks_and_bags,
      name:     'belt_bags', 
      title:    'Сумки на пояс из конопли',
      abstract: 'Сумки различных расцветок, изготовленные из конопли',
      url:      'sumki-na-poyas-iz-konopli',
      seo_title: 'Сумки на пояс из конопли',
      seo_description: 'Сумки на пояс, изготовленные из конопли',
      seo_keywords:    'Сумка на пояс из конопли купить Москва, hemp belt bag, сумка на пояс купить Москва'
    )

    clothing = Category.create(
      name:     'clothing', 
      title:    'Одежда',
      abstract: 'Одежда из конопляных материалов',
      url:      'odezhda',
      seo_title: 'Конопляная одежда',
      seo_description: '',
      seo_keywords: ''
    )
    men_clothing = Category.create(
      parent:   clothing,
      name:     'men_clothing', 
      title:    'Мужская одежда',
      abstract: 'Уникальная одежда для сильных, свободных духом и уверенных в себе мужчин.',
      url:      'odezhda-muzhskaya',
      seo_title: 'Мужская одежда',
      seo_description: '',
      seo_keywords: ''
    )
    women_clothing = Category.create(
      parent:   clothing,
      name:     'women_clothing', 
      title:    'Женская одежда',
      abstract: 'Уникальная одежда для сильных, свободных духом и уверенных в себе мужчин.',
      url:      'odezhda-zhenskaya',
      seo_title: 'Женская одежда',
      seo_description: '',
      seo_keywords: ''
    )

    cosmetics = Category.create(
      name:     'cosmetics', 
      title:    'Косметика',
      abstract: 'Косметика на основе конопли',
      url:      'konoplyanaya-kosmetika',
      seo_title: 'Конопляная косметика',
      seo_description: '',
      seo_keywords: ''
    )
    perfume = Category.create(
      parent:   cosmetics,
      name:     'perfume', 
      title:    'Парфюмерия',
      abstract: 'Духи с феромонами на основе французских парфюмерных композиций',
      url:      'duhi-s-feromonami',
      seo_title: 'Парфюмерия с феромонами',
      seo_description: '',
      seo_keywords: ''
    )
    men_perfume = Category.create(
      parent:   perfume,
      name:     'men_perfume', 
      title:    'Мужская парфюмерия',
      abstract: 'Мужская парфюмерия с феромонами',
      url:      'muzhskaya-parfumeria',
      seo_title: 'Мужская парфюмерия с феромонами',
      seo_description: '',
      seo_keywords: ''
    )
    women_perfume = Category.create(
      parent:   perfume,
      name:     'women_perfume', 
      title:    'Женская парфюмерия',
      abstract: 'Женская парфюмерия с феромонами',
      url:      'zhenskaya-parfumeria',
      seo_title: 'Женская парфюмерия с феромонами',
      seo_description: '',
      seo_keywords: ''
    )
    hair_cosmetics = Category.create(
      parent:    cosmetics,
      name:     'hair_cosmetics', 
      title:    'Шампуни и гели для волос',
      abstract: 'Шампуни и гели для волос на основе конопли',
      url:      'shampuni-i-geli-dlya-volos',
      seo_title: 'Шампуни и гели из конопли',
      seo_description: '',
      seo_keywords: ''
    )
    face_cosmetics = Category.create(
      parent:    cosmetics,
      name:     'face_cosmetics', 
      title:    'Косметика для лица',
      abstract: 'Косметика для лица на основе конопли',
      url:      'kosmetika-dlya-litsa',
      seo_title: 'Косметика для лица',
      seo_description: '',
      seo_keywords: ''
    )
    body_cosmetics = Category.create(
      parent:   cosmetics,
      name:     'body_cosmetics', 
      title:    'Косметика для тела',
      abstract: 'Лосьоны и кремы для тела на основе конопли',
      url:      'kosmetika-dlya-tela',
      seo_title: 'Косметика для тела',
      seo_description: '',
      seo_keywords: ''
    )
    hands_cosmetics = Category.create(
      parent:   cosmetics,
      name:     'hands_cosmetics', 
      title:    'Косметика для рук',
      abstract: 'Лосьоны и кремы для рук на основе конопли',
      url:      'kosmetika-dlya-ruk',
      seo_title: 'Косметика для рук',
      seo_description: '',
      seo_keywords: ''
    )

    headdresses = Category.create(
      name:     'headdresses', 
      title:    'Головные уборы из конопли',
      abstract: 'Шапки, шляпы и повязки ручной работы из конопляной пряжи',
      url:      'golovnie-ubory',
      seo_title: 'Головные уборы из конопли',
      seo_description: '',
      seo_keywords: ''
    )
    caps = Category.create(
      parent:   headdresses,
      name:     'caps', 
      title:    'Шапки',
      abstract: 'Шапки ручной работы из конопляной пряжи',
      url:      'shapki-iz-konopli',
      seo_title: 'Шапки ручной работы из конопляной пряжи',
      seo_description: '',
      seo_keywords: ''
    )
    headbands = Category.create(
      parent:   headdresses,
      name:     'headbands', 
      title:    'Повязки',
      abstract: 'Головные повязки из конопляной пряжи',
      url:      'povyazki-iz-konopli',
      seo_title: 'Головные повязки из конопляной пряжи',
      seo_description: '',
      seo_keywords: ''
    )
    hats = Category.create(
      parent:   headdresses,
      name:     'hats', 
      title:    'Шляпки',
      abstract: 'Шляпы и панамы из конопляной пряжи',
      url:      'shlyapki-iz-konopli',
      seo_title: 'Шляпы и панамы из конопляной пряжи',
      seo_description: '',
      seo_keywords: ''
    )

    products = Category.create(
      name:     'products', 
      title:    'Продукты',
      abstract: 'Продукты питания на основе конопли',
      url:      'eda-iz-konopli',
      seo_title: 'Продукты из конопли',
      seo_description: '',
      seo_keywords: ''
    )

    accessories  = Category.create(
      name:     'accessories', 
      title:    'Аксессуары',
      abstract: 'Пояса, фенечки, мочалочки из конопли',
      url:      'aksessuary',
      seo_title: 'Аксессуары из конопли',
      seo_description: '',
      seo_keywords: ''
    )

    hemp_shoes  = Category.create(
      name:     'hemp_shoes', 
      title:    'Обувь из конопли',
      abstract: 'Обувь из конопляной ткани для ежедневной носки. Ткань обработана специальным составом, что не дает им промокать во время дождя. Унисекс. Максимальная естественность и комфорт при ходьбе обеспечиваются экологичностью и уникальными свойствами используемого материала.
      Конопляная обувь это максимальное единение с природой и комфорт при носке!',
      url:      'obuv-iz-konopli',
      seo_title: 'Обувь из конопли',
      seo_description: '',
      seo_keywords: ''
    )
    
    kids_clothing = Category.create(
      parent:   clothing,
      name:     'kids_clothing', 
      title:    'Детская одежда',
      abstract: 'Целебная одежда для деток ручной работы',
      url:      'odezhda-detskaya',
      seo_title: 'Детская одежда',
      seo_description: '',
      seo_keywords: ''
    )

    puts "===== 'Category' record(s) created"
  else
    puts "===== 'Category' seeding skipped"
  end
rescue
  puts "----- Achtung! Something went wrong ('Category' entity does not exist?)"
end