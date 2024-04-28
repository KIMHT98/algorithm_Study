package com.ssafy.hw;

import java.util.ArrayList;
import java.util.List;

public class ProductPrinter {
	private Product product;
	private List<Product> products = new ArrayList<>();
	
	public void setProduct(Product product) {
		this.product = product;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	
	public void print() {
		System.out.println(this.product.getInfo()+"모델의 옵션입니다.");
		System.out.println("******옵션******");
		for(int i=0;i<products.size();i++) {
			System.out.println(i+". "+products.get(i).getOption()[0]+", "+products.get(i).getOption()[1]);
		}
		System.out.println("******리뷰******");
		for(int i=0;i<products.size();i++) {
			for(int j=0;j<products.get(i).getReviews().size();j++) {
				System.out.println(products.get(i).getReviews().get(j).toString());
				
			}
		}
		
	}
}
