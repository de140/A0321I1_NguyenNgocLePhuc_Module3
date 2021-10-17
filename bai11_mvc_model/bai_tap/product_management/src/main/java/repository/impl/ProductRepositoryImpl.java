package repository.impl;

import entity.Product;
import repository.ProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements ProductRepository {
    private static List<Product> productList;
    static {
        productList = new ArrayList<>();
        productList.add(new Product(453,"iPhone 6","Điện thoại", "Hàng mới về", (double) 4000000,
                "https://cdn.tgdd.vn/Products/Images/42/92962/iphone-6-32gb-gold-hh-600x600-600x600-600x600.jpg"));
        productList.add(new Product(468,"iPhone 7","Điện thoại", "Hàng mới về", (double) 5000000,
                "https://cdn.tgdd.vn/Products/Images/42/74110/iphone-7-gold-600x600-1-600x600.jpg"));
        productList.add(new Product(567,"iPhone X","Điện thoại", "Hàng mới về", (double) 10000000,
                "https://cdn.tgdd.vn/Products/Images/42/114115/iphone-x-64gb-hh-600x600.jpg"));
        productList.add(new Product(654,"iPhone 13","Điện thoại", "Hàng mới về", (double) 30000000,
                "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-13-og-2021?wid=1200&hei=630&fmt=jpeg&qlt=95&.v=1630076508000"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public Product findById(Integer id) {
        for(Product product : productList) {
            if(product.getId().equals(id)){
                return product;
            }
        }
        return null;
    }

    @Override
    public void addProduct(Integer id, String name, String type, String desc, Double price, String urlImage) {
        productList.add(new Product(id,name,type,desc,price,urlImage));
    }

    @Override
    public void updateProduct(Integer id, String name, String type, String desc, Double price, String urlImage) {
        for(Product product : productList) {
            if(product.getId().equals(id)) {
                product.setName(name);
                product.setType(type);
                product.setDesc(desc);
                product.setPrice(price);
                product.setUrlImage(urlImage);
            }
        }
    }

    @Override
    public void deleteProduct(Integer id) {
        for(int i=0; i<productList.size(); i++){
            if(productList.get(i).getId().equals(id)){
                productList.remove(i);
            }
        }
    }
}