package coursework.entity;

import javax.persistence.*;

@Entity
@Table(name = "BOOKS")
public class Book {

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  @Column(name = "id")
  private Long id;

  @Column(name = "name", nullable = false, length = 50)
  private String name;

  @Column(name = "cnt", nullable = false)
  private Integer count;

  @ManyToOne
  @JoinColumn(
      name = "type_id",
      nullable = false,
      referencedColumnName = "id",
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

  public BookType getTypeId() {
    return typeId;
  }

  public void setTypeId(BookType typeId) {
    this.typeId = typeId;
  }

  @Override
  public String toString() {
    return "Book{" +
        "id=" + id +
        ", name='" + name + '\'' +
        ", count=" + count +
        ", typeId=" + typeId +
        '}';
  }
}
