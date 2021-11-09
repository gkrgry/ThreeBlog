package user;

public class LoginVO {
	private String blogid;
	private String blogpw;
	private String blogname;
	private String blogemail;
	private String blogsex;
	
	public String getBlogname() {
		return blogname;
	}
	public void setBlogname(String blogname) {
		this.blogname = blogname;
	}
	public String getBlogemail() {
		return blogemail;
	}
	public void setBlogemail(String blogemail) {
		this.blogemail = blogemail;
	}
	public String getBlogsex() {
		return blogsex;
	}
	public void setBlogsex(String blogsex) {
		this.blogsex = blogsex;
	}
	public String getBlogid() {
		return blogid;
	}
	public void setBlogid(String blogid) {
		this.blogid = blogid;
	}
	public String getBlogpw() {
		return blogpw;
	}
	public void setBlogpw(String blogpw) {
		this.blogpw = blogpw;
	}
	
}
