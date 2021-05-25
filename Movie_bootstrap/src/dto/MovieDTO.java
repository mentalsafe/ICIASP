package dto;

public class MovieDTO {

	// 필드
	private int moNum;			//영화번호
	private String moTitle;		//영화제목
	private String moPic;		//영화사진
	private String moUrl;		//영상주소
	private String moContents;	//줄거리
	private String moTime;		//상영시간
	private String moGenre;		//장르
	private String moDate;		//개봉일
	private String moAct;		//출연진
	
	
	// getter, setter 메소드
	public int getMoNum() {
		return moNum;
	}
	public void setMoNum(int moNum) {
		this.moNum = moNum;
	}
	
	public String getMoTitle() {
		return moTitle;
	}
	public void setMoTitle(String moTitle) {
		this.moTitle = moTitle;
	}
	
	public String getMoPic() {
		return moPic;
	}
	public void setMoPic(String moPic) {
		this.moPic = moPic;
	}
	
	public String getMoUrl() {
		return moUrl;
	}
	public void setMoUrl(String moUrl) {
		this.moUrl = moUrl;
	}
	
	public String getMoContents() {
		return moContents;
	}
	public void setMoContents(String moContents) {
		this.moContents = moContents;
	}
	
	public String getMoTime() {
		return moTime;
	}
	public void setMoTime(String moTime) {
		this.moTime = moTime;
	}
	
	public String getMoGenre() {
		return moGenre;
	}
	public void setMoGenre(String moGenre) {
		this.moGenre = moGenre;
	}
	
	public String getMoDate() {
		return moDate;
	}
	public void setMoDate(String moDate) {
		this.moDate = moDate;
	}
	
	public String getMoAct() {
		return moAct;
	}
	public void setMoAct(String moAct) {
		this.moAct = moAct;
	}
	
	
	// toString
	@Override
	public String toString() {
		return "MovieDTO [moNum=" + moNum + ", moTitle=" + moTitle + ", moPic=" + moPic + ", moUrl=" + moUrl
				+ ", moContents=" + moContents + ", moTime=" + moTime + ", moGenre=" + moGenre + ", moDate=" + moDate
				+ ", moAct=" + moAct + "]";
	}
	
	
	// 기본생성자, 메개변수 생성자
	public MovieDTO() {
		super();
	}
	
	
	public MovieDTO(int moNum, String moTitle, String moPic, String moUrl, String moContents, String moTime,
			String moGenre, String moDate, String moAct) {
		super();
		this.moNum = moNum;
		this.moTitle = moTitle;
		this.moPic = moPic;
		this.moUrl = moUrl;
		this.moContents = moContents;
		this.moTime = moTime;
		this.moGenre = moGenre;
		this.moDate = moDate;
		this.moAct = moAct;
	}
	
	
	
}
