package com.yuanfz.requestbody;

public class requestUser {
	String userName;
	String userPassword;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	@Override
	public String toString() {
		return "user: username:"+userName+"password:"+userPassword;
	}
	
	

}
