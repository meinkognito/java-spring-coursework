package coursework.entity;

import static javax.persistence.GenerationType.SEQUENCE;

import javax.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "BOOK_TYPES")
public class BookType {

  @Id
  @SequenceGenerator(
      name = "book_types_sequence",
      sequenceName = "book_types_sequence",
      allocationSize = 1
  )
  @GeneratedValue(
      strategy = SEQUENCE,
      generator = "book_types_sequence"
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
  @Column(name = "fine", nullable = false)
  private Integer fine;

  @Getter
  @Setter
  @Column(name = "day_count", nullable = false)
  private Integer dayCount;

  public BookType() {
  }

  public BookType(String name, Integer count, Integer fine, Integer dayCount) {
    this.name = name;
    this.count = count;
    this.fine = fine;
    this.dayCount = dayCount;
  }
}
