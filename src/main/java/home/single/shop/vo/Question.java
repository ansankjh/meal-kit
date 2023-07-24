package home.single.shop.vo;

import lombok.Data;

@Data
public class Question {
	private int questionNo;
	private String customerId;
	private int mainCategoryNo;
	private int subCategoryNo;
	private String questionTitle;
	private String questionMemo;
	private String createdate;
	private String updatedate;
}
