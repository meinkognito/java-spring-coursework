package coursework.entity;

import javax.persistence.*;

@Entity
@Table(name = "CLIENTS")
public class Client {

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  @Column(name = "id")
  private Long id;

  @Column(name = "first_name", nullable = false, length = 20)
  private String firstName;

  @Column(name = "last_name", nullable = false, length = 20)
  private String lastName;

  @Column(name = "pather_name", nullable = false, length = 20)
  private String patherName;

  @Column(name = "passport_seria", nullable = false, length = 20)
  private String passportSeria;

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

  public String getFirstName() {
    return firstName;
  }

  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  public String getLastName() {
    return lastName;
  }

  public void setLastName(String lastName) {
    this.lastName = lastName;
  }

  public String getPatherName() {
    return patherName;
  }

  public void setPatherName(String patherName) {
    this.patherName = patherName;
  }

  public String getPassportSeria() {
    return passportSeria;
  }

  public void setPassportSeria(String passportSeria) {
    this.passportSeria = passportSeria;
  }

  public String getPassportNumber() {
    return passportNumber;
  }

  public void setPassportNumber(String passportNumber) {
    this.passportNumber = passportNumber;
  }

  @Override
  public String toString() {
    return "Client{" +
        "id=" + id +
        ", firstName='" + firstName + '\'' +
        ", lastName='" + lastName + '\'' +
        ", patherName='" + patherName + '\'' +
        ", passportSeria='" + passportSeria + '\'' +
        ", passportNumber='" + passportNumber + '\'' +
        '}';
  }
}
