package shop;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="tbl_product_image_meta")
public class ProductImageMeta {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int metaId;
	
	private String meta_key;
	
	private String meta_value;
	
	@ManyToOne(fetch=FetchType.LAZY)
	private ProductImage productImage;
	
	

	public int getMetaId() {
		return metaId;
	}

	public String getKey() {
		return meta_key;
	}

	public void setKey(String meta_key) {
		this.meta_key = meta_key;
	}

	public String getValue() {
		return meta_value;
	}

	public void setValue(String meta_value) {
		this.meta_value = meta_value;
	}

	public ProductImage getProductImage() {
		return productImage;
	}

	public void setProductImage(ProductImage productImage) {
		this.productImage = productImage;
	}

	public ProductImageMeta(String meta_key,String meta_value) {
		super();
		this.meta_key = meta_key;
		this.meta_value = meta_value;
	}
	
	
	
}
