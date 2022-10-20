package member.bean;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;


@Setter
@Getter
//@Data
@NoArgsConstructor
@RequiredArgsConstructor
public class MemberDTO {
	@NonNull
	private String name;
	private String id, pwd, gender, tel1, tel2, tel3, email1, email2, zipcode, addr1, addr2;

	

}