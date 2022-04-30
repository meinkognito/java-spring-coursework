package coursework.entity;

import static javax.persistence.GenerationType.SEQUENCE;

import javax.persistence.*;
import java.time.LocalDate;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "JOURNAL")
public class Journal {

  @Id
  @SequenceGenerator(
      name = "journal_sequence",
      sequenceName = "journal_sequence",
      allocationSize = 1
  )
  @GeneratedValue(
      strategy = SEQUENCE,
      generator = "journal_sequence"
  )
  private Long id;

  @Getter
  @Setter
  @ManyToOne
  @JoinColumn(
      name = "book_id",
      foreignKey = @ForeignKey(
          name = "fk_journal_books"
      )
  )
  private Book bookId;

  @Getter
  @Setter
  @ManyToOne
  @JoinColumn(
      name = "client_id",
      foreignKey = @ForeignKey(
          name = "fk_journal_clients"
      )
  )
  private Client clientId;

  @Getter
  @Setter
  @Column(name = "date_beg", nullable = false)
  private LocalDate beginDate;

  @Getter
  @Setter
  @Column(name = "date_end", nullable = false)
  private LocalDate endDate;

  @Getter
  @Setter
  @Column(name = "date_ret", nullable = false)
  private LocalDate returnDate;

  public Journal() {
  }

  public Journal(Book bookId, Client clientId, LocalDate beginDate,
      LocalDate endDate, LocalDate returnDate) {
    this.bookId = bookId;
    this.clientId = clientId;
    this.beginDate = beginDate;
    this.endDate = endDate;
    this.returnDate = returnDate;
  }
}
