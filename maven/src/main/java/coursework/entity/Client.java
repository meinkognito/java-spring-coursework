package coursework.entity;

import static javax.persistence.GenerationType.SEQUENCE;

import javax.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "CLIENTS")
public class Client {

  @Id
  @SequenceGenerator(
      name = "clients_sequence",
      sequenceName = "clients_sequence",
      allocationSize = 1
  )
  @GeneratedValue(
      strategy = SEQUENCE,
      generator = "clients_sequence"
  )
  private Long id;

  @Getter
  @Setter
  @Column(name = "first_name", nullable = false, length = 20)
  private String firstName;

  @Getter
  @Setter
  @Column(name = "last_name", nullable = false, length = 20)
  private String lastName;

  @Getter
  @Setter
  @Column(name = "pather_name", nullable = false, length = 20)
  private String patherName;

  @Getter
  @Setter
  @Column(name = "passport_seria", nullable = false, length = 20)
  private String passportSeria;

  @Getter
  @Setter
  @Column(name = "passport_num", nullable = false, length = 20)
  private String passportNumber;

  public Client() {
  }

  public Client(String firstName, String lastName, String patherName, String passportSeria,
      String passportNumber) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.patherName = patherName;
    this.passportSeria = passportSeria;
    this.passportNumber = passportNumber;
  }
}
