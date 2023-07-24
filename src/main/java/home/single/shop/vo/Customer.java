package home.single.shop.vo;

import lombok.Data;

@Data
public class Customer {
	private String customerId;
	private String customerPw;
	private String customerEmailMarketingAccept;
	private String customerInfoAgree;
	private String createdate;
	private String updatedate;
}
