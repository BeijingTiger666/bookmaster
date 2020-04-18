package com.hisen.entity;

/**
 * Created by hisen on 17-4-24.
 */
public class Book {
  private long bookid;
  private String bookname;
  private int number;
  private String detail;

  public long getBookid() {
    return bookid;
  }

  public void setBookid(long bookid) {
    this.bookid = bookid;
  }

  public String getBookname() {
    return bookname;
  }

  public void setBookname(String bookname) {
    this.bookname = bookname;
  }

  public int getNumber() {
    return number;
  }

  public void setNumber(int number) {
    this.number = number;
  }

  public String getDetail() {
    return detail;
  }

  public void setDetail(String detail) {
    this.detail = detail;
  }

  @Override
  public String toString() {
    return "Book{" +
            "bookid=" + bookid +
            ", bookname='" + bookname + '\'' +
            ", number=" + number +
            ", detail='" + detail + '\'' +
            '}';
  }
}
