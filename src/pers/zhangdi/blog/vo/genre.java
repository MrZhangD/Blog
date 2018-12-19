package pers.zhangdi.blog.vo;

public class genre
{
  private String genre;
  private String subject;
  private String id;
  
  public String getGenre()
  {
    return this.genre;
  }
  
  public void setGenre(String genre)
  {
    this.genre = genre;
  }
  
  public String getSubject()
  {
    return this.subject;
  }
  
  public void setSubject(String subject)
  {
    this.subject = subject;
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
    return "genre [genre=" + this.genre + ", subject=" + this.subject + ", id=" + this.id + "]";
  }
}
