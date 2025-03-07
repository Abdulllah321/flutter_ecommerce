import '../../features/shop/models/brand_model.dart';
import '../../features/shop/models/product_attribute_model.dart';
import '../../features/shop/models/product_model.dart';
import '../../features/shop/models/product_varient_model.dart';

final List<ProductModel> dummyProductData = [
  // Previous laptops (Dell, MacBook, HP, Lenovo, Asus, Acer, MSI)...

  // Razer Blade 15
  ProductModel(
    id: '8',
    stock: 50,
    sku: 'LAPTOP_008',
    price: 1999.99,
    title: 'Razer Blade 15',
    date: DateTime.parse('2023-08-15'),
    salePrice: 1899.99,
    thumbnail: 'https://example.com/images/razer_blade_thumbnail.jpg',
    isFeatured: true,
    brand: BrandModel(id: '8', name: 'Razer', image: 'https://example.com/images/razer_logo.png'),
    description: 'An ultra-thin gaming laptop with NVIDIA RTX 3070 and a 240Hz display.',
    categoryId: 'laptops',
    images: [
      'https://example.com/images/razer_blade_front.jpg',
      'https://example.com/images/razer_blade_side.jpg'
    ],
    productType: 'Gaming Laptop',
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['Black']),
      ProductAttributeModel(name: 'RAM', values: ['16GB', '32GB']),
      ProductAttributeModel(name: 'Storage', values: ['1TB SSD']),
    ],
    productVariations: [
      ProductVariationModel(
        id: 'var1',
        sku: 'LAPTOP_008_VARIANT_1',
        image: 'https://example.com/images/razer_blade_black.jpg',
        description: 'Razer Blade 15 with RTX 3070, 16GB RAM, 1TB SSD',
        price: 1999.99,
        salePrice: 1899.99,
        stock: 25,
        attributes: {'Color': 'Black', 'RAM': '16GB', 'Storage': '1TB SSD'},
      ),
    ],
  ),

  // Microsoft Surface Laptop 5
  ProductModel(
    id: '9',
    stock: 75,
    sku: 'LAPTOP_009',
    price: 1299.99,
    title: 'Microsoft Surface Laptop 5',
    date: DateTime.parse('2023-09-10'),
    salePrice: 1199.99,
    thumbnail: 'https://example.com/images/surface_laptop_thumbnail.jpg',
    isFeatured: false,
    brand: BrandModel(id: '9', name: 'Microsoft', image: 'https://example.com/images/microsoft_logo.png'),
    description: 'A sleek, high-performance laptop with a touch display and long battery life.',
    categoryId: 'laptops',
    images: [
      'https://example.com/images/surface_laptop_front.jpg',
      'https://example.com/images/surface_laptop_side.jpg'
    ],
    productType: 'Business Laptop',
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['Platinum', 'Black']),
      ProductAttributeModel(name: 'RAM', values: ['8GB', '16GB']),
      ProductAttributeModel(name: 'Storage', values: ['256GB SSD', '512GB SSD']),
    ],
    productVariations: [
      ProductVariationModel(
        id: 'var1',
        sku: 'LAPTOP_009_VARIANT_1',
        image: 'https://example.com/images/surface_laptop_black.jpg',
        description: 'Surface Laptop 5 with 16GB RAM, 512GB SSD',
        price: 1299.99,
        salePrice: 1199.99,
        stock: 40,
        attributes: {'Color': 'Black', 'RAM': '16GB', 'Storage': '512GB SSD'},
      ),
    ],
  ),

  // Samsung Galaxy Book 3
  ProductModel(
    id: '10',
    stock: 65,
    sku: 'LAPTOP_010',
    price: 1099.99,
    title: 'Samsung Galaxy Book 3',
    date: DateTime.parse('2023-10-05'),
    salePrice: 999.99,
    thumbnail: 'https://example.com/images/galaxy_book_thumbnail.jpg',
    isFeatured: true,
    brand: BrandModel(id: '10', name: 'Samsung', image: 'https://example.com/images/samsung_logo.png'),
    description: 'A premium ultrabook with AMOLED display and Intel i7.',
    categoryId: 'laptops',
    images: [
      'https://example.com/images/galaxy_book_front.jpg',
      'https://example.com/images/galaxy_book_side.jpg'
    ],
    productType: 'Ultrabook',
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['Silver']),
      ProductAttributeModel(name: 'RAM', values: ['8GB', '16GB']),
      ProductAttributeModel(name: 'Storage', values: ['512GB SSD', '1TB SSD']),
    ],
    productVariations: [
      ProductVariationModel(
        id: 'var1',
        sku: 'LAPTOP_010_VARIANT_1',
        image: 'https://example.com/images/galaxy_book_silver.jpg',
        description: 'Galaxy Book 3 with i7, 16GB RAM, 512GB SSD',
        price: 1099.99,
        salePrice: 999.99,
        stock: 30,
        attributes: {'Color': 'Silver', 'RAM': '16GB', 'Storage': '512GB SSD'},
      ),
    ],
  ),

  // LG Gram 17
  ProductModel(
    id: '11',
    stock: 40,
    sku: 'LAPTOP_011',
    price: 1499.99,
    title: 'LG Gram 17',
    date: DateTime.parse('2023-11-12'),
    salePrice: 1399.99,
    thumbnail: 'https://example.com/images/lg_gram_thumbnail.jpg',
    isFeatured: false,
    brand: BrandModel(id: '11', name: 'LG', image: 'https://example.com/images/lg_logo.png'),
    description: 'An ultra-lightweight 17-inch laptop with incredible battery life.',
    categoryId: 'laptops',
    images: [
      'https://example.com/images/lg_gram_front.jpg',
      'https://example.com/images/lg_gram_side.jpg'
    ],
    productType: 'Ultrabook',
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['Silver', 'White']),
      ProductAttributeModel(name: 'RAM', values: ['16GB']),
      ProductAttributeModel(name: 'Storage', values: ['512GB SSD']),
    ],
    productVariations: [
      ProductVariationModel(
        id: 'var1',
        sku: 'LAPTOP_011_VARIANT_1',
        image: 'https://example.com/images/lg_gram_silver.jpg',
        description: 'LG Gram 17 with 16GB RAM, 512GB SSD',
        price: 1499.99,
        salePrice: 1399.99,
        stock: 25,
        attributes: {'Color': 'Silver', 'RAM': '16GB', 'Storage': '512GB SSD'},
      ),
    ],
  ),

  // Huawei MateBook X Pro
  ProductModel(
    id: '12',
    stock: 55,
    sku: 'LAPTOP_012',
    price: 1299.99,
    title: 'Huawei MateBook X Pro',
    date: DateTime.parse('2023-12-01'),
    salePrice: 1199.99,
    thumbnail: 'https://example.com/images/matebook_x_thumbnail.jpg',
    isFeatured: true,
    brand: BrandModel(id: '12', name: 'Huawei', image: 'https://example.com/images/huawei_logo.png'),
    description: 'A premium ultrabook with a stunning 3K touchscreen display.',
    categoryId: 'laptops',
    images: [
      'https://example.com/images/matebook_x_front.jpg',
      'https://example.com/images/matebook_x_side.jpg'
    ],
    productType: 'Ultrabook',
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['Space Gray']),
      ProductAttributeModel(name: 'RAM', values: ['16GB']),
      ProductAttributeModel(name: 'Storage', values: ['512GB SSD']),
    ],
    productVariations: [
      ProductVariationModel(
        id: 'var1',
        sku: 'LAPTOP_012_VARIANT_1',
        image: 'https://example.com/images/matebook_x_gray.jpg',
        description: 'MateBook X Pro with 16GB RAM, 512GB SSD',
        price: 1299.99,
        salePrice: 1199.99,
        stock: 20,
        attributes: {'Color': 'Space Gray', 'RAM': '16GB', 'Storage': '512GB SSD'},
      ),
    ],
  ),
];
