package dto;

public class PageDTO {
	private int page;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int listCount;
	private int limit;
	
    ///////////////////// getter setter ///////	//////////////
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	
	///////////////////// ToString /////////////////////
	
	@Override
	public String toString() {
		return "PageDTO [page=" + page + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", listCount=" + listCount + ", limit=" + limit + "]";
	}
	
	///////////////////// Field value /////////////////////
	
	public PageDTO(int page, int maxPage, int startPage, int endPage, int listCount, int limit) {
		super();
		this.page = page;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.listCount = listCount;
		this.limit = limit;
	}
	
	///////////////////// Field value (null) /////////////////////
	
	public PageDTO() {
		super();
	}
}
