package shop;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="tbl_product_image")
public class ProductImage {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int imageId;
	
	private String imageUrl;
	
	@ManyToOne(fetch=FetchType.LAZY)
	private Product product;
	
	@OneToMany(mappedBy="productImage",cascade=CascadeType.ALL)
	private List<ProductImageMeta> imageMeta;
	
	public ProductImage() {
		super();
	}
	
	public ProductImage(String imageUrl, Product product) {
		super();
		this.imageUrl = imageUrl;
		this.product = product;
		imageMeta = new ArrayList<>();
	}
	
	public int getImageId() {
		return imageId;
	}
	
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public List<ProductImageMeta> getImageMeta() {
		return imageMeta;
	}

	public void addImageMeta(ProductImageMeta meta) {
		imageMeta.add(meta);
	}
	
	
	
	
	
	
	
}
