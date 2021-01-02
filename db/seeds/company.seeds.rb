begin
  if (Company.present? and not Company.exists?)
    Company.create(
      name:       'treeplexus',
      title:      'Лесной магазинчик',
      email:      'info@treeplexus.ru',
      phone:      '+796 888 333 55',
      address:    'г. Москва, Ангелов переулок, 8',
      url:        'treeplexus.ru',
      seo_title:  'Товары и косметика из конопли, изделия ручной работы',
      seo_description: 'Большщой выбор товаров и косметики из конопли. Обувь, одежда, аксессуары из экологичных материалов. Изделия ручной работы',
      seo_keywords:    'hempz, молочко hempz, шампунь hempz, косметика из конопли, мыло из конопли, hemp for life, hemp story, экологичные подарки, экопродукты, экокосметика, экологичные аксессуары, обувь, мужская одежда, женская одежда, косметика из конопли, продукты из конопли, одежда из конопли, вещи из конопли, шапка из конопли, необычные подарки, оригинальные подарки, вегаподарки, подарки для вегетарианцев, прикольные подарки'
    )
    puts "===== 'Company' record(s) created"
  else
    puts "===== 'Company' seeding skipped"
  end
rescue
  puts "----- Achtung! Something went wrong ('Company' entity does not exist?)"
end