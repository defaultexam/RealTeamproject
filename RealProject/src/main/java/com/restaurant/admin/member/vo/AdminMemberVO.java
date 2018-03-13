package com.restaurant.admin.member.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

import com.restaurant.common.vo.CommonVO;

public class AdminMemberVO extends CommonVO {
	private int member_no = 9999;
	private String id = "";
	private String password = "";
	private String name = "";
	private int gender = 0;
	private Date birthday = null;
	private String email = "";
	private String phone = "";
	private int agreement1 = 0;
	private int agreement2 = 0;
	private int agreement3 = 0;
	private String condition = "";
	private String rank = "";
	private Date member_date = null;
	private int marriage = 0;
	private Date weddingdate = null;
	private String job = "";
	private String address = "";
	private String memo = "";
	private int point = 0;
	private Date member_outdate = null;
	private int password_confirm = 0;

	public AdminMemberVO() throws Exception {
		super();
		String oldString = "9999-12-31";
		java.util.Date date = new java.util.Date();
		date = new SimpleDateFormat("yyyy-mm-dd").parse(oldString);
		Date sqlDate = new java.sql.Date(date.getTime());
		this.birthday = sqlDate;
		this.weddingdate = sqlDate;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getAgreement1() {
		return agreement1;
	}

	public void setAgreement1(int agreement1) {
		this.agreement1 = agreement1;
	}

	public int getAgreement2() {
		return agreement2;
	}

	public void setAgreement2(int agreement2) {
		this.agreement2 = agreement2;
	}

	public int getAgreement3() {
		return agreement3;
	}

	public void setAgreement3(int agreement3) {
		this.agreement3 = agreement3;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public Date getMember_date() {
		return member_date;
	}

	public void setMember_date(Date member_date) {
		this.member_date = member_date;
	}

	public int getMarriage() {
		return marriage;
	}

	public void setMarriage(int marriage) {
		this.marriage = marriage;
	}

	public Date getWeddingdate() {
		return weddingdate;
	}

	public void setWeddingdate(Date weddingdate) {
		this.weddingdate = weddingdate;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getMember_outdate() {
		return member_outdate;
	}

	public void setMember_outdate(Date member_outdate) {
		this.member_outdate = member_outdate;
	}

	public int getPassword_confirm() {
		return password_confirm;
	}

	public void setPassword_confirm(int password_confirm) {
		this.password_confirm = password_confirm;
	}

	@Override
	public String toString() {
		return "AdminMemberVO [member_no=" + member_no + ", id=" + id + ", password=" + password + ", name=" + name
				+ ", gender=" + gender + ", birthday=" + birthday + ", email=" + email + ", phone=" + phone
				+ ", agreement1=" + agreement1 + ", agreement2=" + agreement2 + ", agreement3=" + agreement3
				+ ", condition=" + condition + ", rank=" + rank + ", member_date=" + member_date + ", marriage="
				+ marriage + ", weddingdate=" + weddingdate + ", job=" + job + ", address=" + address + ", memo=" + memo
				+ ", point=" + point + ", member_outdate=" + member_outdate + ", password_confirm=" + password_confirm
				+ "]";
	}

}
