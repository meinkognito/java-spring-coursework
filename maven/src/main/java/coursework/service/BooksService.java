package coursework.service;

import coursework.entity.Book;
import coursework.repositories.BooksRepostitory;
import java.util.List;
import java.util.NoSuchElementException;
import javax.transaction.Transactional;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class BooksService {

  private final BooksRepostitory booksRepostitory;

  public List<Book> listOfBooks() {
    return booksRepostitory.findAll();
  }

  public Book getBookById(Long id) throws NoSuchElementException {
    return booksRepostitory.findById(id)
        .orElseThrow(() -> new NoSuchElementException("no book"));
  }

  public Book addBook(Book newBook) {
    return booksRepostitory.save(newBook);
  }

  @Transactional
  public void updateBook(Long id, Book book) throws NoSuchElementException {
    Book draft = booksRepostitory.findById(id)
        .orElseThrow(() -> new NoSuchElementException("no book"));

    draft.setName(book.getName());
    draft.setCount(book.getCount());
    draft.setType(book.getType());
  }

  public void deleteBook(Long id) throws NoSuchElementException {
    Book bookToDelete = booksRepostitory.findById(id)
        .orElseThrow(() -> new NoSuchElementException("no book"));

    booksRepostitory.delete(bookToDelete);
  }
}
