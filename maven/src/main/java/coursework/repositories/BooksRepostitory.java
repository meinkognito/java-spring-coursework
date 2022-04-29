package coursework.repositories;

import coursework.entity.Book;
import org.springframework.data.repository.CrudRepository;

public interface BooksRepostitory extends CrudRepository<Book, Long> {

}
