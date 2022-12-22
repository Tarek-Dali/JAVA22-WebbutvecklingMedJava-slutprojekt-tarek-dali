package model;



public class weatherBean {

    private String cityStr;

    private String countryStr;

    private String cloudsStr;
    
    private String tempStr;
    
    private String lastupdateStr;

	public weatherBean(String cityStr, String countryStr) {

        this.cityStr = cityStr;
        this.countryStr = countryStr;

    }

    public String getCityStr() {
        return cityStr;
    }

    public String getCountryStr() {
        return countryStr;
    }

    public String getCloudsStr() {
        return cloudsStr;
    }

    public void setCloudsStr(String cloudsStr) {
        this.cloudsStr = cloudsStr;
    }

    public String getTempStr() {
        return tempStr;
    }

    public void setTempStr(String tempStr) {
        this.tempStr = tempStr;
    }

	public String getLastupdateStr() {
		return lastupdateStr;
	}

	public void setLastupdateStr(String lastupdateStr) {
		this.lastupdateStr = lastupdateStr;
	}

}