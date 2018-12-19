package pers.zhangdi.blog.vo;

public class About
{
  private String img;
  private String name;
  private String work;
  private String abtext;
  private String content;
  private String abblog;
  
  public String getImg()
  {
    return this.img;
  }
  
  public void setImg(String img)
  {
    this.img = img;
  }
  
  public String getName()
  {
    return this.name;
  }
  
  public void setName(String name)
  {
    this.name = name;
  }
  
  public String getWork()
  {
    return this.work;
  }
  
  public void setWork(String work)
  {
    this.work = work;
  }
  
  public String getAbtext()
  {
    return this.abtext;
  }
  
  public void setAbtext(String abtext)
  {
    this.abtext = abtext;
  }
  
  public String getContent()
  {
    return this.content;
  }
  
  public void setContent(String content)
  {
    this.content = content;
  }
  
  public String getAbblog()
  {
    return this.abblog;
  }
  
  public void setAbblog(String abblog)
  {
    this.abblog = abblog;
  }
  
  public String toString()
  {
    return 
      "About [img=" + this.img + ", name=" + this.name + ", work=" + this.work + ", abtext=" + this.abtext + ", content=" + this.content + ", abblog=" + this.abblog + "]";
  }
}
