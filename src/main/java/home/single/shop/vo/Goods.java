package home.single.shop.vo;

import lombok.Data;

@Data
public class Goods {
	private int goodsNo;
	private int goodsMainCategoryNo;
	private int goodsSubCategoryNo;
	private String goodsName;
	private String goodsMemo;
	private int goodsPrice;
	private String goodsActive;
	private int goodsSold;
	private String createdate;
	private String updatedate;
}
