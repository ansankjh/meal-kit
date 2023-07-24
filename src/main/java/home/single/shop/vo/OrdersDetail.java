package home.single.shop.vo;

import lombok.Data;

@Data
public class OrdersDetail {
	private int ordersDetailNo;
	private int ordersNo;
	private int goodsNo;
	private int goodsQuantity;
	private String createdate;
}
