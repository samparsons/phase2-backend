package shop;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="tbl_product")
public class Product {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int productId;
	private String name;
	private double price;
	
	@OneToMany(mappedBy="product",cascade=CascadeType.ALL)
	private List<ProductImage> images;
	

	public Product() {
		super();
	}
	
	public Product(String name, double price) {
		super();
		this.name = name;
		this.price = price;
		images = new ArrayList<ProductImage>();
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getProductId() {
		return productId;
	}

	public void addImage(ProductImage image) {
		images.add(image);
	}

}
