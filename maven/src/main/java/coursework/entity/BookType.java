package coursework.entity;
import static javax.persistence.GenerationType.SEQUENCE;

import javax.persistence.*;


@Entity(name = "BookType")
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

  @Column(name = "name", nullable = false, length = 50)
  private String name;

  @Column(name = "cnt", nullable = false)
  private Integer count;

  @Column(name = "fine", nullable = false)
  private Integer fine;

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

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Integer getCount() {
    return count;
  }

  public void setCount(Integer count) {
    this.count = count;
  }

  public Integer getFine() {
    return fine;
  }

  public void setFine(Integer fine) {
    this.fine = fine;
  }

  public Integer getDayCount() {
    return dayCount;
  }

  public void setDayCount(Integer dayCount) {
    this.dayCount = dayCount;
  }

  @Override
  public String toString() {
    return "BookType{" +
        "id=" + id +
        ", name='" + name + '\'' +
        ", count=" + count +
        ", fine=" + fine +
        ", dayCount=" + dayCount +
        '}';
  }
}
