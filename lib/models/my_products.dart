import 'products.dart';

class MyProducts{
  // list of all products
  static List<Product> allProducts = [
    Product(
      id: 1,
      name: "OnePlus Nord 3 5G",
      type: 'Mobile',
      price: 20999.0,
      category: "Out of Stock",
      description: "OnePlus Nord 3 5G (Tempest Gray, 8GB RAM, 128GB Storage)",
      image: [ 
        "lib/images/products/mobiles/oneplus_nord_3_5g/pic1.jpg",
        "lib/images/products/mobiles/oneplus_nord_3_5g/pic2.jpg",
        "lib/images/products/mobiles/oneplus_nord_3_5g/pic3.jpg",
        "lib/images/products/mobiles/oneplus_nord_3_5g/pic4.jpg",
        "lib/images/products/mobiles/oneplus_nord_3_5g/pic5.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 20,
      name: "Puma Adult Smashic",
      type: 'Sneaker',
      price: 2019.0,
      category: "Trending Now",
      description: "Puma Unisex-Adult Smashic Casual Shoe|Unisex|Color:Black-Matte Silver|Material-type:Synthetic|Closure-type:Lace-up|Heel-type:Flat|Sole-material:Rubber",
      image: [
        "lib/images/products/sneakers/puma_adult_smashic/pic1.jpg",
        "lib/images/products/sneakers/puma_adult_smashic/pic2.jpg",
        "lib/images/products/sneakers/puma_adult_smashic/pic3.jpg",
        "lib/images/products/sneakers/puma_adult_smashic/pic4.jpg",
      ],
      quantity: 1
    ),
  
    Product(
      id: 10,
      name: "Koverify Hooded Jacket",
      type: 'Jacket',
      price: 549.0,
      category: "Out of Stock",
      description: "Koverify Plain Chain CottenBlend Zipper Hoodie/Hooded Jacket/Unisex Jacket for Men and Women",
      image: [
        "lib/images/products/jackets/koverify_plain_hooded_jacket/pic1.jpg",
        "lib/images/products/jackets/koverify_plain_hooded_jacket/pic2.jpg"
      ],
      quantity: 1
    ),

    Product(
      id: 6,
      name: "Acer Aspire Lite",
      type: 'Laptop',
      price: 28999.0,
      category: "Trending Now",
      description: "Acer [Smartchoice] Aspire Lite AMD Ryzen 3 5300U Premium Thin and Light Laptop (Windows 11 Home/8 GB RAM/512 GB SSD) AL15-41 with 39.62 cm (15.6\") Full HD Display, Metal Body, Steel Gray, 1.6 KG",
      image: [
        "lib/images/products/laptop/acer_aspire_lite/pic1.jpg",
        "lib/images/products/laptop/acer_aspire_lite/pic2.jpg",
        "lib/images/products/laptop/acer_aspire_lite/pic3.jpg",
        "lib/images/products/laptop/acer_aspire_lite/pic4.jpg",
        "lib/images/products/laptop/acer_aspire_lite/pic5.jpg",
        "lib/images/products/laptop/acer_aspire_lite/pic6.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 7,
      name: "Asus Vivobook 15",
      type: 'Laptop',
      price: 34999.0,
      category: "Out of Stock",
      description: "ASUS Vivobook 15, Intel Core i3-1220P 12th Gen, 15.6\" (39.62 cm) FHD, Thin and Laptop (8GB/512GB SSD/Integrated Graphics/Windows 11/Office 2021/Alexa Built-in/FP Sensor/Blue/1.7 kg), X1502ZA-EJ381WS",
      image: [
        "lib/images/products/laptop/asus_vivobook_15/pic1.jpg",
        "lib/images/products/laptop/asus_vivobook_15/pic2.jpg",
        "lib/images/products/laptop/asus_vivobook_15/pic3.jpg",
        "lib/images/products/laptop/asus_vivobook_15/pic4.jpg",
        "lib/images/products/laptop/asus_vivobook_15/pic5.jpg",
        "lib/images/products/laptop/asus_vivobook_15/pic6.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 8,
      name: "HP Laptop 15s",
      type: 'Laptop',
      price: 52999.0,
      category: "Trending Now",
      description: "HP Laptop 15s, 12th Gen Intel Core i5-1235U, 15.6-inch (39.6 cm), FHD, 16GB DDR4, 512GB SSD, Intel Iris Xe graphics, Backlit KB,MSO,Thin & Light, Dual speakers (Win 11, Silver, 1.69 kg), fq5330TU",
      image: [
        "lib/images/products/laptop/hp_15s/pic1.jpg",
        "lib/images/products/laptop/hp_15s/pic2.jpg",
        "lib/images/products/laptop/hp_15s/pic3.jpg",
        "lib/images/products/laptop/hp_15s/pic4.jpg",
        "lib/images/products/laptop/hp_15s/pic5.jpg",
        "lib/images/products/laptop/hp_15s/pic6.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 9,
      name: "CNMN IDry Jacket",
      type: 'Jacket',
      price: 549.0,
      category: "Trending Now",
      description: "CNMN IDry Jacket Breathable Jacket for Men - Lightweight, Single Layer - All Year Wear, Daily Wear, Biker Jacket",
      image: [
        "lib/images/products/jackets/cnmn_idry_jacket/pic1.jpg",
        "lib/images/products/jackets/cnmn_idry_jacket/pic2.jpg",
        "lib/images/products/jackets/cnmn_idry_jacket/pic3.jpg",
        "lib/images/products/jackets/cnmn_idry_jacket/pic4.jpg",
        "lib/images/products/jackets/cnmn_idry_jacket/pic5.jpg",
        "lib/images/products/jackets/cnmn_idry_jacket/pic6.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 11,
      name: "Leotude Casual Jacket",
      type: 'Jacket',
      price: 399.0,
      category: "Out of Stock",
      description: "LEOTUDE CASUAL JACKET For Women's Loose Fit Drop Shoulder Loopknit Bomber Jacket with Zipper Closure and Side Pockets (Color Black)",
      image: [ 
        "lib/images/products/jackets/leotude_casual_jacket/pic1.jpg",
        "lib/images/products/jackets/leotude_casual_jacket/pic2.jpg",        
        "lib/images/products/jackets/leotude_casual_jacket/pic3.jpg",        
        "lib/images/products/jackets/leotude_casual_jacket/pic4.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 12,
      name: "Voxati Denim Jacket",
      type: 'Jacket',
      price: 399.0,
      category: "Trending Now",
      description: "Voxati men's denim jacket|Slim|Short lenght|Collared neck",
      image: [
        "lib/images/products/jackets/voxati_men_denim/pic1.jpg",
        "lib/images/products/jackets/voxati_men_denim/pic2.jpg",
        "lib/images/products/jackets/voxati_men_denim/pic3.jpg",
        "lib/images/products/jackets/voxati_men_denim/pic4.jpg"
      ],
      quantity: 1
    ),

    Product(
      id: 13,
      name: "Tanjiro Kamado T-Shirt",
      type: 'Anime T-shirt',
      price: 699.0,
      category: "Out of Stock",
      description: "CRAZYMONK Demon Slayer Tanjiro Kamado Anime Oversized T-Shirt|Color:Mint",
      image: [
        "lib/images/products/anime_t_shirts/demon_slayer/pic1.jpg",
        "lib/images/products/anime_t_shirts/demon_slayer/pic2.jpg",
        "lib/images/products/anime_t_shirts/demon_slayer/pic3.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 14,
      name: "Itadori Yuji T-Shirt",
      type: 'Anime T-shirt',
      price: 399.0,
      category: "Trending Now",
      description: "On Trend Round Neck Half Sleeves Regular fit Polyester Jujutsu Kaisen Anime Printed T Shirt for Boys and Girls, Kids Color-Black",
      image: [
        "lib/images/products/anime_t_shirts/jjk/pic1.jpg",
        "lib/images/products/anime_t_shirts/jjk/pic2.jpg"
      ],
      quantity: 1
    ),

    Product(
      id: 15,
      name: "Pain Tendo T-Shirt",
      type: 'Anime T-shirt',
      price: 299.0,
      category: "Out of Stock",
      description: "Round Neck Half Sleeve Naruto Shippuden Anime Character Printed Tshirt for Boys and Girls|White",
      image: [
        "lib/images/products/anime_t_shirts/naruto/pic1.jpg",
        "lib/images/products/anime_t_shirts/naruto/pic2.jpg"
      ],
      quantity: 1
    ),

    Product(
      id: 16,
      name: "Luffy T-Shirt",
      type: 'Anime T-shirt',
      price: 699.0,
      category: "Trending Now",
      description: "CRAZYMONK One Piece Luffy Most Wanted Anime Oversized T-Shirt|Navy Blue",
      image: [
        "lib/images/products/anime_t_shirts/one_piece/pic1.jpg",
        "lib/images/products/anime_t_shirts/one_piece/pic2.jpg",
        "lib/images/products/anime_t_shirts/one_piece/pic3.jpg"
      ],
      quantity: 1
    ),

    Product(
      id: 2,
      name: "Realme Narzo N63",
      type: 'Mobile',
      price: 8499.0,
      category: "Trending Now",
      description: "realme NARZO N63 (Leather Blue, 4GB RAM+64GB Storage) 45W Fast Charge | 5000mAh Durable Battery | 7.74mm Ultra Slim | 50MP AI Camera | AI Boost",
      image: [
        "lib/images/products/mobiles/realme_narzo_n63/pic1.jpg",
        "lib/images/products/mobiles/realme_narzo_n63/pic2.jpg",
        "lib/images/products/mobiles/realme_narzo_n63/pic3.jpg",
        "lib/images/products/mobiles/realme_narzo_n63/pic4.jpg",
        "lib/images/products/mobiles/realme_narzo_n63/pic5.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 4,
      name: "Tecno Pop 8",
      type: 'Mobile',
      price: 6999.0,
      category: "Trending Now",
      description: "TECNO POP 8 (Gravity Black,(4GB+64GB)| 90Hz Punch Hole Display with Dynamic Port & Dual Speakers with DTS| 5000mAh Battery |10W Type-C| Side Fingerprint Sensor| Octa-Core Processor",
      image: [
        "lib/images/products/mobiles/tecno_pop_8/pic1.jpg",
        "lib/images/products/mobiles/tecno_pop_8/pic2.jpg",
        "lib/images/products/mobiles/tecno_pop_8/pic3.jpg",
        "lib/images/products/mobiles/tecno_pop_8/pic4.jpg",
        "lib/images/products/mobiles/tecno_pop_8/pic5.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 17,
      name: "Puma Snatch V2",
      type: 'Sneaker',
      price: 1899.0,
      category: "Out of Stock",
      description: "Puma Snatch V2|Men|Color:Black-white|Closure-Type:Lace-Up|Heel-type:Flat|Sole-material:Rubber",
      image: [
        "lib/images/products/sneakers/puma_snatch_v2/pic1.jpg",
        "lib/images/products/sneakers/puma_snatch_v2/pic2.jpg",
        "lib/images/products/sneakers/puma_snatch_v2/pic3.jpg",
        "lib/images/products/sneakers/puma_snatch_v2/pic4.jpg",
        "lib/images/products/sneakers/puma_snatch_v2/pic5.jpg",
        "lib/images/products/sneakers/puma_snatch_v2/pic6.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 18,
      name: "Puma Caven 2.0",
      type: 'Sneaker',
      price: 5099.0,
      category: "Trending Now",
      description: "Puma Caven 2.0|Unisex|Color:White-White|Material-type:Synthetic|Closure-type:Lace-up|Heel-type:Flat|Sole-material:Rubber",
      image: [
        "lib/images/products/sneakers/puma_caven_2/pic1.jpg",
        "lib/images/products/sneakers/puma_caven_2/pic2.jpg",
        "lib/images/products/sneakers/puma_caven_2/pic3.jpg",
        "lib/images/products/sneakers/puma_caven_2/pic4.jpg",
        "lib/images/products/sneakers/puma_caven_2/pic5.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 3,
      name: "Redmi A3",
      type: 'Mobile',
      price: 6999.0,
      category: "Out of Stock",
      description: "Redmi A3 (Olive Green, 3GB RAM, 64GB Storage) | Premium Halo Design | 90Hz Display | Powerful 4G G36 Processor",
      image: [
        "lib/images/products/mobiles/redmi_a3/pic1.jpg",
        "lib/images/products/mobiles/redmi_a3/pic2.jpg",
        "lib/images/products/mobiles/redmi_a3/pic3.jpg",
        "lib/images/products/mobiles/redmi_a3/pic4.jpg",
        "lib/images/products/mobiles/redmi_a3/pic5.jpg",
        "lib/images/products/mobiles/redmi_a3/pic6.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 5,
      name: "Lenovo IdeaPad 1",
      type: 'Laptop',
      price: 32999.0,
      category: "Out of Stock",
      description: "Lenovo IdeaPad 1 AMD Ryzen 3 7320U 15.6\" HD Thin and Light Laptop (8 GB/512GB SDD/Windows 11 Home/Office 2021/1Yr ADP Free/Cloud Grey/1.58Kg), 82VG00EVIN",
      image: [
        "lib/images/products/laptop/lenovo_ideapad_1/pic1.jpg",
        "lib/images/products/laptop/lenovo_ideapad_1/pic2.jpg",        
        "lib/images/products/laptop/lenovo_ideapad_1/pic3.jpg",
        "lib/images/products/laptop/lenovo_ideapad_1/pic4.jpg",
        "lib/images/products/laptop/lenovo_ideapad_1/pic5.jpg",
        "lib/images/products/laptop/lenovo_ideapad_1/pic6.jpg",
        "lib/images/products/laptop/lenovo_ideapad_1/pic7.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 19,
      name: "Nike Full Force ",
      type: 'Sneaker',
      price: 6299.0,
      category: "Out of Stock",
      description: "NIKE Mens Full Force LoRunning Shoe|Men's|Color:White/Black-Pewter-Sail|Closure-type:Lace-up|Heel-type:No heel|Sole-material:Rubber",
      image: [
        "lib/images/products/sneakers/nike_full_force/pic1.jpg",
        "lib/images/products/sneakers/nike_full_force/pic2.jpg",
        "lib/images/products/sneakers/nike_full_force/pic3.jpg",
        "lib/images/products/sneakers/nike_full_force/pic4.jpg",
        "lib/images/products/sneakers/nike_full_force/pic5.jpg",
        "lib/images/products/sneakers/nike_full_force/pic6.jpg",
        "lib/images/products/sneakers/nike_full_force/pic7.jpg",
      ],
      quantity: 1
    ),
  ];

  //list of anime t-shirts
  static List<Product> animeTShirtList = [
    Product(
      id: 13,
      name: "Tanjiro Kamado T-Shirt",
      type: 'Anime T-shirt',
      price: 699.0,
      category: "Out of Stock",
      description: "CRAZYMONK Demon Slayer Tanjiro Kamado Anime Oversized T-Shirt|Color:Mint",
      image: [
        "lib/images/products/anime_t_shirts/demon_slayer/pic1.jpg",
        "lib/images/products/anime_t_shirts/demon_slayer/pic2.jpg",
        "lib/images/products/anime_t_shirts/demon_slayer/pic3.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 14,
      name: "Itadori Yuji T-Shirt",
      type: 'Anime T-shirt',
      price: 399.0,
      category: "Trending Now",
      description: "On Trend Round Neck Half Sleeves Regular fit Polyester Jujutsu Kaisen Anime Printed T Shirt for Boys and Girls, Kids Color-Black",
      image: [
        "lib/images/products/anime_t_shirts/jjk/pic1.jpg",
        "lib/images/products/anime_t_shirts/jjk/pic2.jpg"
      ],
      quantity: 1
    ),

    Product(
      id: 15,
      name: "Pain Tendo T-Shirt",
      type: 'Anime T-shirt',
      price: 299.0,
      category: "Out of Stock",
      description: "Round Neck Half Sleeve Naruto Shippuden Anime Character Printed Tshirt for Boys and Girls|White",
      image: [
        "lib/images/products/anime_t_shirts/naruto/pic1.jpg",
        "lib/images/products/anime_t_shirts/naruto/pic2.jpg"
      ],
      quantity: 1
    ),

    Product(
      id: 16,
      name: "Luffy T-Shirt",
      type: 'Anime T-shirt',
      price: 699.0,
      category: "Trending Now",
      description: "CRAZYMONK One Piece Luffy Most Wanted Anime Oversized T-Shirt|Navy Blue",
      image: [
        "lib/images/products/anime_t_shirts/one_piece/pic1.jpg",
        "lib/images/products/anime_t_shirts/one_piece/pic2.jpg",
        "lib/images/products/anime_t_shirts/one_piece/pic3.jpg"
      ],
      quantity: 1
    ),
  ];

  //list of jackets
  static List<Product> jacketList = [
    Product(
      id: 9,
      name: "CNMN IDry Jacket",
      type: 'Jacket',
      price: 549.0,
      category: "Trending Now",
      description: "CNMN IDry Jacket Breathable Jacket for Men - Lightweight, Single Layer - All Year Wear, Daily Wear, Biker Jacket",
      image: [
        "lib/images/products/jackets/cnmn_idry_jacket/pic1.jpg",
        "lib/images/products/jackets/cnmn_idry_jacket/pic2.jpg",
        "lib/images/products/jackets/cnmn_idry_jacket/pic3.jpg",
        "lib/images/products/jackets/cnmn_idry_jacket/pic4.jpg",
        "lib/images/products/jackets/cnmn_idry_jacket/pic5.jpg",
        "lib/images/products/jackets/cnmn_idry_jacket/pic6.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 10,
      name: "Koverify Hooded Jacket",
      type: 'Jacket',
      price: 549.0,
      category: "Out of Stock",
      description: "Koverify Plain Chain CottenBlend Zipper Hoodie/Hooded Jacket/Unisex Jacket for Men and Women",
      image: [
        "lib/images/products/jackets/koverify_plain_hooded_jacket/pic1.jpg",
        "lib/images/products/jackets/koverify_plain_hooded_jacket/pic2.jpg"
      ],
      quantity: 1
    ),

    Product(
      id: 11,
      name: "Leotude Casual Jacket",
      type: 'Jacket',
      price: 399.0,
      category: "Out of Stock",
      description: "LEOTUDE CASUAL JACKET For Women's Loose Fit Drop Shoulder Loopknit Bomber Jacket with Zipper Closure and Side Pockets (Color Black)",
      image: [
        "lib/images/products/jackets/leotude_casual_jacket/pic1.jpg",
        "lib/images/products/jackets/leotude_casual_jacket/pic2.jpg",        
        "lib/images/products/jackets/leotude_casual_jacket/pic3.jpg",        
        "lib/images/products/jackets/leotude_casual_jacket/pic4.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 12,
      name: "Voxati Denim Jacket",
      type: 'Jacket',
      price: 399.0,
      category: "Trending Now",
      description: "Voxati men's denim jacket|Slim|Short lenght|Collared neck",
      image: [
        "lib/images/products/jackets/voxati_men_denim/pic1.jpg",
        "lib/images/products/jackets/voxati_men_denim/pic2.jpg",
        "lib/images/products/jackets/voxati_men_denim/pic3.jpg",
        "lib/images/products/jackets/voxati_men_denim/pic4.jpg"
      ],
      quantity: 1
    ),
  ];

  // list of mobiles
  static List<Product> mobilesList = [
    Product(
      id: 1,
      name: "OnePlus Nord 3 5G",
      type: 'Mobile',
      price: 20999.0,
      category: "Out of Stock",
      description: "OnePlus Nord 3 5G (Tempest Gray, 8GB RAM, 128GB Storage)",
      image: [
        "lib/images/products/mobiles/oneplus_nord_3_5g/pic1.jpg",
        "lib/images/products/mobiles/oneplus_nord_3_5g/pic2.jpg",
        "lib/images/products/mobiles/oneplus_nord_3_5g/pic3.jpg",
        "lib/images/products/mobiles/oneplus_nord_3_5g/pic4.jpg",
        "lib/images/products/mobiles/oneplus_nord_3_5g/pic5.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 2,
      name: "Realme Narzo N63",
      type: 'Mobile',
      price: 8499.0,
      category: "Trending Now",
      description: "realme NARZO N63 (Leather Blue, 4GB RAM+64GB Storage) 45W Fast Charge | 5000mAh Durable Battery | 7.74mm Ultra Slim | 50MP AI Camera | AI Boost",
      image: [
        "lib/images/products/mobiles/realme_narzo_n63/pic1.jpg",
        "lib/images/products/mobiles/realme_narzo_n63/pic2.jpg",
        "lib/images/products/mobiles/realme_narzo_n63/pic3.jpg",
        "lib/images/products/mobiles/realme_narzo_n63/pic4.jpg",
        "lib/images/products/mobiles/realme_narzo_n63/pic5.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 3,
      name: "Redmi A3",
      type: 'Mobile',
      price: 6999.0,
      category: "Out of Stock",
      description: "Redmi A3 (Olive Green, 3GB RAM, 64GB Storage) | Premium Halo Design | 90Hz Display | Powerful 4G G36 Processor",
      image: [
        "lib/images/products/mobiles/redmi_a3/pic1.jpg",
        "lib/images/products/mobiles/redmi_a3/pic2.jpg",
        "lib/images/products/mobiles/redmi_a3/pic3.jpg",
        "lib/images/products/mobiles/redmi_a3/pic4.jpg",
        "lib/images/products/mobiles/redmi_a3/pic5.jpg",
        "lib/images/products/mobiles/redmi_a3/pic6.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 4,
      name: "Tecno Pop 8",
      type: 'Mobile',
      price: 6999.0,
      category: "Trending Now",
      description: "TECNO POP 8 (Gravity Black,(4GB+64GB)| 90Hz Punch Hole Display with Dynamic Port & Dual Speakers with DTS| 5000mAh Battery |10W Type-C| Side Fingerprint Sensor| Octa-Core Processor",
      image: [
        "lib/images/products/mobiles/tecno_pop_8/pic1.jpg",
        "lib/images/products/mobiles/tecno_pop_8/pic2.jpg",
        "lib/images/products/mobiles/tecno_pop_8/pic3.jpg",
        "lib/images/products/mobiles/tecno_pop_8/pic4.jpg",
        "lib/images/products/mobiles/tecno_pop_8/pic5.jpg",
      ],
      quantity: 1
    ),
  ];

  // list of laptop
  static List<Product> laptopList = [
    Product(
      id: 5,
      name: "Lenovo IdeaPad 1",
      type: 'Laptop',
      price: 32999.0,
      category: "Out of Stock",
      description: "Lenovo IdeaPad 1 AMD Ryzen 3 7320U 15.6\" HD Thin and Light Laptop (8 GB/512GB SDD/Windows 11 Home/Office 2021/1Yr ADP Free/Cloud Grey/1.58Kg), 82VG00EVIN",
      image: [
        "lib/images/products/laptop/lenovo_ideapad_1/pic1.jpg",
        "lib/images/products/laptop/lenovo_ideapad_1/pic2.jpg",        
        "lib/images/products/laptop/lenovo_ideapad_1/pic3.jpg",
        "lib/images/products/laptop/lenovo_ideapad_1/pic4.jpg",
        "lib/images/products/laptop/lenovo_ideapad_1/pic5.jpg",
        "lib/images/products/laptop/lenovo_ideapad_1/pic6.jpg",
        "lib/images/products/laptop/lenovo_ideapad_1/pic7.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 6,
      name: "Acer Aspire Lite",
      type: 'Laptop',
      price: 28999.0,
      category: "Trending Now",
      description: "Acer [Smartchoice] Aspire Lite AMD Ryzen 3 5300U Premium Thin and Light Laptop (Windows 11 Home/8 GB RAM/512 GB SSD) AL15-41 with 39.62 cm (15.6\") Full HD Display, Metal Body, Steel Gray, 1.6 KG",
      image: [
        "lib/images/products/laptop/acer_aspire_lite/pic1.jpg",
        "lib/images/products/laptop/acer_aspire_lite/pic2.jpg",
        "lib/images/products/laptop/acer_aspire_lite/pic3.jpg",
        "lib/images/products/laptop/acer_aspire_lite/pic4.jpg",
        "lib/images/products/laptop/acer_aspire_lite/pic5.jpg",
        "lib/images/products/laptop/acer_aspire_lite/pic6.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 7,
      name: "Asus Vivobook 15",
      type: 'Laptop',
      price: 34999.0,
      category: "Out of Stock",
      description: "ASUS Vivobook 15, Intel Core i3-1220P 12th Gen, 15.6\" (39.62 cm) FHD, Thin and Laptop (8GB/512GB SSD/Integrated Graphics/Windows 11/Office 2021/Alexa Built-in/FP Sensor/Blue/1.7 kg), X1502ZA-EJ381WS",
      image: [
        "lib/images/products/laptop/asus_vivobook_15/pic1.jpg",
        "lib/images/products/laptop/asus_vivobook_15/pic2.jpg",
        "lib/images/products/laptop/asus_vivobook_15/pic3.jpg",
        "lib/images/products/laptop/asus_vivobook_15/pic4.jpg",
        "lib/images/products/laptop/asus_vivobook_15/pic5.jpg",
        "lib/images/products/laptop/asus_vivobook_15/pic6.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 8,
      name: "HP Laptop 15s",
      type: 'Laptop',
      price: 52999.0,
      category: "Trending Now",
      description: "HP Laptop 15s, 12th Gen Intel Core i5-1235U, 15.6-inch (39.6 cm), FHD, 16GB DDR4, 512GB SSD, Intel Iris Xe graphics, Backlit KB,MSO,Thin & Light, Dual speakers (Win 11, Silver, 1.69 kg), fq5330TU",
      image: [
        "lib/images/products/laptop/hp_15s/pic1.jpg",
        "lib/images/products/laptop/hp_15s/pic2.jpg",
        "lib/images/products/laptop/hp_15s/pic3.jpg",
        "lib/images/products/laptop/hp_15s/pic4.jpg",
        "lib/images/products/laptop/hp_15s/pic5.jpg",
        "lib/images/products/laptop/hp_15s/pic6.jpg",
      ],
      quantity: 1
    ),
  ];

  // list of sneakers
  static List<Product> sneakersList = [
    Product(
      id: 17,
      name: "Puma Snatch V2",
      type: 'Sneaker',
      price: 1899.0,
      category: "Out of Stock",
      description: "Puma Snatch V2|Men|Color:Black-white|Closure-Type:Lace-Up|Heel-type:Flat|Sole-material:Rubber",
      image: [
        "lib/images/products/sneakers/puma_snatch_v2/pic1.jpg",
        "lib/images/products/sneakers/puma_snatch_v2/pic2.jpg",
        "lib/images/products/sneakers/puma_snatch_v2/pic3.jpg",
        "lib/images/products/sneakers/puma_snatch_v2/pic4.jpg",
        "lib/images/products/sneakers/puma_snatch_v2/pic5.jpg",
        "lib/images/products/sneakers/puma_snatch_v2/pic6.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 18,
      name: "Puma Caven 2.0",
      type: 'Sneaker',
      price: 5099.0,
      category: "Trending Now",
      description: "Puma Caven 2.0|Unisex|Color:White-White|Material-type:Synthetic|Closure-type:Lace-up|Heel-type:Flat|Sole-material:Rubber",
      image: [
        "lib/images/products/sneakers/puma_caven_2/pic1.jpg",
        "lib/images/products/sneakers/puma_caven_2/pic2.jpg",
        "lib/images/products/sneakers/puma_caven_2/pic3.jpg",
        "lib/images/products/sneakers/puma_caven_2/pic4.jpg",
        "lib/images/products/sneakers/puma_caven_2/pic5.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 19,
      name: "Nike Full Force ",
      type: 'Sneaker',
      price: 6299.0,
      category: "Out of Stock",
      description: "NIKE Mens Full Force LoRunning Shoe|Men's|Color:White/Black-Pewter-Sail|Closure-type:Lace-up|Heel-type:No heel|Sole-material:Rubber",
      image: [
        "lib/images/products/sneakers/nike_full_force/pic1.jpg",
        "lib/images/products/sneakers/nike_full_force/pic2.jpg",
        "lib/images/products/sneakers/nike_full_force/pic3.jpg",
        "lib/images/products/sneakers/nike_full_force/pic4.jpg",
        "lib/images/products/sneakers/nike_full_force/pic5.jpg",
        "lib/images/products/sneakers/nike_full_force/pic6.jpg",
        "lib/images/products/sneakers/nike_full_force/pic7.jpg",
      ],
      quantity: 1
    ),

    Product(
      id: 20,
      name: "Puma Adult Smashic",
      type: 'Sneaker',
      price: 2019.0,
      category: "Trending Now",
      description: "Puma Unisex-Adult Smashic Casual Shoe|Unisex|Color:Black-Matte Silver|Material-type:Synthetic|Closure-type:Lace-up|Heel-type:Flat|Sole-material:Rubber",
      image: [
        "lib/images/products/sneakers/puma_adult_smashic/pic1.jpg",
        "lib/images/products/sneakers/puma_adult_smashic/pic2.jpg",
        "lib/images/products/sneakers/puma_adult_smashic/pic3.jpg",
        "lib/images/products/sneakers/puma_adult_smashic/pic4.jpg",
      ],
      quantity: 1
    ),
  ];
}