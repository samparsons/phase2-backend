package shop;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tbl_user")
public class User {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int userId;
	
	private String name;
	
	private String family;
	
	private Account userAccount;
	
	private Address userAddress;
	
	public User() {
		super();
	}
	
	public User(String name, String family, Account userAccount,Address userAddress) {
		super();
		this.name = name;
		this.family = family;
		this.userAccount = userAccount;
		this.userAddress = userAddress;
	}
	
	public Account getUserAccount() {
		return userAccount;
	}
	
	public void setUserAccount(Account userAccount) {
		this.userAccount = userAccount;
	}

	public Address getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(Address userAddress) {
		this.userAddress = userAddress;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFamily() {
		return family;
	}

	public void setFamily(String family) {
		this.family = family;
	}

	public int getUserId() {
		return userId;
	}

	
	

}
