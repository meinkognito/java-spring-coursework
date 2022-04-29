package coursework.repositories;

import coursework.entity.Client;
import org.springframework.data.repository.CrudRepository;

public interface ClientsRepostitory extends CrudRepository<Client, Long> {

}
