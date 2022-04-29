package coursework.entity;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "JOURNAL")
public class Journal {

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  @Column(name = "id")
  private Long id;

  @ManyToOne
  @JoinColumn(
      name = "book_id",
      nullable = false,
      referencedColumnName = "id",
      foreignKey = @ForeignKey(
          name = "fk_journal_books"
      )
  )
  private Book bookId;

  @ManyToOne
  @JoinColumn(
      name = "client_id",
      nullable = false,
      referencedColumnName = "id",
      foreignKey = @ForeignKey(
          name = "fk_journal_clients"
      )
  )
  private Client clientId;

  @Column(name = "date_beg", nullable = false)
  private LocalDateTime beginDate;

  @Column(name = "date_end", nullable = false)
  private LocalDateTime endDate;

  @Column(name = "date_ret", nullable = false)
  private LocalDateTime returnDate;

  public Journal() {
  }

  public Journal(Book bookId, Client clientId, LocalDateTime beginDate,
      LocalDateTime endDate, LocalDateTime returnDate) {
    this.bookId = bookId;
    this.clientId = clientId;
    this.beginDate = beginDate;
    this.endDate = endDate;
    this.returnDate = returnDate;
  }

  public Book getBookId() {
    return bookId;
  }

  public void setBookId(Book bookId) {
    this.bookId = bookId;
  }

  public Client getClientId() {
    return clientId;
  }

  public void setClientId(Client clientId) {
    this.clientId = clientId;
  }

  public LocalDateTime getBeginDate() {
    return beginDate;
  }

  public void setBeginDate(LocalDateTime beginDate) {
    this.beginDate = beginDate;
  }

  public LocalDateTime getEndDate() {
    return endDate;
  }

  public void setEndDate(LocalDateTime endDate) {
    this.endDate = endDate;
  }

  public LocalDateTime getReturnDate() {
    return returnDate;
  }

  public void setReturnDate(LocalDateTime returnDate) {
    this.returnDate = returnDate;
  }

  @Override
  public String toString() {
    return "Journal{" +
        "id=" + id +
        ", bookId=" + bookId +
        ", clientId=" + clientId +
        ", beginDate=" + beginDate +
        ", endDate=" + endDate +
        ", returnDate=" + returnDate +
        '}';
  }
}
