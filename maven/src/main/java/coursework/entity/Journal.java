package coursework.entity;

import javax.persistence.*;
import java.time.LocalDate;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "JOURNAL")
@NoArgsConstructor
public class Journal {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @ManyToOne
  @JoinColumn(
      name = "book_id",
      foreignKey = @ForeignKey(
          name = "fk_journal_books"
      )
  )
  private Book bookId;

  @ManyToOne
  @JoinColumn(
      name = "client_id",
      foreignKey = @ForeignKey(
          name = "fk_journal_clients"
      )
  )
  private Client clientId;

  @Column(name = "date_beg", nullable = false)
  private LocalDate beginDate;

  @Column(name = "date_end", nullable = false)
  private LocalDate endDate;

  @Column(name = "date_ret", nullable = false)
  private LocalDate returnDate;

  public Journal(Book bookId, Client clientId, LocalDate beginDate,
      LocalDate endDate, LocalDate returnDate) {
    this.bookId = bookId;
    this.clientId = clientId;
    this.beginDate = beginDate;
    this.endDate = endDate;
    this.returnDate = returnDate;
  }
}
