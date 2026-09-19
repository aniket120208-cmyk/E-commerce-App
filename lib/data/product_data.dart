import 'package:e_commerce_app/models/product_model.dart';

final List<Product> clothingProducts = [
  const Product(
    id: 'prod_01',
    badge: '-30% OFF',
    brand: 'ZORIX STUDIO',
    title: 'Structured Wool Coat',
    description:
        'Tailored double-breasted overcoat cut from heavyweight melton wool with sharp shoulders and deep notched lapels.',
    price: '\$221',
    originalPrice: '\$340',
    image:
        'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=500&q=80',
    sizes: ['S', 'M', 'L', 'XL'],
    colors: ['Camel', 'Charcoal', 'Black'],
    material: '80% Virgin Wool, 20% Polyamide',
    care: 'Dry clean only',
  ),
  const Product(
    id: 'prod_02',
    badge: '-40% FLASH',
    brand: 'EDITORIAL',
    title: 'Pleated Wide-Leg Pants',
    description:
        'High-rise fluid trousers featuring crisp double front pleats, hidden slash pockets, and an elongated pooling hem.',
    price: '\$126',
    originalPrice: '\$210',
    image:
        'https://images.unsplash.com/photo-1509631179647-0177331693ae?w=500&q=80',
    sizes: ['XS', 'S', 'M', 'L'],
    colors: ['Olive', 'Sandstone', 'Navy'],
    material: '65% Polyester, 35% Rayon',
    care: 'Machine wash delicate at 30°C',
  ),
  const Product(
    id: 'prod_03',
    badge: 'BEST VALUE',
    brand: 'KNIT ARCHIVE',
    title: 'Cashmere Mockneck Sweater',
    description:
        'Mid-weight 7-gauge ribbed mockneck sweater spun from ethically sourced Mongolian grade-A cashmere fibers.',
    price: '\$136',
    originalPrice: '\$195',
    image:
        'https://images.unsplash.com/photo-1576995853123-5a10305d93c0?w=500&q=80',
    sizes: ['S', 'M', 'L'],
    colors: ['Oatmeal', 'Heather Grey', 'Forest Green'],
    material: '100% Mongolian Cashmere',
    care: 'Hand wash cold, dry flat',
  ),
  const Product(
    id: 'prod_04',
    badge: 'NEW ARRIVAL',
    brand: 'ATELIER RAW',
    title: 'Boxy Selvedge Denim Jacket',
    description:
        'Relaxed workwear silhouette crafted from 13.5oz shuttle-loomed Japanese selvedge denim with antiqued metal buttons.',
    price: '\$165',
    originalPrice: '\$220',
    image:
        'https://images.unsplash.com/photo-1576871337622-98d48d1cf531?w=500&q=80',
    sizes: ['S', 'M', 'L', 'XL'],
    colors: ['Raw Indigo', 'Vintage Black'],
    material: '100% Cotton Selvedge Denim',
    care: 'Machine wash cold inside out, air dry',
  ),
  const Product(
    id: 'prod_05',
    badge: '-20% LIMITED',
    brand: 'NORDIC LINE',
    title: 'Brushed Mohair Cardigan',
    description:
        'Fluffy, tactile button-front cardigan designed with horn buttons, drop shoulders, and dense ribbed trims.',
    price: '\$148',
    originalPrice: '\$185',
    image:
        'https://images.unsplash.com/photo-1434389677669-e08b4cac3105?w=500&q=80',
    sizes: ['XS', 'S', 'M', 'L'],
    colors: ['Sage Green', 'Dusty Rose', 'Cream'],
    material: '50% Kid Mohair, 30% Wool, 20% Recycled Nylon',
    care: 'Hand wash cold or dry clean',
  ),
  const Product(
    id: 'prod_06',
    brand: 'MINIMALIA',
    title: 'Relaxed Poplin Button-Down Shirt',
    description:
        'Oversized clean-cut shirt tailored from 120-thread-count Egyptian cotton with a curved hem and mother-of-pearl buttons.',
    price: '\$88',
    originalPrice: '\$110',
    image:
        'https://images.unsplash.com/photo-1598033129183-c4f50c736f10?w=500&q=80',
    sizes: ['S', 'M', 'L', 'XL'],
    colors: ['Optic White', 'Sky Blue Stripe', 'Soft Taupe'],
    material: '100% Long-Staple Cotton Poplin',
    care: 'Machine wash warm, iron while slightly damp',
  ),
  const Product(
    id: 'prod_07',
    badge: '-50% OUTLET',
    brand: 'VORTEX TECH',
    title: 'Waterproof Packable Shell Parka',
    description:
        'Three-layer seam-sealed windproof and waterproof rain parka with an adjustable storm hood and water-tight zippered vents.',
    price: '\$175',
    originalPrice: '\$350',
    image:
        'https://images.unsplash.com/photo-1544441893-675973e31985?w=500&q=80',
    sizes: ['S', 'M', 'L', 'XL'],
    colors: ['Matte Black', 'Glacier Grey', 'Safety Orange'],
    material: '100% Recycled Polyamide with DWR Finish',
    care: 'Machine wash cold on gentle cycle, tumble dry low to reactivate DWR',
  ),
  const Product(
    id: 'prod_08',
    brand: 'HEAVYWEIGHT STUDIO',
    title: '450 GSM French Terry Hoodie',
    description:
        'Custom pre-shrunk ultra-heavyweight loopback fleece hoodie with a double-layered hood and blind-stitched hem.',
    price: '\$115',
    originalPrice: '\$145',
    image:
        'https://images.unsplash.com/photo-1556905055-8f358a7a47b2?w=500&q=80',
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
    colors: ['Washed Black', 'Bone', 'Vintage Cocoa'],
    material: '100% Organic Ring-Spun Cotton',
    care: 'Machine wash cold, lay flat to dry',
  ),
  const Product(
    id: 'prod_09',
    badge: 'SUMMER ESSENTIAL',
    brand: 'RIVIERA LINEN',
    title: 'Camp Collar Linen Resort Shirt',
    description:
        'Breezy open-collar short-sleeve shirt crafted from garment-washed European flax for maximum breathability in warm climates.',
    price: '\$78',
    originalPrice: '\$98',
    image:
        'https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=500&q=80',
    sizes: ['S', 'M', 'L', 'XL'],
    colors: ['Terracotta', 'Ecru', 'Olive Drab'],
    material: '100% Pure Normandy Linen',
    care: 'Machine wash cold, hang to dry',
  ),
  const Product(
    id: 'prod_10',
    badge: '-15% OFF',
    brand: 'EDITORIAL',
    title: 'Single-Breasted Suiting Blazer',
    description:
        'Unstructured everyday blazer with a soft shoulder line, welt chest pocket, and horn buttons, cut for modern layering.',
    price: '\$195',
    originalPrice: '\$230',
    image:
        'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?w=500&q=80',
    sizes: ['38R', '40R', '42R', '44R'],
    colors: ['Ink Navy', 'Houndstooth Check', 'Sandstone'],
    material: '55% Linen, 45% Wool',
    care: 'Dry clean only',
  ),
  const Product(
    id: 'prod_11',
    brand: 'TERRA CRAFT',
    title: 'Straight-Leg Utility Carpenter Jeans',
    description:
        'Rugged 12oz duck canvas trousers reinforced with double knee panels, hammer loop, and triple-needle chain stitching.',
    price: '\$110',
    originalPrice: '\$140',
    image:
        'https://images.unsplash.com/photo-1541099649105-f69ad21f3246?w=500&q=80',
    sizes: ['30x32', '32x32', '34x32', '36x32'],
    colors: ['Workwear Tan', 'Faded Olive', 'Off-White'],
    material: '100% Heavy Cotton Duck Canvas',
    care: 'Machine wash warm, tumble dry medium',
  ),
  const Product(
    id: 'prod_12',
    badge: 'ECO CHOICE',
    brand: 'SOL SILK',
    title: 'Bias-Cut Silk Midi Slip Dress',
    description:
        'Sensual slip dress cut along the bias for a natural fluid drape, featuring delicate adjustable spaghetti straps and a soft V-neck.',
    price: '\$180',
    originalPrice: '\$240',
    image:
        'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=500&q=80',
    sizes: ['XS', 'S', 'M', 'L'],
    colors: ['Midnight Emerald', 'Champagne', 'Onyx'],
    material: '100% Mulberry Silk Charmeuse (19mm)',
    care: 'Dry clean or gentle hand wash cold with silk detergent',
  ),
  const Product(
    id: 'prod_13',
    badge: '-35% DEAL',
    brand: 'NORDIC LINE',
    title: 'Chunky Fisherman Turtleneck',
    description:
        'Authentic 5-gauge cable-knit sweater made with untreated Shetland wool, engineered to withstand freezing temperatures.',
    price: '\$145',
    originalPrice: '\$225',
    image:
        'https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?w=500&q=80',
    sizes: ['S', 'M', 'L', 'XL'],
    colors: ['Off-White', 'Stormy Blue', 'Charcoal'],
    material: '100% Pure Shetland Wool',
    care: 'Hand wash cold with wool wash, reshape and dry flat',
  ),
  const Product(
    id: 'prod_14',
    brand: 'MINIMALIA',
    title: 'Heavyweight Supima Cotton Crewneck Tee',
    description:
        'Pre-shrunk 280 GSM heavyweight short-sleeve t-shirt with a snug bound collar that holds shape through dozens of washes.',
    price: '\$45',
    originalPrice: '\$55',
    image:
        'https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=500&q=80',
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
    colors: ['True White', 'Pitch Black', 'Heather Grey', 'Washed Navy'],
    material: '100% Long-Staple American Supima Cotton',
    care: 'Machine wash cold, tumble dry low',
  ),
  const Product(
    id: 'prod_15',
    badge: 'LIMITED RUN',
    brand: 'ZORIX STUDIO',
    title: 'Vintage Leather Moto Biker Jacket',
    description:
        'Classic asymmetric motorcycle silhouette crafted from vegetable-tanned full-grain lambskin with heavy silver hardware.',
    price: '\$390',
    originalPrice: '\$490',
    image:
        'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=500&q=80',
    sizes: ['S', 'M', 'L', 'XL'],
    colors: ['Distressed Espresso', 'Classic Black'],
    material: '100% Genuine Lambskin Leather, Cupro Lining',
    care: 'Specialist leather clean only',
  ),
  const Product(
    id: 'prod_16',
    brand: 'RIVIERA LINEN',
    title: 'Drawstring Relaxed Linen Trousers',
    description:
        'Summer-ready pull-on trousers with a comfortable elasticated drawstring waist, deep side pockets, and tapered ankles.',
    price: '\$92',
    originalPrice: '\$115',
    image:
        'https://images.unsplash.com/photo-1479064555552-3ef4979f8908?w=500&q=80',
    sizes: ['S', 'M', 'L', 'XL'],
    colors: ['Natural Flax', 'White', 'Navy Blue'],
    material: '100% Pre-Washed European Linen',
    care: 'Machine wash cold, line dry',
  ),
  const Product(
    id: 'prod_17',
    badge: 'POPULAR',
    brand: 'ATELIER RAW',
    title: 'Garment-Dyed Cotton Over-Shirt',
    description:
        'Multi-functional utility shaket with twin gusseted chest flap pockets and reinforced elbow patches for easy layering.',
    price: '\$130',
    originalPrice: '\$160',
    image:
        'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=500&q=80',
    sizes: ['S', 'M', 'L', 'XL'],
    colors: ['Washed Khaki', 'Tobacco Brown', 'Slate Grey'],
    material: '100% Heavy Twill Cotton',
    care: 'Machine wash cold, hang dry',
  ),
  const Product(
    id: 'prod_18',
    badge: '-25% OFF',
    brand: 'EDITORIAL',
    title: 'Knife-Pleated Midi A-Line Skirt',
    description:
        'High-waisted midi skirt featuring permanently heat-pressed accordion knife pleats and an invisible side zipper.',
    price: '\$105',
    originalPrice: '\$140',
    image:
        'https://images.unsplash.com/photo-1583496661160-fb5886a0aaaa?w=500&q=80',
    sizes: ['XS', 'S', 'M', 'L'],
    colors: ['Burgundy Wine', 'Champagne Beige', 'Matte Black'],
    material: '100% Recycled Polyester Georgette',
    care: 'Hand wash cold, hang dry, do not iron pleats',
  ),
  const Product(
    id: 'prod_19',
    brand: 'KNIT ARCHIVE',
    title: 'Merino Wool Waffle Thermal Long-Sleeve',
    description:
        'Base-layer crewneck thermal with micro-waffle knitting that traps body warmth while remaining completely itch-free.',
    price: '\$82',
    originalPrice: '\$105',
    image:
        'https://images.unsplash.com/photo-1618354691373-d851c5c3a990?w=500&q=80',
    sizes: ['S', 'M', 'L', 'XL'],
    colors: ['Heather Charcoal', 'Oatmeal Melange', 'Deep Moss'],
    material: '100% Extra-Fine Australian Merino Wool (19.5 micron)',
    care: 'Machine wash cold on wool cycle, dry flat',
  ),
  const Product(
    id: 'prod_20',
    badge: '-45% CLEARANCE',
    brand: 'VORTEX TECH',
    title: 'Quilted Ripstop Down Puffer Jacket',
    description:
        'Sub-zero lightweight outer coat packed with 700-fill-power traceable goose down and wrapped in a ripstop water-resistant shell.',
    price: '\$198',
    originalPrice: '\$360',
    image:
        'https://images.unsplash.com/photo-1548883354-7622d03aca27?w=500&q=80',
    sizes: ['S', 'M', 'L', 'XL'],
    colors: ['Deep Cobalt', 'Matte Carbon', 'Burnt Amber'],
    material: 'Shell: 100% Nylon Ripstop; Fill: 90/10 RDS Goose Down',
    care: 'Machine wash cold gentle with down wash, tumble dry low with tennis balls',
  ),
];