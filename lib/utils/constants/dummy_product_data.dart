import '../../features/shop/models/brand_model.dart';
import '../../features/shop/models/product_attribute_model.dart';
import '../../features/shop/models/product_model.dart';
import '../../features/shop/models/product_varient_model.dart';

final List<ProductModel> dummyProductData = [
  ProductModel(
    id: '1',
    stacky: 100,
    sku: 'LAPTOP_001',
    price: 899.99,
    title: 'Dell XPS 13',
    date: DateTime.parse('2023-03-15'),
    salePrice: 799.99,
    thumbnail: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnuGYHyCZJySxOnmsNE8cHJOsoAt57hrmYwxx0UpEeXf2cqyJXEHyDHKnkehxIYKZLdNc&usqp=CAU',
    jsFeatured: true,
    brand: BrandModel(id: '1', name: 'Dell', image: 'https://icon2.cleanpng.com/20181209/if/kisspng-logo-dell-laptop-font-computer-1713911699182.webp'),
    description: 'A powerful and portable 13-inch laptop with Intel i7 processor and high-resolution display.',
    categoryId: 'laptops',
    images: [
      'https://myitstore.com.pk/wp-content/uploads/2022/12/xs9320nt-xnb-shot-5-1-sl.png',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnuGYHyCZJySxOnmsNE8cHJOsoAt57hrmYwxx0UpEeXf2cqyJXEHyDHKnkehxIYKZLdNc&usqp=CAU',
      'https://cdn.shoppable.ph/products/6b1d2758-2014-4d4d-9f41-4c1d2f691184.webp'
    ],
    productType: 'Laptop',
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['Silver', 'Black']),
      ProductAttributeModel(name: 'RAM', values: ['8GB', '16GB']),
      ProductAttributeModel(name: 'Storage', values: ['256GB SSD', '512GB SSD']),
    ],
    productVariations: [
      ProductVariationModel(
        id: 'var1',
        sku: 'LAPTOP_001_VARIANT_1',
        image: 'https://i.dell.com/is/image/DellContent/content/dam/ss2/product-images/dell-client-products/notebooks/xps-notebooks/xps-13-9320/media-gallery/xs9320t-cnb-media-00000td090-sl.psd?fmt=pjpg&pscan=auto&scl=1&wid=4000&hei=4000&qlt=100,1&resMode=sharp2&size=4000,4000&chrss=full&imwidth=5000',
        description: 'Dell XPS 13 with 8GB RAM and 256GB SSD',
        price: 899.99,
        salePrice: 799.99,
        stock: 25,
        attributes: {'Color': 'Black', 'RAM': '8GB', 'Storage': '256GB SSD'},
      ),
      ProductVariationModel(
        id: 'var2',
        sku: 'LAPTOP_001_VARIANT_2',
        image: 'https://i.pcmag.com/imagery/reviews/06Ug0e0tlPFOh5qZAAcpq10-1..v1688849689.jpg',
        description: 'Dell XPS 13 with 16GB RAM and 512GB SSD',
        price: 999.99,
        salePrice: 899.99,
        stock: 15,
        attributes: {'Color': 'Silver', 'RAM': '16GB', 'Storage': '512GB SSD'},
      ),
    ],
  ),
  ProductModel(
    id: '2',
    stacky: 80,
    sku: 'LAPTOP_002',
    price: 1299.99,
    title: 'MacBook Pro 16"',
    date: DateTime.parse('2023-02-10'),
    salePrice: 1199.99,
    thumbnail: 'https://intaglaptops.com/cdn/shop/files/s-l1600.webp?v=1730468299',
    jsFeatured: true,
    brand: BrandModel(id: '2', name: 'Apple', image: 'https://example.com/images/apple_logo.png'),
    description: 'A premium 16-inch MacBook Pro with Apple M1 chip, offering ultimate performance.',
    categoryId: 'laptops',
    images: [
      'https://intaglaptops.com/cdn/shop/files/s-l1600.webp?v=1730468299',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAjHOi2E1h2dtM-QRKTm66VDUCpaftTktW13uk448rX1BZzvKSx0f0UYcnsY0EjfCju3I&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3XtGr3qn_aQH55EkB0oSMD0zDCHzdyKhlwHgFMZnHYhYgiZkwV8hQEEhaA7oI3bRzaaI&usqp=CAU'
    ],
    productType: 'Laptop',
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['Space Grey', 'Silver']),
      ProductAttributeModel(name: 'RAM', values: ['16GB', '32GB']),
      ProductAttributeModel(name: 'Storage', values: ['512GB SSD', '1TB SSD']),
    ],
    productVariations: [
      ProductVariationModel(
        id: 'var1',
        sku: 'LAPTOP_002_VARIANT_1',
        image: 'https://example.com/images/macbook_pro_16_space_grey.jpg',
        description: 'MacBook Pro 16" with 16GB RAM and 512GB SSD',
        price: 1299.99,
        salePrice: 1199.99,
        stock: 20,
        attributes: {'Color': 'Space Grey', 'RAM': '16GB', 'Storage': '512GB SSD'},
      ),
      ProductVariationModel(
        id: 'var2',
        sku: 'LAPTOP_002_VARIANT_2',
        image: 'https://example.com/images/macbook_pro_16_silver.jpg',
        description: 'MacBook Pro 16" with 32GB RAM and 1TB SSD',
        price: 1499.99,
        salePrice: 1399.99,
        stock: 10,
        attributes: {'Color': 'Silver', 'RAM': '32GB', 'Storage': '1TB SSD'},
      ),
    ],
  ),
  ProductModel(
    id: '3',
    stacky: 150,
    sku: 'LAPTOP_003',
    price: 599.99,
    title: 'HP Pavilion 14"',
    date: DateTime.parse('2023-06-22'),
    salePrice: 499.99,
    thumbnail: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgM1qsV8pBZJ_PcMC3KbbRH2SERV_soxK5Vw&s',
    jsFeatured: false,
    brand: BrandModel(id: '3', name: 'HP', image: 'https://example.com/images/hp_logo.png'),
    description: 'A sleek 14-inch laptop with Intel Core i5 processor, ideal for everyday tasks.',
    categoryId: 'laptops',
    images: [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgM1qsV8pBZJ_PcMC3KbbRH2SERV_soxK5Vw&s',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4wOb-RQOZfwg07vEl_3f595uOjXXNw5SzXA&s',
      'https://nextshop.pk/wp-content/uploads/2024/03/HP-Pavilion-x360-Laptop-14-ek1056TU-Intel%C2%AE-Core%E2%84%A2-i7-1355U-2.png'
    ],
    productType: 'Laptop',
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['Silver']),
      ProductAttributeModel(name: 'RAM', values: ['8GB']),
      ProductAttributeModel(name: 'Storage', values: ['256GB SSD']),
    ],
    productVariations: [
      ProductVariationModel(
        id: 'var1',
        sku: 'LAPTOP_003_VARIANT_1',
        image: 'https://example.com/images/hp_pavilion_14_silver.jpg',
        description: 'HP Pavilion 14" with 8GB RAM and 256GB SSD',
        price: 599.99,
        salePrice: 499.99,
        stock: 50,
        attributes: {'Color': 'Silver', 'RAM': '8GB', 'Storage': '256GB SSD'},
      ),
    ],
  ),
];
