package dto;

public class MemberDTO {
	
	private String momId;
	private String momPw;
	private String momName;
	private String momBirth;
	private String momGender;
	private String momEmail;
	private String momPhone;
	private int momMoney;
	private String momSub;
	private int momSubD;
	
	
	
	
	public int getMomSubD() {
		return momSubD;
	}
	public void setMomSubD(int momSubD) {
		this.momSubD = momSubD;
	}
	public String getMomId() {
		return momId;
	}
	public void setMomId(String momId) {
		this.momId = momId;
	}
	public String getMomPw() {
		return momPw;
	}
	public void setMomPw(String momPw) {
		this.momPw = momPw;
	}
	public String getMomName() {
		return momName;
	}
	public void setMomName(String momName) {
		this.momName = momName;
	}
	public String getMomBirth() {
		return momBirth;
	}
	public void setMomBirth(String momBirth) {
		this.momBirth = momBirth;
	}
	public String getMomGender() {
		return momGender;
	}
	public void setMomGender(String momGender) {
		this.momGender = momGender;
	}
	public String getMomEmail() {
		return momEmail;
	}
	public void setMomEmail(String momEmail) {
		this.momEmail = momEmail;
	}
	public String getMomPhone() {
		return momPhone;
	}
	public void setMomPhone(String momPhone) {
		this.momPhone = momPhone;
	}
	public int getMomMoney() {
		return momMoney;
	}
	public void setMomMoney(int momMoney) {
		this.momMoney = momMoney;
	}
	public String getMomSub() {
		return momSub;
	}
	public void setMomSub(String momSub) {
		this.momSub = momSub;
	}
	
	
	@Override
	public String toString() {
		return "MemberDTO [momId=" + momId + ", momPw=" + momPw + ", momName=" + momName + ", momBirth=" + momBirth
				+ ", momGender=" + momGender + ", momEmail=" + momEmail + ", momPhone=" + momPhone + ", momMoney="
				+ momMoney + ", momSub=" + momSub + ", momSubD=" + momSubD + "]";
	}
	
	
	public MemberDTO(String momId, String momPw, String momName, String momBirth, String momGender, String momEmail,
			String momPhone, int momMoney, String momSub, int momSubD) {
		super();
		this.momId = momId;
		this.momPw = momPw;
		this.momName = momName;
		this.momBirth = momBirth;
		this.momGender = momGender;
		this.momEmail = momEmail;
		this.momPhone = momPhone;
		this.momMoney = momMoney;
		this.momSub = momSub;
		this.momSubD = momSubD;
	}
	
	
	public MemberDTO() {
		super();
	}
	
	
	
	
	
	
	

}
