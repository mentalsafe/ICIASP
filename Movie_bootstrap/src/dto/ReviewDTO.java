package dto;

public class ReviewDTO {
	private int morMonum;
	private int	morNum;
	private String morId;
	private	String morContents;
	private	String morStar;
	///////////////////// getter setter ///////////////////////////
	public int getMorMonum() {
		return morMonum;
	}

	public void setMorMonum(int morMonum) {
		this.morMonum = morMonum;
	}

	
	public int getMorNum() {
		return morNum;
	}
	
	public void setMorNum(int morNum) {
		this.morNum = morNum;
	}
	public String getMorId() {
		return morId;
	}
	public void setMorId(String morId) {
		this.morId = morId;
	}
	public String getMorContents() {
		return morContents;
	}
	public void setMorContents(String morContents) {
		this.morContents = morContents;
	}
	public String getMorStar() {
		return morStar;
	}
	public void setMorStar(String morStar) {
		this.morStar = morStar;
	}
	
	
	
	@Override
	public String toString() {
		return "ReviewDTO [morMonum=" + morMonum + ", morNum=" + morNum + ", morId=" + morId + ", morContents="
				+ morContents + ", morStar=" + morStar + "]";
	}
	///////////////////// Field value ////////////////////////////
	public ReviewDTO(int morMonum, int morNum, String morId, String morContents, String morStar) {
		super();
		this.morMonum = morMonum;
		this.morNum = morNum;
		this.morId = morId;
		this.morContents = morContents;
		this.morStar = morStar;
	}
	///////////////////// Field value (null) /////////////////////
	public ReviewDTO() {
		super();
	}
}
