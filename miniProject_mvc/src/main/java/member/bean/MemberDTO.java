package member.bean;

import lombok.Getter;
import lombok.Setter;

@Setter@Getter
public class MemberDTO {
	
	private String name;
	private String id, pwd, gender, tel1, tel2, tel3, email1, email2, zipcode, addr1, addr2;
}