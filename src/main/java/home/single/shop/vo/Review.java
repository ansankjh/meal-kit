package home.single.shop.vo;

import lombok.Data;

@Data
public class Review {
	private int reviewNo;
	private int ordersNo;
	private int goodsNo;
	private String reviewMemo;
	private String grade;
	private String createdate;
	private String updatedate;
}
