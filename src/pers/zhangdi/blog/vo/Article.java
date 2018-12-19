package pers.zhangdi.blog.vo;

public class Article
{
  private String title;
  private String introduce;
  private String content;
  private String img;
  private String subject;
  private String time;
  private Integer reading;
  private Integer likes;
  private String id;
  
  public Article() {}
  
  public Article(String title, String introduce, String content, String img, String subject, String time, Integer reading,
		Integer likes, String id) {
	super();
	this.title = title;
	this.introduce = introduce;
	this.content = content;
	this.img = img;
	this.subject = subject;
	this.time = time;
	this.reading = reading;
	this.likes = likes;
	this.id = id;
}

public String getTitle()
  {
    return this.title;
  }
  
  public void setTitle(String title)
  {
    this.title = title;
  }
  
  public String getIntroduce()
  {
    return this.introduce;
  }
  
  public void setIntroduce(String introduce)
  {
    this.introduce = introduce;
  }
  
  public String getContent()
  {
    return this.content;
  }
  
  public void setContent(String content)
  {
    this.content = content;
  }
  
  public String getImg()
  {
    return this.img;
  }
  
  public void setImg(String img)
  {
    this.img = img;
  }
  
  public String getSubject()
  {
    return this.subject;
  }
  
  public void setSubject(String subject)
  {
    this.subject = subject;
  }
  
  public String getTime()
  {
    return this.time;
  }
  
  public void setTime(String time)
  {
    this.time = time;
  }
  
  public Integer getRead()
  {
    return this.reading;
  }
  
  public void setRead(Integer reading)
  {
    this.reading = reading;
  }
  
  public Integer getLike()
  {
    return this.likes;
  }
  
  public void setLike(Integer likes)
  {
    this.likes = likes;
  }
  
  public String getId()
  {
    return this.id;
  }
  
  public void setId(String id)
  {
    this.id = id;
  }
  
  public String toString()
  {
    return 
      "Article [title=" + this.title + ", introduce=" + this.introduce + ", content=" + this.content + ", img=" + this.img + ", subject=" + this.subject + ", time=" + this.time + ", read=" + this.reading + ", like=" + this.likes + ", id=" + this.id + "]";
  }
}
