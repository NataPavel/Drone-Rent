package models;

public class Drone {

	private int id;
	private String name;
	private String desc;
	private String image;
	private int categoryId;
	
	/*public Drone(int id, String name, String desc) {
		super();
		this.id = id;
		this.name = name;
		this.desc = desc;
	}*/
	
	public Drone(int id, String name, String desc, String image, int categoryId) {
		super();
		this.id = id;
		this.name = name;
		this.desc = desc;
		this.image = image;
		this.categoryId = categoryId;
	}


	/*public Drone(int id, String name, String desc, String image) {
		super();
		this.id = id;
		this.name = name;
		this.desc = desc;
		this.image = image;
	}*/

	
	public Drone(int id, String name, String desc, int categoryId) {
		super();
		this.id = id;
		this.name = name;
		this.desc = desc;
		this.categoryId = categoryId;
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
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	
	
}
