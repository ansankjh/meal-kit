package home.single.shop.vo;

import lombok.Data;

@Data
public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeMemo;
	private String createdate;
	private String updatedate;
}
