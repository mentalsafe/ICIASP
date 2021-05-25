package dto;

public class SaveDTO {
	
	private String mosId;
	private String mosPic;
	private int mosNum;
	private String mosTitle;
	
	
	
	public String getMosId() {
		return mosId;
	}
	public void setMosId(String mosId) {
		this.mosId = mosId;
	}
	public String getMosPic() {
		return mosPic;
	}
	public void setMosPic(String mosPic) {
		this.mosPic = mosPic;
	}
	public int getMosNum() {
		return mosNum;
	}
	public void setMosNum(int mosNum) {
		this.mosNum = mosNum;
	}
	public String getMosTitle() {
		return mosTitle;
	}
	public void setMosTitle(String mosTitle) {
		this.mosTitle = mosTitle;
	}
	
	
	@Override
	public String toString() {
		return "SaveDTO [mosId=" + mosId + ", mosPic=" + mosPic + ", mosNum=" + mosNum + ", mosTitle=" + mosTitle + "]";
	}
	
	
	public SaveDTO(String mosId, String mosPic, int mosNum, String mosTitle) {
		super();
		this.mosId = mosId;
		this.mosPic = mosPic;
		this.mosNum = mosNum;
		this.mosTitle = mosTitle;
	}
	
	
	public SaveDTO() {
		super();
	}
	
	
	
	
	
	
}
