package homework.regist;

public class RegistDTO {
	//멤버변수
	private String id;
	private String pass;
	private String name;
	private String email;
	private String mailing;//이메일수신여부
	private String zipcode;
	private String addr1;
	private String addr2;
	private String mobile;
	private String sms; //sms수신여부
	
	public RegistDTO() {};
	
	//인수를 가진 인수생성자
	//매개변수랑 멤버변수랑 같기 때문에 this로 구분
	public RegistDTO(String id, String pass, String name, String email, String mailing, String zipcode, String addr1,
			String addr2, String mobile, String sms) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.email = email;
		this.mailing = mailing;
		this.zipcode = zipcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.mobile = mobile;
		this.sms = sms;
	}
	
	//getter,setter 정의
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMailing() {
		return mailing;
	}
	public void setMailing(String mailing) {
		this.mailing = mailing;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getSms() {
		return sms;
	}
	public void setSms(String sms) {
		this.sms = sms;
	}
		
}
