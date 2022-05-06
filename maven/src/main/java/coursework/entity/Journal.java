package coursework.entity;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.*;
import java.time.LocalDate;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "JOURNAL")
public class Journal {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @OneToMany
  @JoinColumn(
      name = "book_id",
      foreignKey = @ForeignKey(
          name = "fk_journal_books"
      )
  )
  private List<Book> books = new ArrayList<>();

  @OneToMany
  @JoinColumn(
      name = "client_id",
      foreignKey = @ForeignKey(
          name = "fk_journal_clients"
      )
  )
  private List<Client> clients = new ArrayList<>();

  @Column(name = "date_beg", nullable = false)
  private LocalDate beginDate;

  @Column(name = "date_end", nullable = false)
  private LocalDate endDate;

  @Column(name = "date_ret", nullable = false)
  private LocalDate returnDate;

  public Journal(Book book, Client client, LocalDate beginDate,
      LocalDate endDate, LocalDate returnDate) {
    this.books.add(book);
    this.clients.add(client);
    this.beginDate = beginDate;
    this.endDate = endDate;
    this.returnDate = returnDate;
  }
}
