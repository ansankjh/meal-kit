package home.single.shop.vo;

import lombok.Data;

@Data
public class Faq {
	private int faqNo;
	private int faqCategoryNo;
	private String faqTitle;
	private String faqMemo;
	private String createdate;
	private String updatedate;
}
