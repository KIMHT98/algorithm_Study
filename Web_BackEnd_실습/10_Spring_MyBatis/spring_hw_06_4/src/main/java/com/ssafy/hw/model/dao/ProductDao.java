package com.ssafy.hw.model.dao;

import java.util.List;

import com.ssafy.hw.model.dto.Product;

public interface ProductDao {

	int insertProduct(Product product);

	int deleteProduct(String pCode);

	int updateProduct(Product product);

	Product selectProductBypCode(String pCode);

	List<Product> selectAllProduct();
}
