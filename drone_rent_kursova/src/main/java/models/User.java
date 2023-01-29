package models;

public class User {

	private int id;
	private String name;
	private String passw;
	private String email;
	private String regDate;
	private String phone;
	private int roleId;
	private int statusId;
	private int mailConfirm;
	
	public User(int id, String name, String passw, String email, String regDate, String phone, int roleId, int statusId,
			int mailConfirm) {
		super();
		this.id = id;
		this.name = name;
		this.passw = passw;
		this.email = email;
		this.regDate = regDate;
		this.phone = phone;
		this.roleId = roleId;
		this.statusId = statusId;
		this.mailConfirm = mailConfirm;
	}

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassw() {
		return passw;
	}

	public void setPassw(String passw) {
		this.passw = passw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public int getStatusId() {
		return statusId;
	}

	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}

	public int getMailConfirm() {
		return mailConfirm;
	}

	public void setMailConfirm(int mailConfirm) {
		this.mailConfirm = mailConfirm;
	}
	
	
}
