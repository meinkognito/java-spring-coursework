package coursework;

import coursework.entity.*;
import coursework.service.*;

import java.time.LocalDate;
import java.time.Month;
import java.util.List;
import java.util.Set;
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
      BookTypesService bookTypesService,
      BooksService booksService,
      ClientsService clientsService,
      JournalService journalService
  ) {

    return args -> {

      BookType type1 = new BookType("Science Fiction", 50, 15, 30);
      BookType type2 = new BookType("Fairy tales", 40, 15, 30);
      BookType type3 = new BookType("Detective", 20, 15, 30);
      BookType type4 = new BookType("Horror", 15, 15, 30);

      bookTypesService.addBookTypes(List.of(type1, type2, type3, type4));

      Book book1 = new Book("1984", 7, type1);
      Book book2 = new Book("Sherlock Holmes", 10, type3);
      Book book3 = new Book("IT", 3, type4);
      Book book4 = new Book("Cinderella", 6, type2);

      booksService.addBooks(List.of(book1, book2, book3, book4));

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

      clientsService.addClients(List.of(client1, client2));

      Journal journal1 = new Journal(
          Set.of(book1, book2),
          Set.of(client1),
          LocalDate.of(1984, Month.AUGUST, 19),
          LocalDate.of(1984, Month.SEPTEMBER, 10),
          LocalDate.of(1984, Month.AUGUST, 31));

      Journal journal2 = new Journal(
          Set.of(book3, book4),
          Set.of(client2),
          LocalDate.of(2013, Month.AUGUST, 19),
          LocalDate.of(2013, Month.SEPTEMBER, 10),
          LocalDate.of(2013, Month.AUGUST, 31));

      journalService.addJournals(List.of(journal1, journal2));

      BookType tempType = bookTypesService.getBookTypeById(1L);
      tempType.setDayCount(20);

      booksService.updateBook(2L, new Book("Sherlock Holmes 2", 5, type3));

      bookTypesService.deleteBookType(4L);

      clientsService.updateClient(1L,
          new Client(
              "George",
              "Washington",
              "president of the US",
              "1234",
              "097856"
          ));

      journalService.deleteJournal(2L);

      for (Book book : journalService.getJournalById(1L).getBooks()) {
        booksService.deleteBook(book.getId());
      }
    };
  }
}
