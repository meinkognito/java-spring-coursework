package coursework.entity;

import static javax.persistence.GenerationType.SEQUENCE;

import javax.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "BOOKS")
public class Book {

  @Id
  @SequenceGenerator(
      name = "books_sequence",
      sequenceName = "books_sequence",
      allocationSize = 1
  )
  @GeneratedValue(
      strategy = SEQUENCE,
      generator = "books_sequence"
  )
  private Long id;

  @Getter
  @Setter
  @Column(name = "name", nullable = false, length = 50)
  private String name;

  @Getter
  @Setter
  @Column(name = "cnt", nullable = false)
  private Integer count;

  @Getter
  @Setter
  @ManyToOne
  @JoinColumn(
      name = "type_id",
      foreignKey = @ForeignKey(
          name = "fk_books_book_types"
      )
  )
  private BookType typeId;

  public Book() {
  }

  public Book(String name, Integer count, BookType typeId) {
    this.name = name;
    this.count = count;
    this.typeId = typeId;
  }
}
