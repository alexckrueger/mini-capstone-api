User.create!([
  {name: "thisistest", email: "test@test.com", password: "password", admin: false},
  {name: "testing tester number 5", email: "test5@test.com", password: "password", admin: false},
  {name: "testing tester number 2", email: "test2@test.com", password: "password", admin: true},
  {name: "testing tester number 6", email: "test6@test.com", password: "password", admin: false},
  {name: "test7", email: "test7@test.com", password: "password", admin: false}
])

Product.create!([
  {name: "kidney", price: "55.0", description: "Can not guarantee working condition", quantity: 90, supplier_id: 2},
  {name: "liver", price: "80.0", description: "Poor uncle Rick.", quantity: 12, supplier_id: 2},
  {name: "heart", price: "150.0", description: "It was working when I took it out", quantity: 40, supplier_id: 2},
  {name: "eyeball", price: "9.0", description: "an eye for an eye?", quantity: 9, supplier_id: 2},
  {name: "brain", price: "6000.0", description: "When you really need to delete a memory", quantity: 9, supplier_id: 1},
  {name: "me", price: "3.0", description: "wonderful and cool", quantity: 1, supplier_id: 1},
  {name: "Arm and a Leg", price: "600000.0", description: "You wouldn't believe what this cost me to put in stock", quantity: 2, supplier_id: 1}
])

Image.create!([
  {url: "https://t4.ftcdn.net/jpg/02/72/25/87/360_F_272258728_LWOA70FSLXFzhOLFedNexVvyxNAe3dNF.jpg", product_id: "3"},
  {url: "https://image.shutterstock.com/image-vector/happy-cute-liver-light-bulb-260nw-1413754517.jpg", product_id: "1"},
  {url: "https://cdn.vox-cdn.com/thumbor/hRa88_G-3n0J7ivEG65WYcjfPeo=/46x0:1054x672/1400x1050/filters:focal(46x0:1054x672):format(jpeg)/cdn.vox-cdn.com/assets/2368289/heart_shutterstock.jpg", product_id: "2"},
  {url: "https://previews.123rf.com/images/lineartestpilot/lineartestpilot1802/lineartestpilot180281961/95638653-cartoon-eyeball-laughing.jpg", product_id: "8"},
  {url: "https://media-cldnry.s-nbcnews.com/image/upload/t_nbcnews-fp-1200-630,f_auto,q_auto:best/msnbc/Components/Art/TECH/July/070719/HLG_BigBrainfix.jpg", product_id: "4"},
  {url: "https://images.cdn4.stockunlimited.net/preview1300/boy-with-broken-arm-and-leg_1956890.jpg", product_id: "5"}
])
Category.create!([
  {name: "organ"},
  {name: "Body part"},
  {name: "small"}
])
Supplier.create!([
  {name: "Louie's Large Emporium", email: "lle@gmail.com", phone_number: "555-7890"},
  {name: "Bits 'n Pieces", email: "bnp@gmail.com", phone_number: "000-1290"}
])
CartedProduct.create!([
  {user_id: 3, product_id: 3, quantity: 5, status: "carted", order_id: 1},
  {user_id: 2, product_id: 4, quantity: 2, status: "purchased", order_id: 15},
  {user_id: 2, product_id: 3, quantity: 2, status: "purchased", order_id: 15},
  {user_id: 2, product_id: 8, quantity: 3, status: "removed", order_id: nil}
])

Order.create!([
  {user_id: 2, subtotal: "60.79", tax: "5.55", total: "90.87"},
  {user_id: 1, subtotal: "1000000.79", tax: "5.55", total: "50.87"},
  {user_id: 1, subtotal: "1000000.79", tax: "5.55", total: "50.87"},
  {user_id: 1, subtotal: "750.0", tax: "67.5", total: "817.5"},
  {user_id: 1, subtotal: "750.0", tax: "67.5", total: "817.5"},
  {user_id: 1, subtotal: "750.0", tax: "67.5", total: "817.5"},
  {user_id: 2, subtotal: "1800000.0", tax: "162000.0", total: "1962000.0"},
  {user_id: 2, subtotal: "48000.0", tax: "4320.0", total: "52320.0"},
  {user_id: 2, subtotal: "48000.0", tax: "4320.0", total: "52320.0"},
  {user_id: 2, subtotal: "48000.0", tax: "4320.0", total: "52320.0"},
  {user_id: 2, subtotal: "6055.0", tax: "544.95", total: "12110.09"},
  {user_id: 2, subtotal: "6055.0", tax: "544.95", total: "12110.09"},
  {user_id: 2, subtotal: "12110.0", tax: "1089.9", total: "24220.09"},
  {user_id: 2, subtotal: "12110.0", tax: "1089.9", total: "24220.09"},
  {user_id: 2, subtotal: "12110.0", tax: "1089.9", total: "24220.09"}
])
ProductCategory.create!([
  {product_id: 1, category_id: 1},
  {product_id: 2, category_id: 1},
  {product_id: 3, category_id: 1},
  {product_id: 4, category_id: 1},
  {product_id: 8, category_id: 1},
  {product_id: 5, category_id: 2},
  {product_id: 9, category_id: 2},
  {product_id: 8, category_id: 3},
  {product_id: 1, category_id: 3},
  {product_id: 3, category_id: 3}
])

