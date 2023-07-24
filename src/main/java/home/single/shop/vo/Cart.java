package home.single.shop.vo;

import lombok.Data;

@Data
public class Cart {
	private int cartNo;
	private int goodsNo;
	private String customerId;
	private int cartQuantity;
	private String createdate;
	private String updatedate;	
}
