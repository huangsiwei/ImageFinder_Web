package imagefinder.dao;

import imagefinder.domain.FriendlyLink;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by hsw11 on 2017/9/4.
 */
public interface FriendlyLinkRepository extends JpaRepository<FriendlyLink, Long> {

    List<FriendlyLink> findAllByDeleted(Boolean deleted);

}
