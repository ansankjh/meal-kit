package home.single.shop.vo;

import lombok.Data;

@Data
public class Stock {
	private int stockNo;
	private int goodsNo;
	private int stockQuantity;
	private String stockState;
	private String createdate;
}
