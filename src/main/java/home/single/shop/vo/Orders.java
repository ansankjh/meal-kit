package home.single.shop.vo;

import lombok.Data;

@Data
public class Orders {
	private int ordersNo;
	private String customerId;
	private int customerAddressNo;
	private int ordersPirce;
	private String ordersState;
	private String ordersMethod;
	private String ordersMemo;
	private String createdate;
}
