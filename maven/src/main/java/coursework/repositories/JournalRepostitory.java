package coursework.repositories;

import coursework.entity.Journal;
import org.springframework.data.repository.CrudRepository;

public interface JournalRepostitory extends CrudRepository<Journal, Long> {

}
