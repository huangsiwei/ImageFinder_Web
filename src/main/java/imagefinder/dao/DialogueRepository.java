package imagefinder.dao;

import imagefinder.domain.Dialogue;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DialogueRepository extends JpaRepository<Dialogue, Long> {
    List<Dialogue> findAllBySimpleTextIgnoreCaseContaining(String keyWords);
}
