package pers.zhangdi.blog.vo;

public class Comment {
	private String name;
	private String email;
	private String time;
	private String comment;
	private String id;
	private String pre;
	private Integer next;
	private String pre_name;
	
	public Comment() {}

	public Comment(String name, String email, String time, String comment, String id, String pre, Integer next,String pre_name) {
		super();
		this.name = name;
		this.email = email;
		this.time = time;
		this.comment = comment;
		this.id = id;
		this.pre = pre;
		this.next = next;
		this.pre_name = pre_name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPre() {
		return pre;
	}

	public void setPre(String pre) {
		this.pre = pre;
	}

	public Integer getNext() {
		return next;
	}

	public void setNext(Integer next) {
		this.next = next;
	}
	
	public String getPre_name() {
		return pre_name;
	}

	public void setPre_name(String pre_name) {
		this.pre_name = pre_name;
	}

	@Override
	public String toString() {
		return "Comment [name=" + name + ", email=" + email + ", time=" + time + ", comment=" + comment + ", id=" + id
				+ ", pre=" + pre + ", next=" + next + ", pre_name=" + pre_name + "]";
	}
	
}	
