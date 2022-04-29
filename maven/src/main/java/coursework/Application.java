package coursework;

import coursework.entity.*;
import coursework.repositories.*;

import java.time.LocalDate;
import java.time.Month;
import java.util.List;
import java.util.Optional;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class Application {

  public static void main(String[] args) {
    SpringApplication.run(Application.class, args);
  }

  @Bean
  CommandLineRunner commandLineRunner(
      BookTypesRepostitory bookTypesRepostitory,
      BooksRepostitory booksRepostitory,
      ClientsRepostitory clientsRepostitory,
      JournalRepostitory journalRepostitory
  ) {

    return args -> {

      BookType type1 = new BookType("Science Fiction", 50, 15, 30);
      BookType type2 = new BookType("Fairy tales", 40, 15, 30);
      BookType type3 = new BookType("Detective", 20, 15, 30);
      BookType type4 = new BookType("Horror", 15, 15, 30);

      bookTypesRepostitory.saveAll(List.of(type1, type2, type3, type4));

      Book book1 = new Book("1984", 7, type1);
      Book book2 = new Book("Sherlock Holmes", 10, type3);
      Book book3 = new Book("IT", 3, type4);
      Book book4 = new Book("Cinderella", 6, type2);

      booksRepostitory.saveAll(List.of(book1, book2, book3, book4));

      Client client1 = new Client(
          "Abraham",
          "Lincoln",
          "president of the US",
          "5555",
          "567890");

      Client client2 = new Client(
          "George",
          "Washington",
          "president of the US",
          "1234",
          "097856"
      );

      clientsRepostitory.saveAll(List.of(client1, client2));

      Journal journal1 = new Journal(book1,
          client1,
          LocalDate.of(1984, Month.AUGUST, 19),
          LocalDate.of(1984, Month.SEPTEMBER, 10),
          LocalDate.of(1984, Month.AUGUST, 31));

      Journal journal2 = new Journal(book2,
          client2,
          LocalDate.of(2013, Month.AUGUST, 19),
          LocalDate.of(2013, Month.SEPTEMBER, 10),
          LocalDate.of(2013, Month.AUGUST, 31));

      journalRepostitory.saveAll(List.of(journal1, journal2));


      Optional<Book> temp = booksRepostitory.findById(2L);
      if (temp.isPresent()) {
        temp.get().setName("IT 2");
        temp.get().setCount(4);
      }


    };
  }

}
